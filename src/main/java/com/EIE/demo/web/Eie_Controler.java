package com.EIE.demo.web;

import com.EIE.demo.dataService.RestResponsePage;
import com.EIE.demo.dataService.SecurityService;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.*;
import com.fasterxml.jackson.databind.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.json.JsonParseException;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller

public class Eie_Controler {

	@Autowired
	private WebService web;
	@Value("${url}")
	private String urlRest;
	@Autowired
	private SecurityService web2;
//	@Autowired
//	private FileStorageService fileStorageService;

	@RequestMapping(value = "/api/ListeEie/{type}", method = RequestMethod.GET)
	public ModelAndView stockage_affich(@PathVariable String type) {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("type", type);
		ResponseEntity<RestResponsePage<DemandeInformation>> h = web
				.getListDemandeInformationByCompte(new PageRequest(0, 100), ct.getCompteId(), type);

		if (h.getBody() != null) {
			List<DemandeInformation> searchResult = h.getBody().getContent();
			model.put("notif", searchResult);
			model.put("total", h.getBody().getTotalElements());
			model.put("number", h.getBody().getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getBody().getTotalPages());
			model.put("size", h.getBody().getSize());
			model.put("url_Admin",urlRest);
		} else {
			model.put("totalPage", 0);
		}
		model.put("user", ct);

		return new ModelAndView("demande_eie/ListeDemande", model);
	}

	@RequestMapping(value = "/api/recapEiee/{id}/{type}", method = RequestMethod.GET)
	public ModelAndView recapEiee(@PathVariable int id, @PathVariable String type) {
		Compte ct = web.getCompteConnected();
		Map<String, Object> model = new HashMap<String, Object>();
		DemandeInformation demande=null;
		if(type.equals("NT") || type.equals("EE")){
			demande=web.getDemandeInfoByIdNotice(id);
		}
		else{
			demande=web.getDemandeInfoById(id);
		}

		ListDocNotif[] l = web.listDocNotif(demande.getId_demande_information(),type);

		model.put("doc",l);
		model.put("demande", demande);
		model.put("user",web.getCompteConnected());
		model.put("url_Admin",urlRest);
		model.put("type",type);
		if(type.equals("RS")){
			model.put("titre_dyn","Renseignements préalables ");
			model.put("titre_ar","معلومات متقدمة ");
		}else if(type.equals("NT")){
			model.put("titre_dyn","Notice d'Impact sur l'Environnement");
			model.put("titre_ar","إشعار الأثر البيئي");
		}else if(type.equals("EE")){
			model.put("titre_dyn","Etude d’Impact sur l’Environnement");
			model.put("titre_ar","دراسة الأثر البيئي");
		}else{
			model.put("titre_dyn","Audit Environnemental");
			model.put("titre_ar","التدقيق البيئي");
		}
		web.changerEtat(id,demande.getType());
		return new ModelAndView("user_select/recap_EIE", model);
	}



	@RequestMapping(value = "/api/ListeEieRe", method = RequestMethod.GET)
	public ModelAndView stockage_affichRe() {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();

		ResponseEntity<RestResponsePage<DemandeInformation>> h = web
				.getListDemandeInformationByCompteStatut(new PageRequest(0, 100), ct.getCompteId(),11);

		if (h.getBody() != null) {

			List<DemandeInformation> searchResult = h.getBody().getContent();

			model.put("notif", searchResult);
			model.put("total", h.getBody().getTotalElements());

			model.put("number", h.getBody().getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getBody().getTotalPages());
			model.put("size", h.getBody().getSize());

		} else {
			model.put("totalPage", 0);
		}

		model.put("user", ct);
		return new ModelAndView("demande_eie/ListeDemandeRe", model);
	}

	@RequestMapping(value = "/api/checkUpdate/{val}", method = RequestMethod.GET)
	public @ResponseBody String checknotif(@PathVariable String val) {
		String rdrct;
		Map<String, Object> mdl = new HashMap<String, Object>();

		DemandeInformation notif = web.getDemandeInfoByNum(val);
//	        EntrepriseValOuTrait entrprs = entrepriseValOuTraitRepo.findbynotif(val);
		if (notif == null) {
			rdrct = "0";
		} else {
			rdrct = notif.getId_demande_information() + "";
		}

		return rdrct;
	}

	@RequestMapping(value = "/api/demandeinformation/{id}/{type}", method = RequestMethod.GET)
	public ModelAndView demandeinformation(@PathVariable int id,@PathVariable String type) {
		Compte ct = web.getCompteConnected();
		Object[] rg = web.tronsaction("select", " * from Region", "delete_date_time is NULL");
		Object[] cat = web.tronsaction("select", " * from Categorie", "delete_date_time is NULL");
		Object[] caracteristiquephysique = web.tronsaction("select", " id_classification,nom_fr,nom_ar from caracteristiquephysique ", " delete_date_time is null ");
		Object[] population = web.tronsaction("select", " id_population,nom_fr,nom_ar from population ", " delete_date_time is null ");
		Object[] unite_id = web.tronsaction("select", " unite_id,nom_fr,nom_ar from unite ", " delete_date_time is null ");
		DemandeInformation demande = null;
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", ct);
		model.put("rg", rg);
		model.put("cat", cat);
		if(type.equals("RS")){
			model.put("titre_dyn","Renseignements préalables ");
		}else if(type.equals("NT")){
			model.put("titre_dyn","Notice d'Impact sur l'Environnement");
		}else if(type.equals("EE")){
			model.put("titre_dyn","Etude d’Impact sur l’Environnement");
		}
		else{
			model.put("titre_dyn","Audit Environnemental");
		}


		Region[] regions = web.getArrRegion();
		Categorie[] categorie = web.getArrCategorie();
		model.put("regions",regions);
		model.put("categories",categorie);

		List<Prefecture> lp = new ArrayList<Prefecture>();
		List<Commune> lc = new ArrayList<Commune>();

		if(id!=0){
			demande = web.getDemandeInfoById(id);
			if(demande.getDetailRegion()!=null){
				List<Integer> id_region = new ArrayList<Integer>();
				List<Integer> id_prefecture = new ArrayList<Integer>();
				for (Region r : demande.getDetailRegion().getRegion()) {
					id_region.add(r.getRegionId());
				}
				for (Prefecture p : demande.getDetailRegion().getPrefectures()) {
					id_prefecture.add(p.getId_prefecture());
				}

				String id_reg = id_region.stream().map(String::valueOf)
						.collect(Collectors.joining(","));
				String id_pref = id_prefecture.stream().map(String::valueOf)
						.collect(Collectors.joining(","));

				if(!id_reg.equals(""))
					lp = web.getAllPrefectureByRegion(id_reg);
				if(!id_pref.equals(""))
					lc = web.getAllCommuneByPrefecture(id_pref);
			}
			model.put("lp",lp);
			model.put("lc",lc);
			model.put("disabled",demande.getStatut().getId_statut_projet()==13?"disabled":"");

		}
		Compte ctr = web.oneCompte(ct.getCompteId());
		model.put("societe", ctr);
		model.put("doc",web.getDocImportByType(type));
		model.put("docNotify",web.listDocNotif(id,type));
		model.put("demande", demande);
		model.put("id", id);
		model.put("url_Admin",urlRest);
		model.put("caracteristiquephysique", caracteristiquephysique);
		model.put("unite_id", unite_id);
		model.put("population", population);
		model.put("type",type);
		return new ModelAndView("demande_eie/avis_projet_add", model);
	}

	/*@RequestMapping(value = "/api/getprefecture", method = RequestMethod.GET)
	public @ResponseBody List<Prefecture> getprefecturesbyregion(@RequestParam int id){

		List<Prefecture> prefectures = web.getAllPrefectureByRegion(id);
		return prefectures;

	}*/

	@RequestMapping(value = "/api/getcommune", method = RequestMethod.GET)
	public @ResponseBody List<Commune> getcommunesbyprefecture(@RequestParam int id){

		List<Commune> communes = web.getAllCommuneByPrefecture(String.valueOf(id));
		return communes;

	}

	@RequestMapping(value = "/api/add_eie/{id}", method = RequestMethod.GET)
	public ModelAndView add_eie(@PathVariable int id) {
		Compte ct = web.getCompteConnected();
		DemandeInformation d = null;
		Map<String, Object> model = new HashMap<String, Object>();
		Object[] rg = web.tronsaction("select", " * from Region", "delete_date_time is NULL");
		Object[] cat = web.tronsaction("select", " * from Categorie", "delete_date_time is NULL");
		if (id != 0)
			d = web.getDemandeInfoById(id);

		Region[] regions = web.getArrRegion();
		Categorie[] categorie = web.getArrCategorie();
		model.put("regions",regions);
		model.put("categories",categorie);

		model.put("disabled", id!=0?"disabled":"");
		model.put("demande",d);
		model.put("user", ct);
		model.put("rg", rg);
		model.put("cat", cat);
		return new ModelAndView("demande_eie/add_eie", model);
	}

	@RequestMapping(value = "/api/addEie", method = RequestMethod.GET)
	public ModelAndView demande_add() {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", ct);
		return new ModelAndView("demande_eie/demande_add", model);
	}

	@RequestMapping(value = "/api/addDemandeInformation/{id}/{type}", method = RequestMethod.POST)
	public @ResponseBody String addDemandeInformation(@RequestBody DemandeInformation dm,@PathVariable int id,@PathVariable String type) throws IOException {
		Compte ct = web.getCompteConnected();

		dm.setCompte(ct);
		String tt = web.addDemandeInformation(dm,type);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", ct);
		if(id==0){
			model.put("id",tt);
		}
		else{
			model.put("id",id);
		}

		return tt;

	}

// add document eie

	@RequestMapping(value = "/api/addDoc/{id}/{check}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody void addDoc(@PathVariable int id,@PathVariable int check, @RequestParam MultipartFile[] fileToUpload)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		web.addDocInfo(fileToUpload, id,check);
	}
	
	
//	add doc autorisation
	
	
	@RequestMapping(value = "/api/addDocAutorisation/{id}/{check}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody void addDocAutorisation(@PathVariable int id,@PathVariable int check, @RequestParam MultipartFile[] fileToUpload)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		web.addDocAut(fileToUpload, id,check,"ZF");
	}
	
	@RequestMapping(value = "/api/addDocAutorisationG/{id}/{check}/{typeauto}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody void addDocAutorisationG(@PathVariable int id,@PathVariable String typeauto,@PathVariable int check, @RequestParam MultipartFile[] fileToUpload)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		web.addDocAut(fileToUpload, id,check,typeauto);
	}



	@RequestMapping(value = "/api/piecejointdemande/{id}/{type}", method = RequestMethod.GET)
	public ModelAndView piecejointdemande(@PathVariable int id,@PathVariable String type) {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", ct);
		model.put("iddemande", id);
		model.put("test1", id);
		model.put("type", type);
		return new ModelAndView("demande_eie/piecejointdemande", model);
	}

	@RequestMapping(value = "/api/recapEie/{id}/{type}", method = RequestMethod.GET)
	public ModelAndView recapEie(@PathVariable int id, @PathVariable String type) {
		Compte ct = web.getCompteConnected();
		Map<String, Object> model = new HashMap<String, Object>();

		DemandeInformation demande=web.getDemandeInfoById(id);

		ListDocNotif[] l = web.listDocNotif(demande.getId_demande_information(),type);
		
		model.put("doc",l);
		model.put("demande", demande);
		model.put("user",web.getCompteConnected());
		model.put("url_Admin",urlRest);
		model.put("type",type);
		if(type.equals("RS")){
			model.put("titre_dyn","Renseignements préalables ");
		}else if(type.equals("NT")){
			model.put("titre_dyn","Notice d'Impact sur l'Environnement");
		}else if(type.equals("EE")){
			model.put("titre_dyn","Etude d’Impact sur l’Environnement");
		}else{
			model.put("titre_dyn","Audit Environnemental");
		}
		return new ModelAndView("user_select/recap_EIE", model);
	}

	@RequestMapping(value = "/api/recapEieEdit/{id}/{type}", method = RequestMethod.GET)
	public ModelAndView recapEieEdit(@PathVariable int id, @PathVariable String type) {
		Compte ct = web.getCompteConnected();
		Map<String, Object> model = new HashMap<String, Object>();
		DemandeInformation demande=web.getDemandeInfoById(id);
		ListDocNotif[] l = web.listDocNotif(demande.getId_demande_information(),type);
		model.put("doc",l);
		model.put("demande", demande);
		model.put("user",web.getCompteConnected());
		model.put("url_Admin",urlRest);
		model.put("type",type);
		if(type.equals("RS")){
			model.put("titre_dyn","Renseignements préalables ");
		}else if(type.equals("NT")){
			model.put("titre_dyn","Notice d'Impact sur l'Environnement");
		}else if(type.equals("EE")){
			model.put("titre_dyn","Etude d’Impact sur l’Environnement");
		}else{
			model.put("titre_dyn","Audit Environnemental");
		}
		return new ModelAndView("user_select/recap_EIE_edit", model);
	}
	
	@RequestMapping(value = "/api/changerStatuts/{id}/{statut}", method = RequestMethod.GET)
	public @ResponseBody String changerStatuts(@PathVariable int id,@PathVariable int statut) {
		DemandeInformation drt=web.getDemandeInfoById(id);
		web.changertatutDemande(drt,statut);
		return "ok";
	}

	@RequestMapping(value = "/api/changerStatuts2/{id}/{statut}", method = RequestMethod.GET)
	public @ResponseBody String changerStatuts2(@PathVariable int id,@PathVariable int statut) {
		DemandeInformation drt=web.getDemandeInfoById(id);
		web.changertatutDemande2(drt,statut);
		return "ok";
	}

	@RequestMapping(value = "/api/test/{idNotif}", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> generatePDF(@PathVariable int idNotif) throws Exception{

		HttpHeaders headers = new HttpHeaders();
		Notification ns=web.getNotiifcationById(idNotif);
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		headers.add("Content-Disposition", "attachment; filename="+ns.getNum_notification()+".pdf");

		ByteArrayInputStream bis;
		//Notification n= notifRepo.getOnebb(ns.getIdnotifs());
		if (ns.getZf_et().equals("ZF")) {
			bis = GeneratePDFDocuments.generateDocumentDeNotification(ns);
		}
		else{
			 bis = GeneratePDFDocuments.generateDocumentDeNotification2(ns);
		}


		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));


	}

	@RequestMapping(value = "/api/updateRegionDemandeInformation/{id}/{type}", method = RequestMethod.POST)
	public @ResponseBody String updateRegionDemandeInformation(@PathVariable int id,@RequestParam String region,@RequestParam String prefecture,@RequestParam String commune,@PathVariable String type) {
		String rep = web.updateDetailRegionInstall(id,region,prefecture,commune,type);
		return rep;
	}

	@RequestMapping(value = "/api/validateDocEIE/{id}/{type}", method = RequestMethod.GET)
	public ModelAndView validateDocEIE(@PathVariable int id, @PathVariable String type) {
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("doc", web.listDocNotif(id,type));
		model.put("url_Admin", urlRest);
		model.put("id", id);
		model.put("type", type);
		model.put("user",web.getCompteConnected());
		return new ModelAndView("demande_eie/validationDoc", model);
	}
}
