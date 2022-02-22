package com.EIE.demo.web;

import com.EIE.demo.dao.EntrepriseRepo;
import com.EIE.demo.dao.NotificationRepository;
import com.EIE.demo.dataService.GenerateWordDocuments;
import com.EIE.demo.dataService.RestResponsePage;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.dataService.WebServiceRegion;
import com.EIE.demo.model.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.json.JsonParseException;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;


@Controller
public class Hatim {

	@Autowired
	private WebService webt;
	@Autowired
	private WebServiceRegion web;

	@Autowired
	private NotificationRepository notificationsRepository;

	@Autowired
	private EntrepriseRepo entrepriseRepo;

	@Value("${url}")
	private String urlRest;

	@Value("${urls}")
	private String urls;


	@RequestMapping(value = "/faq",method = RequestMethod.GET)
	public ModelAndView getlistfaq() throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		map.put("user", ct);
		List<AutorisationParam> aut = webt.getListParam();
		List<EvaluationParam> eva = webt.getListEvaParam();
		ResponseEntity<RestResponsePage<Questions>> tmp = webt.getListQuestions(new PageRequest(0,100));
		List<Questions> lq = new ArrayList<Questions>();
		if (tmp.getBody() != null) {
			lq = tmp.getBody().getContent();
		}
		map.put("questions",lq);
		map.put("aut",aut);
		map.put("eva",eva);

		return new ModelAndView("faq/listQuestion",map);
	}

	@GetMapping("/api/okPDF/{idNotif}")
	public ResponseEntity<InputStreamResource> generatePDF(@PathVariable int idNotif) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		ByteArrayInputStream bis;
		Notification ns = webt.getNotiifcationById(idNotif);
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		headers.add("Content-Disposition", "attachment; filename=mouvement_"+ns.getNum_notification()+".pdf");
		if (ns.getZf_et().equals("ZF")) {
			bis = GeneratePDFDocuments.generateDocumentDeMouvement2(ns);
		}
		else{
			 bis = GeneratePDFDocuments.generateDocumentDeMouvement(ns);
		}
		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}



	@RequestMapping(value = "/addnewquestions",method = RequestMethod.GET)
	public ModelAndView addnewquestions() throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		return new ModelAndView("faq/addNewQuestion",map);
	}

	@RequestMapping(value = "/savenewquestions",method = RequestMethod.POST)
	public String addnewquestions(@RequestBody Questions question) throws Exception {
		Map<String,Object> map = new HashMap<>();
		question.setCompte(webt.getCompteConnected());
		webt.saveQuestion(question);
		Compte ct = webt.getCompteConnected();
		return "redirect:/faq";
	}


	@RequestMapping(value = "/deletequestion/{id}",method = RequestMethod.GET)
	public String deleteQuestion(@PathVariable int id) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Questions q = webt.getQuestionById(id);
		q.setDeleteDateTime(new Date());
		webt.saveQuestion(q);
		Compte ct = webt.getCompteConnected();
		return "redirect:/faq";
	}

	@RequestMapping(value = "/updatequestion/{id}",method = RequestMethod.GET)
	public ModelAndView updatequestion(@PathVariable int id) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Questions q = webt.getQuestionById(id);
		Compte ct = webt.getCompteConnected();
		map.put("question",q);
		map.put("user",ct);
		return new ModelAndView("/addNewQuestion",map);
	}


	@RequestMapping(value = "/getListReponse/{id}",method = RequestMethod.GET)
	public ModelAndView getListReponse(@PathVariable int id) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		map.put("user", ct);
		ResponseEntity<RestResponsePage<Reponse>> h = webt.getListReponseByIdQuestion(id,new PageRequest(0, 100));
		if (h.getBody() != null) {
			List<Reponse> searchResult = h.getBody().getContent();
			map.put("reponse", searchResult);
			map.put("total", h.getBody().getTotalElements());
			map.put("number", h.getBody().getNumber());
			map.put("page", 0);
			map.put("totalPage", h.getBody().getTotalPages());
			map.put("size", h.getBody().getSize());
		} else {
			map.put("totalPage", 0);
		}
		map.put("q",webt.getQuestionById(id));
		return new ModelAndView("faq/listReponse",map);
	}


	@RequestMapping(value = "/AjouterRponse/{id}",method = RequestMethod.POST)
	public @ResponseBody String AjouterRponse(@PathVariable int id,@RequestBody Reponse r,HttpServletRequest request) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		r.setCompte(ct);
		webt.saveReponse(r,id);

		Questions q = webt.getQuestionById(id);

		return "ok" ;
	}

	@GetMapping(value = "/deletereponse/{id_ques}/{idrep}")
	public String deletereponse(@PathVariable int id_ques,@PathVariable int idrep) throws Exception {
		Map<String,Object> map = new HashMap<>();

		webt.deleteReponse(id_ques,idrep);

		return "redirect:/api/getListReponse/"+id_ques;
	}

	@GetMapping(value = "/getReponseById/{idrep}")
	public @ResponseBody Map getReponseById(@PathVariable int idrep) throws Exception {
		Map<String,Object> map = new HashMap<>();

		webt.getCompteConnected();
		map.put("user",webt.getCompteConnected());
		map.put("reponse",webt.getReponseById(idrep));
		return map;
	}

	@RequestMapping(value = "/contact/{id}",method = RequestMethod.GET)
	public ModelAndView  getContactById(@PathVariable int id) throws Exception {
		Map<String,Object> map = new HashMap<>();

		map.put("user",webt.getCompteConnected());
		map.put("disabled",id==0?"":"disabled");
		return new ModelAndView("contact/contact",map);
	}

	@RequestMapping(value = "addnewmessagecontact",method = RequestMethod.POST)
	public String addnewmessagecontact(@RequestBody ContactMessage msg) throws Exception {
		Map<String,Object> map = new HashMap<>();
		msg.setCompte(webt.getCompteConnected());
		webt.addMsgContact(msg);
		map.put("user",webt.getCompteConnected());
		return "redirect:/contact/0";
	}

	@RequestMapping(value = "/videoList",method = RequestMethod.GET)
	public ModelAndView videoList() throws Exception {
		Map<String,Object> map = new HashMap<>();

		map.put("user",webt.getCompteConnected());
		return new ModelAndView("aide/videolist",map);
	}

	@RequestMapping(value = "/CatalogueDesDechet",method = RequestMethod.GET)
	public ModelAndView CatalogueDesDechet() throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("user",webt.getCompteConnected());
		map.put("listF",webt.getListAllTransporteurParam());
		map.put("code",webt.getListCodeTabByClassif(1));
		return new ModelAndView("aide/CatalogueDesDechet",map);
	}
	//**************
	@RequestMapping(value = "/CatalogueDesDechet1",method = RequestMethod.GET)
	public ModelAndView CatalogueDesDechet1() throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("user",webt.getCompteConnected());
		//map.put("listF",webt.getListAllTransporteurParam());
		map.put("listPr",webt.getListCodeParent());
		map.put("listC",webt.getListAllCode());
		return new ModelAndView("aide/CatalogueDesDechet1",map);
	}
	//**************

	@RequestMapping(value = "/codebyclassification/{id}",method = RequestMethod.GET)
	public ModelAndView codebyclassification(@PathVariable  int id) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("listC",webt.getListAllCode1(id));
		return new ModelAndView("aide/table",map);
	}

	@RequestMapping(value = "/codebyParentCategorie/{id}/{classification}",method = RequestMethod.GET)
	public ModelAndView codebyParentCategorie(@PathVariable  int id,@PathVariable int classification) throws Exception {
		Map<String,Object> map = new HashMap<>();
		List<Code> listCodePrents=webt.getListCodeByParentCategorie(id,classification);
		map.put("listC",listCodePrents);
		return new ModelAndView("aide/table",map);
	}




	@RequestMapping(value = "/guide",method = RequestMethod.GET)
	public ModelAndView guideList() throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("user",webt.getCompteConnected());
		return new ModelAndView("aide/guide",map);
	}

	@RequestMapping(value = "/faqA/{type}",method = RequestMethod.GET)
	public ModelAndView faq(@PathVariable  String type) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		map.put("user", ct);
		map.put("questions",webt.getListAllQuestion(type));
		return new ModelAndView("faq/div",map);
	}

	@RequestMapping(value = "/getQuestionByAutorisation",method = RequestMethod.POST)
	public ModelAndView getQuestionByAutorisation(@RequestParam String autor) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		map.put("user", ct);
		map.put("type",autor);
		ResponseEntity<RestResponsePage<Questions>> h = webt.getListQuestionsByAuto(autor,new PageRequest(0, 100));

		if (h.getBody()!=null)
			map.put("questions",h.getBody().getContent());

		return new ModelAndView("faq/listQuestion",map);
	}



	/*-----------------------------------------------------------------------------------------------
	-----------------------------------collecte et transport des produits Dangereux------------------
	------------------------------------------------------------------------------------------------*/

	@RequestMapping(value = "/api/getListCollectTrans",method = RequestMethod.GET)
	public ModelAndView getListCollectTrans() throws Exception {
		Compte ct = webt.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();


		ResponseEntity<RestResponsePage<CollecteTransporteur>> h = webt.getListCollectesByCompte(new PageRequest(0, 100),
				ct.getCompteId());

		if (h.getBody() != null) {

			List<CollecteTransporteur> searchResult = h.getBody().getContent();

			model.put("notif", searchResult);
			model.put("total", h.getBody().getTotalElements());
			model.put("type", "CT");

			model.put("number", h.getBody().getNumber());
			model.put("page", 0);
			model.put("url_admin",urlRest);
			model.put("totalPage", h.getBody().getTotalPages());
			model.put("size", h.getBody().getSize());

		} else {
			model.put("totalPage", 0);
		}

		model.put("user", ct);

		return new ModelAndView("collecte_trans/ListeCollecte",model);
	}


	@RequestMapping(value = "/api/addCollectTrans/{id}/{typeRenouv}",method = RequestMethod.GET)
	public ModelAndView addCollectTrans(@PathVariable int id,@PathVariable String typeRenouv) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		map.put("user", ct);
		map.put("type","CT");
		List<Code> c = webt.getListcodeTab();
		map.put("code",c);
		map.put("typeRenouv",typeRenouv);
		List<EquipementSecurite> securite = webt.getListEquipementSecurite();
		List<TypeVehicule> typeVehicules = webt.getListAllTypeVehicule();
		List<TypeConteneurs> typeConteneurs = webt.getListAllTypeConteneur();
		List<Region> regions = webt.getListAllRegion();
		map.put("doc", webt.listDocImportByType(1,"CT"));
		ListDocNotif[] l = webt.listDocNotif(id,"CT");
		map.put("doc2", l);

		Object[] prefectures = webt.tronsaction("select", " id_prefecture,nom_fr,nom_ar  from prefecture ",
				" delete_date_time is null ");

		Object[] region = webt.tronsaction("select", " region_id,nom_fr,nom_ar  from region ",
				" delete_date_time is null ");

		CollecteTransporteur collect = webt.getCollecteById(id,ct.getCompteId(),typeRenouv);
		map.put("collect",collect);
		map.put("region", region);
		map.put("prefectures", prefectures);
		int count = 0;
		if(collect!=null && collect.getVehicules().size()>0){
			for (Vehicules v: collect.getVehicules()){
				if(v.getCommantaire()!=null){
					count++;
				}
			}
		}
		int cpt = 0;
		if(collect!=null && l.length>0){
			for (ListDocNotif doc: l){
				if(doc.getNom_ar()!=null && !doc.getNom_ar().equals("oui")){
					cpt++;
				}
			}
		}

		map.put("id",id);
		map.put("count",count);
		map.put("cpt",cpt);
		map.put("typeVehicules",typeVehicules);
		map.put("typeConteneurs",typeConteneurs);
		map.put("securite",securite);
		map.put("url_Admin",urlRest);
		map.put("docNotify",webt.listDocNotif(id,"CT"));
		return new ModelAndView("collecte_trans/addCollecteTransport",map);
	}

	@RequestMapping(value = "/api/completerDocument/{id}",method = RequestMethod.GET)
	public ModelAndView completerDocument(@PathVariable int id) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		map.put("user", ct);
		map.put("type","CT");
		List<Code> c = webt.getListcodeTab();
		map.put("code",c);
		List<EquipementSecurite> securite = webt.getListEquipementSecurite();
		List<TypeVehicule> typeVehicules = webt.getListAllTypeVehicule();
		List<TypeConteneurs> typeConteneurs = webt.getListAllTypeConteneur();
		map.put("doc", webt.listDocImportByType(1,"CT"));
		ListDocNotif[] l = webt.listDocNotif(id,"CT");
		map.put("doc2", l);
		CollecteTransporteur collect = webt.getCollecteById(id,ct.getCompteId());
		map.put("collect",collect);
		int count = 0;
		if(collect!=null && collect.getVehicules().size()>0){
			for (Vehicules v: collect.getVehicules()){
				if(v.getCommantaire()!=null){
					count++;
				}
			}
		}
		int cpt = 0;
		if(collect!=null && l.length>0){
			for (ListDocNotif doc: l){
				if(doc.getNom_ar()!=null && !doc.getNom_ar().equals("oui")){
					cpt++;
				}
			}
		}

		map.put("id",id);
		map.put("count",count);
		map.put("cpt",cpt);
		map.put("typeVehicules",typeVehicules);
		map.put("typeConteneurs",typeConteneurs);
		map.put("securite",securite);
		map.put("url_Admin",urlRest);
		map.put("docNotify",webt.listDocNotif(id,"CT"));
		return new ModelAndView("collecte_trans/completer_les_documents",map);
	}

	@RequestMapping(value = "/api/getVehiculeById/{id}/{id_coll}",method = RequestMethod.GET)
	public ModelAndView getVehiculeById(@PathVariable int id,@PathVariable int id_coll) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		CollecteTransporteur collect = webt.getCollecteById(id_coll,ct.getCompteId());
		map.put("user",ct);
		map.put("collect",collect);
		map.put("vehicules",webt.getVehiculeById(id));
		ListDocNotif[] l = webt.listDocNotif(id,"CT");
		map.put("doc2", l);
		int count = 0;
		if(collect!=null && collect.getVehicules().size()>0){
			for (Vehicules v: collect.getVehicules()){
				if(v.getCommantaire()!=null){
					count++;
				}
			}
		}
		int cpt = 0;
		if(collect!=null && l.length>0){
			for (ListDocNotif doc: l){
				if(doc.getNom_ar()!=null && !doc.getNom_ar().equals("oui")){
					cpt++;
				}
			}
		}

		map.put("id",id);
		map.put("count",count);
		map.put("cpt",cpt);
		map.put("securite",webt.getListEquipementSecurite());
		map.put("url_admin",urlRest);
		return new ModelAndView("collecte_trans/tableandFormVehicule",map);
	}

	@RequestMapping(value = "/api/ChangerStatutCT/{id}",method = RequestMethod.GET)
	@ResponseBody
	public String ChangerStatutCt(@PathVariable int id) throws Exception {
		webt.changerStatutCT(id);
		return "OK";
	}

	@RequestMapping(value = "/api/ChangerStatutIT/{id}",method = RequestMethod.GET)
	@ResponseBody
	public String ChangerStatutIT(@PathVariable int id) throws Exception {
		webt.changerStatutIT(id);
		return "OK";
	}

	@RequestMapping(value = "/api/ChangerTypeIT/{id}",method = RequestMethod.GET)
	@ResponseBody
	public String ChangerTypeIT(@PathVariable int id) throws Exception {
		webt.changerTypeIT(id);
		return "OK";
	}



	@RequestMapping(value = "/api/saveVehicule", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ModelAndView saveVehicule(@RequestParam String v,@RequestParam int id_collect,
									 @RequestParam MultipartFile[] fileToUpload, @RequestParam MultipartFile[] equipementsecurite)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();

		String id = webt.saveVehicule(fileToUpload,equipementsecurite,id_collect,v);
		CollecteTransporteur col = webt.getCollecteById(id_collect,webt.getCompteConnected().getCompteId());
		map.put("collect",col);
		map.put("url_Admin",urlRest);
		return new ModelAndView("collecte_trans/tableVehicule",map);
	}

	@RequestMapping(value = "/api/savePaysAutorite/{pays}", method = RequestMethod.GET)
	public ModelAndView savePaysAutorite(@PathVariable int pays)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.savePaysAutorite(pays);
		map.put("url_Admin",urlRest);
		return new ModelAndView("autorisationPublic/tablePaysautorite",map);
	}

	@RequestMapping(value = "/api/deleteVehicule/{id}/{id_collect}", method = RequestMethod.GET)
	public ModelAndView deleteVehicule(@PathVariable int id,@PathVariable int id_collect) throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.deleteVehiculeById(id,id_collect,webt.getCompteConnected().getCompteId());
		CollecteTransporteur v = webt.getCollecteById(id_collect,webt.getCompteConnected().getCompteId());
		map.put("collect",v);
		map.put("url_Admin",urlRest);
		return new ModelAndView("collecte_trans/tableandFormVehicule",map);
	}

	@RequestMapping(value = "/api/deletePaysautorite/{id}/{id_notif}", method = RequestMethod.GET)
	public ModelAndView deletePaysautorite(@PathVariable int id,@PathVariable int id_notif) throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.deletePaysautoriteById(id,id_notif,webt.getCompteConnected().getCompteId());
		Notification n = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		Object[] pays = webt.tronsaction("select", " pays_id,nom_fr,nom_ar from pays ", " delete_date_time is null ");
		map.put("pays1",pays);
		map.put("notif",n);
		map.put("url_Admin",urlRest);
		return new ModelAndView("autorisationPublic/tablePaysautorite",map);
	}

	@RequestMapping(value = "/api/getVehiculeOne", method = RequestMethod.POST)
	public @ResponseBody Vehicules getVehiculeOne(@RequestParam String id)
			throws JsonParseException, IOException, MessagingException {
		int idCollect = Integer.parseInt(id);
		Vehicules v = webt.getVehiculeById(idCollect);
		return v;
	}

	@RequestMapping(value = "/api/getvehicule", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getvehicule(@RequestParam String id)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		int id_collect = Integer.parseInt(id);
		CollecteTransporteur v =  webt.getCollecteById(id_collect,webt.getCompteConnected().getCompteId());
		map.put("vehicules",v.getVehicules());
		map.put("url_Admin",urlRest);
		map.put("codes",v.getCode());
		map.put("user",webt.getCompteConnected());
		return map;
	}

	@RequestMapping(value = "/api/getcode", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getcode(@RequestParam String id)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		int id_install = Integer.parseInt(id);
		Installation v =  webt.getInstallationById(id_install,webt.getCompteConnected().getCompteId());
		map.put("url_Admin",urlRest);
		map.put("codes",v.getCode());
		map.put("typeIT",v.getType());
		map.put("user",webt.getCompteConnected());
		return map;
	}


	@RequestMapping(value = "/api/getOnedocNotif", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getOnedocNotif(@RequestParam String id)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		int id_collect = Integer.parseInt(id);
		CollecteTransporteur v =  webt.getCollecteById(id_collect,webt.getCompteConnected().getCompteId());
		map.put("collect",v);
		map.put("docNotify",webt.listDocNotif(Integer.parseInt(id),"CT"));
		map.put("url_Admin",urlRest);
		return map;
	}

	@RequestMapping(value = "/api/validateDocCt/{id}", method = RequestMethod.GET)
	public ModelAndView validateDocCt(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("doc", webt.listDocNotif(id,"CT"));
		model.put("url_Admin", urlRest);
		model.put("id", id);

		return new ModelAndView("collecte_trans/validationDocCT", model);
	}


	@RequestMapping(value = "/api/setcode/{id_coll}/{id_code}/{type}", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> setcode(@PathVariable int id_coll,@PathVariable int id_code,@PathVariable String type)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.setcode(id_coll,id_code,webt.getCompteConnected().getCompteId(),type);
		CollecteTransporteur v =  webt.getCollecteById(id_coll,webt.getCompteConnected().getCompteId());
		map.put("user",webt.getCompteConnected());
		map.put("codes",v.getCode());
		return map;
	}

	@RequestMapping(value = "/api/deleteCodeTmp/{id_coll}/{id_code}/{type}", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> deleteCodeTmp(@PathVariable int id_coll,@PathVariable int id_code,@PathVariable String type)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.deleteCodeTmp(id_coll,id_code,webt.getCompteConnected().getCompteId(),type);
		CollecteTransporteur v =  webt.getCollecteById(id_coll,webt.getCompteConnected().getCompteId());
		map.put("user",webt.getCompteConnected());
		map.put("codes",v.getCodeTmp());
		return map;
	}

	@RequestMapping(value = "/api/deleteCodeTmp_inst/{id_inst}/{id_code}/{type}", method = RequestMethod.GET)
	public ModelAndView  deleteCodeTmp_inst(@PathVariable int id_inst,@PathVariable int id_code,@PathVariable String type)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.deleteCodeTmp_inst(id_inst,id_code,webt.getCompteConnected().getCompteId(),type);
		Installation v =  webt.getInstallationById(id_inst,webt.getCompteConnected().getCompteId());
		map.put("inst", v);
		map.put("user",webt.getCompteConnected());
		map.put("codes",v.getCode());
		return new ModelAndView("installation/MesCodes",map);
	}

	@RequestMapping(value = "/api/setcodeInstall/{id_inst}/{id_code}/{type}", method = RequestMethod.GET)
	public ModelAndView setcodeinstall(@PathVariable int id_inst,@PathVariable int id_code,@PathVariable String type)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.setcodeinstall(id_inst,id_code,webt.getCompteConnected().getCompteId(),type);
		Installation v =  webt.getInstallationById(id_inst,webt.getCompteConnected().getCompteId());
		map.put("inst", v);
		map.put("user",webt.getCompteConnected());
		map.put("codes",v.getCode());
		return new ModelAndView("installation/MesCodes2",map);
	}

	@RequestMapping(value = "/api/deleteAllByCode/{id_inst}", method = RequestMethod.GET)
	public ModelAndView deleteAllByCode(@PathVariable int id_inst)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.deleteAllCodeByInstall(id_inst,webt.getCompteConnected().getCompteId());
		Installation v =  webt.getInstallationById(id_inst,webt.getCompteConnected().getCompteId());
		map.put("inst", v);
		map.put("user",webt.getCompteConnected());
		map.put("codes",v.getCode());
		return new ModelAndView("installation/MesCodes2",map);
	}

	@GetMapping("/api/generate_pdf_installation/{id}")
	public ResponseEntity<InputStreamResource> generate_pdf_installation(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		Installation ns = webt.getIndtallationById(id);
		ListDocNotif[] l = webt.listDocNotif(ns.getId_installation(),"IT");
		headers.add("Content-Disposition", "attachment; filename="+ns.getNum_demande()+".pdf");
		ByteArrayInputStream bis = GeneratePDFDocuments.generateDocumentDInstallation(ns,l,urls);

		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@RequestMapping(value = "/api/getOneCollecte", method = RequestMethod.POST)
	public @ResponseBody String getOneCollecte(@RequestParam int id)
			throws JsonParseException, IOException, MessagingException {

		CollecteTransporteur v =  webt.getCollecteByNumDemande2(id,webt.getCompteConnected().getCompteId());
		if(v!=null){
			return String.valueOf(v.getId_collecte());
		}else{
			return "not existe";
		}
	}

	@RequestMapping(value = "/api/UpdateRegion", method = RequestMethod.POST)
	public ModelAndView updateRegion(@RequestParam int id,@RequestParam int regionId)
			throws JsonParseException, IOException, MessagingException {
		    List<Prefecture> prefecture=webt.updateRegion(id,regionId);
		    Map<String,Object> model = new HashMap<>();
		    model.put("prefectures",prefecture);
		    model.put("notification",webt.getNotificationByIdComptId(id,webt.getCompteConnected().getCompteId()));
		return new ModelAndView("user_select/auto_load_options",model);
	}

	@RequestMapping(value = "/api/UpdateRegionCT", method = RequestMethod.POST)
	public ModelAndView updateRegionCT(@RequestParam int regionId)
			throws IOException{
		Map<String,Object> model = new HashMap<>();
		List<Prefecture> prefecture=webt.updateRegionCT(regionId);
		model.put("prefectures",prefecture);
		return new ModelAndView("user_select/auto_load_CT",model);
	}

	@RequestMapping(value = "/api/UpdatePrefecture", method = RequestMethod.POST)
	public @ResponseBody String updatePrefecture(@RequestParam int id,@RequestParam int prefectureId)
			throws JsonParseException, IOException, MessagingException {
		webt.updatePrefecture(id,prefectureId);
		return String.valueOf(0);
	}

	@RequestMapping(value = "/api/UpdatePrefectureCT", method = RequestMethod.POST)
	public @ResponseBody String UpdatePrefectureCT(@RequestParam int id,@RequestParam int prefectureId)
			throws JsonParseException, IOException, MessagingException {
		webt.updatePrefectureCT(id,prefectureId);
		return String.valueOf(0);
	}

	@RequestMapping(value = "/api/getOneInstall", method = RequestMethod.POST)
	public @ResponseBody String getOneInstall(@RequestParam String id)
			throws JsonParseException, IOException, MessagingException {

		Installation v =  webt.getInstallByNumDemande(id,webt.getCompteConnected().getCompteId());
		if(v!=null){
			return String.valueOf(v.getId_installation());
		}else{
			return "not existe";
		}
	}

	@RequestMapping(value = "/api/getOneNotification", method = RequestMethod.POST)
	public @ResponseBody String getOneNotification(@RequestParam String id,@RequestParam String type)
			throws JsonParseException, IOException, MessagingException {

		Notification v =  webt.getNotificationByNumDemande(id,webt.getCompteConnected().getCompteId(),type);
		if(v!=null){
			return String.valueOf(v.getId_notification());
		}else{
			return "not existe";
		}
	}


	@RequestMapping(value = "/api/checkUserHasCollecte/{type}", method = RequestMethod.GET)
	public ModelAndView checkUserHasCollecte(@PathVariable String type)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> model = new HashMap<>();
		Integer nbr = 0;
		if(type.equals("CT")){
			nbr = webt.getNombreCollecteByUser(webt.getCompteConnected().getCompteId(),"renouv");
		}else if(type.equals("IT")){
			nbr = webt.getNombreInstaByUser(webt.getCompteConnected().getCompteId(),"renouv");
		}

		if(nbr>0){
			model.put("renouv","oui");
		}else{
			model.put("renouv","non");
		}
		model.put("url_admin",urlRest);
		model.put("user",webt.getCompteConnected());
		model.put("type",type);
		if(type.equals("CT")){
			CollecteTransporteur colecteParent = webt.getOneCollecteByUserFirst(webt.getCompteConnected().getCompteId());
			String etat ="non";
			List<Integer> list = webt.getAllStatutAvenant(webt.getCompteConnected().getCompteId());
			if(list.contains(19) || list.contains(20) || list.contains(23) || list.contains(50) || list.contains(42) || colecteParent.getStatut().getId_statut_projet()==19 || colecteParent.getStatut().getId_statut_projet()==20 || colecteParent.getStatut().getId_statut_projet()==23|| colecteParent.getStatut().getId_statut_projet()==50 || colecteParent.getStatut().getId_statut_projet()==42 || colecteParent.getStatut().getId_statut_projet()==28){
				etat = "oui";
			}
			//CollecteTransporteur v = webt.getCollecteById_v2(webt.getCompteConnected().getCompteId());
			List<CollecteTransporteur> listCollecteAncienne = webt.getAllCollecteNumAncienne(colecteParent.getId_collecte(),webt.getCompteConnected().getCompteId());
			model.put("collect",colecteParent);
			model.put("etat",etat);
			model.put("listStatut",list);
			model.put("listCollecte",listCollecteAncienne);
			ListDocNotif[] l = webt.listDocNotif(colecteParent.getId_collecte(),type);
			model.put("doc",l);
			model.put("url_Admin",urlRest);
			return new ModelAndView("user_select/recap_CT",model);
		}/*else if(type.equals("IT")){
			Installation ins = webt.getInstallById_v2(webt.getCompteConnected().getCompteId());
			ListDocNotif[] l = webt.listDocNotif(ins.getId_installation(),type);
			model.put("doc",l);
			model.put("installation",ins);
			model.put("url_Admin",urlRest);
			Notification[] n=null;
			n = webt.getNotificationNotDepo(webt.getCompteConnected().getCompteId(),type);
			model.put("notif",n);

			Notification[] n1=null;
			n1 = webt.getNotificationAll(webt.getCompteConnected().getCompteId(),type);
			model.put("notifall",n1);
			return new ModelAndView("user_select/recap_IT",model);
		}*/
		else if(type.equals("IT")){
			Installation[] n1=null;
			n1 = webt.getInstallationAll(webt.getCompteConnected().getCompteId());
			model.put("install",n1);
			return new ModelAndView("user_select/card_IT_choix",model);
		}
		Notification[] n=null;
		n = webt.getNotificationNotDepo(webt.getCompteConnected().getCompteId(),type);
		model.put("notif",n);

		Notification[] n1=null;
		n1 = webt.getNotificationAll(webt.getCompteConnected().getCompteId(),type);
		model.put("notifall",n1);
		return new ModelAndView("user_select/card_ZF_choix",model);
	}

	@RequestMapping(value = "/api/CollecteRecap/{id}", method = RequestMethod.GET)
	public ModelAndView CollecteRecap(@PathVariable int id)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> model = new HashMap<>();
		Integer nbr = 0;
		nbr = webt.getNombreCollecteByUser(webt.getCompteConnected().getCompteId(),"renouv");
		if(nbr>0){
			model.put("renouv","oui");
		}else{
			model.put("renouv","non");
		}

		String etat ="non";
		List<Integer> list = webt.getAllStatutAvenant(webt.getCompteConnected().getCompteId());
		if(list.contains(19) || list.contains(20) || list.contains(23) || list.contains(50) || list.contains(42)){
			etat = "oui";
		}
		model.put("etat",etat);
		model.put("listStatut",list);
		model.put("url_admin",urlRest);
		model.put("user",webt.getCompteConnected());
		CollecteTransporteur v = webt.getCollecteById(id,webt.getCompteConnected().getCompteId());
		//Object[] listCollecteAncienne = webt.getAllCollecteNumAncienne(v.getId_collecte(),webt.getCompteConnected().getCompteId());
		List<CollecteTransporteur> listCollecteAncienne = webt.getAllCollecteNumAncienne(v.getId_collecte(),webt.getCompteConnected().getCompteId());
		model.put("collect",v);
		model.put("listCollecte",listCollecteAncienne);
		ListDocNotif[] l = webt.listDocNotif(v.getId_collecte(),"CT");
		model.put("doc",l);
		model.put("url_Admin",urlRest);
		return new ModelAndView("user_select/recapCT",model);

	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() {
		Map<String,Object> model = new HashMap<>();
		return new ModelAndView("demandez_compte/index",model);
	}

	@RequestMapping(value = "/api/checkUserHasRecap/{type}", method = RequestMethod.GET)
	public ModelAndView checkUserHasRecap(@PathVariable String type)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> model = new HashMap<>();
		Integer nbr = 0;
		if(type.equals("CT")){
			nbr = webt.getNombreCollecteByUser(webt.getCompteConnected().getCompteId(),"renouv");
		}else if(type.equals("IT")){
			nbr = webt.getNombreInstaByUser(webt.getCompteConnected().getCompteId(),"renouv");
		}

		if(nbr>0){
			model.put("renouv","oui");
		}else{
			model.put("renouv","non");
		}
		model.put("url_admin",urlRest);
		model.put("user",webt.getCompteConnected());
		model.put("type",type);
		if(type.equals("CT")){
			CollecteTransporteur v = webt.getCollecteById_v2(webt.getCompteConnected().getCompteId());
			model.put("collect",v);
			ListDocNotif[] l = webt.listDocNotif(v.getId_collecte(),type);
			model.put("doc",l);
			model.put("url_Admin",urlRest);
			return new ModelAndView("user_select/recap_CT_edit",model);
		}else if(type.equals("IT")){
			Installation ins = webt.getInstallById_v2(webt.getCompteConnected().getCompteId());
			ListDocNotif[] l = webt.listDocNotif(ins.getId_installation(),type);
			model.put("doc",l);
			model.put("installation",ins);
			model.put("url_Admin",urlRest);
			return new ModelAndView("user_select/recap_IT_edit",model);
		}
		Notification[] n=null;
		n = webt.getNotificationNotDepo(webt.getCompteConnected().getCompteId(),type);
		model.put("notif",n);

		Notification[] n1=null;
		n1 = webt.getNotificationAll(webt.getCompteConnected().getCompteId(),type);
		model.put("notifall",n1);
		return new ModelAndView("user_select/card_ZF_choix",model);
	}


	@RequestMapping(value = "/api/checkUserHasCollectee/{type}", method = RequestMethod.GET)
	public ModelAndView checkUserHasCollectee(@PathVariable String type)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> model = new HashMap<>();
		Integer nbr = 0;
		if(type.equals("CT")){
			nbr = webt.getNombreCollecteByUser(webt.getCompteConnected().getCompteId(),"renouv");
		}else if(type.equals("IT")){
			nbr = webt.getNombreInstaByUser(webt.getCompteConnected().getCompteId(),"renouv");
		}

		if(nbr>0){
			model.put("renouv","oui");
		}else{
			model.put("renouv","non");
		}
		model.put("url_admin",urlRest);
		model.put("user",webt.getCompteConnected());
		model.put("type",type);
		if(type.equals("CT")){
			CollecteTransporteur v = webt.getCollecteById_v2(webt.getCompteConnected().getCompteId());
			webt.changerEtat(v.getId_collecte(),"CT");
			model.put("collect",v);
			ListDocNotif[] l = webt.listDocNotif(v.getId_collecte(),type);
			model.put("doc",l);
			model.put("url_Admin",urlRest);
			return new ModelAndView("user_select/recap_CT",model);
		}else if(type.equals("IT")){
			Installation ins = webt.getInstallById_v2(webt.getCompteConnected().getCompteId());
			//webt.changerStatutInstall(ins.getId_installation());
			webt.changerEtat(ins.getId_installation(),"IT");
			model.put("installation",ins);
			ListDocNotif[] l = webt.listDocNotif(ins.getId_installation(),type);
			model.put("doc",l);
			model.put("user",webt.getCompteConnected());
			model.put("url_Admin",urlRest);

			return new ModelAndView("user_select/recap_IT",model);
		}
		Notification[] n=null;
		n = webt.getNotificationNotDepo(webt.getCompteConnected().getCompteId(),type);
		model.put("notif",n);
		Notification[] n1=null;
		n1 = webt.getNotificationAll(webt.getCompteConnected().getCompteId(),type);
		model.put("notifall",n1);
		return new ModelAndView("user_select/card_ZF_choix",model);
	}

	@RequestMapping(value = "/api/changeEtatIT/{id}", method = RequestMethod.POST)
	public @ResponseBody int changeEtatIT(@PathVariable int id) throws UnknownHostException, JsonProcessingException, MessagingException, UnsupportedEncodingException {
		Installation n = webt.changerStatutInstall(id);
		webt.getInstallById(n.getId_installation());
		return 0;
	}

	@RequestMapping(value = "/api/checkUserDispatch/{type}", method = RequestMethod.GET)
	public  String checkUserDispatch(@PathVariable String type) {
		Map<String,Object> model = new HashMap<>();
		int nbr = 0;
		if(type.equals("CT")){
			nbr = webt.getNombreCollecteByUser(webt.getCompteConnected().getCompteId(),"all");
			if(nbr==0){
				return "redirect:/api/addCollectTrans/0/N";
			}
		}

		if(type.equals("IT")){
			nbr = webt.getNombreInstaByUser(webt.getCompteConnected().getCompteId(),"all");
			RestResponsePage<Installation> i = webt.getListInstallationByCompte(new PageRequest(0, 100),webt.getCompteConnected().getCompteId()).getBody();
			nbr += (i==null)?0:i.getSize();
			if(nbr==0){
				return "redirect:/api/addInstallation/0/N";
			}
		}

		if(type.equals("ZF") || type.equals("ET") || type.equals("XD") || type.equals("TR")){
			nbr = webt.getNombreNotifUser(webt.getCompteConnected().getCompteId(),"all",type);
			RestResponsePage<Notification> i = webt.getListNotiifcationByCompte(new PageRequest(0, 100),webt.getCompteConnected().getCompteId(), "n", type).getBody();
			nbr += (i==null)?0:i.getSize();
			if((nbr==0 && type.equals("ZF")) ||(nbr==0 && type.equals("XD"))){
				return "redirect:/api/addNumNotification/"+type+"/0";
			}else if(nbr==0 && (!type.equals("ZF") || !type.equals("XD"))){

				return "redirect:/api/addDemandNotification/0/"+type+"/N";
			}
		}
		return "redirect:/api/checkUserHasCollecte/"+type;

	}

	@RequestMapping(value = "/api/ListToChoixRenouv/{type}", method = RequestMethod.POST)
	public ModelAndView ListToChoixRenouv(@PathVariable String type){
		List<CollecteTransporteur> collectes = new ArrayList<CollecteTransporteur>();
		List<Installation> inst = new ArrayList<Installation>();
		Map<String,Object> model = new HashMap<>();
		model.put("renouv","oui");
		model.put("type",type);
		model.put("user",webt.getCompteConnected());

		if(type.equals("CT")){
			collectes = webt.getListCollectesRenouvByCompte(webt.getCompteConnected().getCompteId());
		}else if(type.equals("IT")){
			inst = webt.getListInstallRenouvByCompte(webt.getCompteConnected().getCompteId());
		}

		model.put("installation",inst);
		model.put("collects",collectes);

		return new ModelAndView("user_select/ListeAutorisation_renouv",model);
	}


	@RequestMapping(value = "/api/newCollecteRenouv/{id}", method = RequestMethod.GET)
	public String newCollecteRenouv(@PathVariable int id) {
		CollecteTransporteur v =  webt.getCollecteByNumDemande2(id,webt.getCompteConnected().getCompteId());
		return "redirect:/api/addCollectTrans/"+v.getId_collecte()+"/R";
	}

	@RequestMapping(value = "/api/newCollecteAvenant/{id}", method = RequestMethod.GET)
	public String newCollecteAvenant(@PathVariable int id) {
		CollecteTransporteur v =  webt.getCollecteByNumDemande3(id,webt.getCompteConnected().getCompteId());
		return "redirect:/api/addCollectTrans/"+v.getId_collecte()+"/AV";
	}

	@RequestMapping(value = "/api/getCollectById/{id}/{type}", method = RequestMethod.POST)
	public ModelAndView getCollectById(@PathVariable String id,@PathVariable String type) {

		Map<String,Object> map = new HashMap<>();
		ListDocNotif[] l =null;
		CollecteTransporteur v = null;
		Installation ins = null;
		Notification notif = null;

		if(type.equals("CT"))
			v =  webt.getCollecteByNumDemande(id,webt.getCompteConnected().getCompteId());
		if(type.equals("IT"))
			ins = webt.getInstallByNumAndUser(id,webt.getCompteConnected().getCompteId());
		if(type.equals("ZF") || type.equals("ET") || type.equals("TR") || type.equals("XD"))
			notif = webt.getNotiifcationByNumZFET(id,type);

		if(v!=null && !type.isEmpty())
			l = webt.listDocNotif(v.getId_collecte(),type);
		if(ins!=null && !type.isEmpty())
			l = webt.listDocNotif(ins.getId_installation(),type);
		if(notif!=null && !type.isEmpty())
			l = webt.listDocNotif(notif.getId_notification(),type);

		map.put("doc",l);
		map.put("collect",v);
		map.put("installation",ins);
		map.put("notification",notif);
		map.put("type",type);
		map.put("url_Admin",urlRest);

		return new ModelAndView("user_select/ListeAutorisation_recap_CT",map);

	}


	@RequestMapping(value = "/api/getCollectById_collecte", method = RequestMethod.POST)
	public ModelAndView getCollectById_collecte() {

		Map<String,Object> map = new HashMap<>();
		ListDocNotif[] l=null;

		CollecteTransporteur v =  webt.getCollecteById_v2(webt.getCompteConnected().getCompteId());

		if(v!=null )
			l = webt.listDocNotif(v.getId_collecte(),"CT");

		map.put("doc",l);
		map.put("collect",v);

		map.put("url_Admin",urlRest);

		return new ModelAndView("user_select/ListeAutorisation_recap_CT",map);
	}

	@RequestMapping(value = "/api/newInstallRenouv/{id}", method = RequestMethod.GET)
	public String newInstallRenouv(@PathVariable String id) {
		Installation v =  webt.getInstallByNumDemande(id,webt.getCompteConnected().getCompteId());
		return "redirect:/api/addInstallation/"+v.getId_installation()+"/R";
	}


	@RequestMapping(value = "/api/checkEIESelect/{type}", method = RequestMethod.GET)
	public  ModelAndView checkEIESelect(@PathVariable String type) {
		Map<String,Object> model = new HashMap<>();
		model.put("user",webt.getCompteConnected());
		//model.put("type","EIE");
		model.put("type",type);
		if(type.equals("RS")){
			model.put("titre_dyn","Renseignements préalables ");
			model.put("RS",webt.getcountEIEByType("RS",webt.getCompteConnected().getCompteId()));
		}else if(type.equals("EE")){
			model.put("titre_dyn","Etude d’Impact sur l’Environnement");
			model.put("EE",webt.getcountEIEByType("EE",webt.getCompteConnected().getCompteId()));
		}else if(type.equals("NT")){
			model.put("titre_dyn","Notice d'Impact sur l'Environnement");
			model.put("NT",webt.getcountEIEByType("NT",webt.getCompteConnected().getCompteId()));
		}
		else if(type.equals("AE")){
			model.put("titre_dyn","Audit Environnemental");
			model.put("AE",webt.getcountEIEByType("AE",webt.getCompteConnected().getCompteId()));
		}


		return new ModelAndView("user_select/ListeEtudeEnv_card",model);

	}



	@RequestMapping(value = "/connexion", method = RequestMethod.GET)
	public  ModelAndView connexion_login() {
		Map<String,Object> model = new HashMap<>();
		model.put("user",webt.getCompteConnected());
		return new ModelAndView("connexion",model);
	}

	@RequestMapping(value = "/PageConnexion", method = RequestMethod.GET)
	public  ModelAndView PageConnexion() {
		Map<String,Object> model = new HashMap<>();
		return new ModelAndView("user_select/MyConnexion",model);
	}



	@RequestMapping(value = "/api/CheckEIE/{id}", method = RequestMethod.POST)
	public @ResponseBody String CheckEIE(@PathVariable String id) {
		String res = "Aucun résultat";
		DemandeInformation d = webt.getDemandeInfoByNumByUser(id,webt.getCompteConnected().getCompteId());
		if(d!=null){
			res = d.getId_demande_information()+"";
		}
		return res;
	}

	@RequestMapping(value = "/api/getPrefectureByRegion/{ids}/{id_dmd}", method = RequestMethod.POST)
	public ModelAndView getPrefectureByRegion(@PathVariable String ids,@PathVariable int id_dmd) {
		String res = "Aucun résultat";

		List<Prefecture> prefecture = webt.getAllPrefectureByRegion2(ids,id_dmd,webt.getCompteConnected().getCompteId());
		DemandeInformation d = webt.getDemandeInfoById(id_dmd);
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("prefecture",prefecture);
		model.put("demande",d);
		return new ModelAndView("user_select/auto_load_selects",model);
	}

	@RequestMapping(value = "/api/savecommuneDetailregion/{id}/{id_dmd}", method = RequestMethod.POST)
	public @ResponseBody String savecommuneDetailregion(@PathVariable String id,@PathVariable int id_dmd) {
		String res = "Aucun résultat";
		List<Commune> lc = webt.savecommuneDetailRegion(id,id_dmd,webt.getCompteConnected().getCompteId());
		if(lc!=null){
			res = "oui";
		}
		return res;
	}

	@RequestMapping(value = "/api/getCommuneByPref/{id}/{id_dmd}", method = RequestMethod.POST)
	public ModelAndView getCommuneByPref(@PathVariable String id,@PathVariable int id_dmd) {
		List<Commune> lc = webt.getAllCommuneByPrefecture2(id,id_dmd,webt.getCompteConnected().getCompteId());
		DemandeInformation d = webt.getDemandeInfoById(id_dmd);
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("commune",lc);
		model.put("demande",d);
		return new ModelAndView("user_select/auto_load_selects",model);
	}

	@RequestMapping(value = "/api/getCollectById1", method = RequestMethod.GET)
	public ModelAndView getCollectById1() {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("user",webt.getCompteConnected());
		model.put("type","CT");
		model.put("collect",webt.getCollecteById_v2(webt.getCompteConnected().getCompteId()));
		return new ModelAndView("user_select/recap_CT",model);
	}

	@RequestMapping(value = "/api/verifQuestion/{type}/{rep}", method = RequestMethod.GET)
	public ModelAndView verifQuestion(@PathVariable String type, @PathVariable String rep) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("user",webt.getCompteConnected());
		model.put("type",type);
		model.put("solution",rep);
		Notification[] n=null;
		if(rep.equals("affiche"))
			n = webt.getNotificationAll(webt.getCompteConnected().getCompteId(),type);
		else
			n = webt.getNotificationNotDepo(webt.getCompteConnected().getCompteId(),type);

		model.put("notif",n);
		return new ModelAndView("user_select/card_ZF_choix",model);
	}

	@RequestMapping(value = "/api/getnotifById1/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView getnotifById1(@PathVariable String type,@PathVariable int id) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("user",webt.getCompteConnected());
		model.put("type",type);
		Notification n = webt.getNotiifcationById(id);
		model.put("notification",n);
		ListDocNotif[] l = webt.listDocNotif(n.getId_notification(),type);
		model.put("doc",l);
		model.put("url_Admin",urlRest);
		model.put("declarationTrans",webt.getDeclaravionValideByNotificationId(n.getId_notification()));
		model.put("declaration",webt.getDeclaravionByNotificationId(n.getId_notification()));
		return new ModelAndView("user_select/recap_ZF",model);
	}

	@RequestMapping(value = "/api/recapIT/{id}", method = RequestMethod.GET)
	public ModelAndView getRecapInstallation(@PathVariable int id) {
		Map<String,Object> model = new HashMap<String,Object>();
		Installation ins = webt.getInstallationById(id,webt.getCompteConnected().getCompteId());
		ListDocNotif[] l = webt.listDocNotif(ins.getId_installation(),"IT");
		model.put("user",webt.getCompteConnected());
		model.put("doc",l);
		model.put("installation",ins);
		model.put("url_Admin",urlRest);
		return new ModelAndView("user_select/recap_IT",model);
	}

	@RequestMapping(value = "/api/getnotifByIdEdit/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView getnotifByIdEdit(@PathVariable String type,@PathVariable int id) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("user",webt.getCompteConnected());
		model.put("type",type);
		Notification n = webt.getNotiifcationById(id);
		model.put("notification",n);
		ListDocNotif[] l = webt.listDocNotif(n.getId_notification(),type);
		model.put("doc",l);
		model.put("url_Admin",urlRest);
		model.put("declarationTrans",webt.getDeclaravionValideByNotificationId(n.getId_notification()));
		return new ModelAndView("user_select/recap_ZF_edit",model);
	}

	@RequestMapping(value = "/api/getnotifByIdNum/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView getnotifByIdNum(@PathVariable String type,@PathVariable int id) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("user",webt.getCompteConnected());
		model.put("type",type);
		Notification n = webt.getNotiifcationById(id);
		model.put("notification",n);
		model.put("url_Admin",urlRest);
		return new ModelAndView("user_select/recapNumZF",model);
	}

	@RequestMapping(value = "/api/getnotifById2/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView getnotifById2(@PathVariable String type,@PathVariable int id) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("user",webt.getCompteConnected());
		model.put("type",type);
		Notification n = webt.getNotiifcationById(id);
		model.put("notification",n);
		ListDocNotif[] l = webt.listDocNotif(n.getId_notification(),type);
		model.put("doc",l);
		model.put("url_Admin",urlRest);
		model.put("declarationTrans",webt.getDeclaravionValideByNotificationId(n.getId_notification()));
		webt.changerEtat(n.getId_notification(),"ZF");
		return new ModelAndView("user_select/recap_ZF",model);
	}

	@RequestMapping(value = "/api/changeEtat/{id}", method = RequestMethod.POST)
	public @ResponseBody int addEtat(@PathVariable int id) throws UnknownHostException, JsonProcessingException, MessagingException, UnsupportedEncodingException {
		Notification n = webt.changerStatutNotif(id);
		return 0;
	}


	@GetMapping("/api/generateDocInstallFavorable/{idInstall}")
	public ResponseEntity<InputStreamResource> generateDocInstallFavorable(@PathVariable int idInstall) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		headers.add("Content-Disposition", "attachment; filename=Arrêté.docx");
		Installation is = webt.getIndtallationById(idInstall);
		ByteArrayInputStream bis = GenerateWordDocuments.generateInstallation(is);

		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}


	@RequestMapping(value = "/api/setFilQualifToInstall/{id}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody String setFilQualifToInstall(@PathVariable int id,@RequestParam MultipartFile[] fileToUpload) {
		String res  = webt.setFilQualifToInstall(id,fileToUpload);
		return res;
	}

	@RequestMapping(value = "/api/setFilImpactToDemandeInfo/{id}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody String setFilImpactToDemandeInfo(@PathVariable int id,@RequestParam MultipartFile[] fileToUpload) {
		String res  = webt.setFilImpactToDemandeInfo(id,fileToUpload);
		return res;
	}

	@RequestMapping(value = "/api/setAvisProjet/{id}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody String setAvisProjet(@PathVariable int id,@RequestParam MultipartFile[] fileToUpload) {
		String res  = webt.setAvisProjetDemandeInformation(id,fileToUpload);
		return res;
	}



	@GetMapping("/api/generate_recap_imp/{id}")
	public ResponseEntity<InputStreamResource> generate_recap_imp(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		Notification ns = webt.getNotificationById(id);
		headers.add("Content-Disposition", "attachment; filename=recap_"+ns.getNum_notification()+".pdf");
		ListDocNotif[] l = webt.listDocNotif(ns.getId_notification(),"ZF");
		DocImport[] d =webt.listDocImportByType(ns.getClassification().getId_classification(),ns.getZf_et());
		DeclarationTransporteur dt = webt.getDeclaravionByNotificationId(ns.getId_notification());
		ByteArrayInputStream bis = GeneratePDFDocuments.generateRecapNotification(ns,l,d,dt,urls);

		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}


	@GetMapping("/api/generate_recap_Num/{id}")
	public ResponseEntity<InputStreamResource> generate_recap_Num(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		Notification ns = webt.getNotificationById(id);
		headers.add("Content-Disposition", "attachment; filename=recap_"+ns.getNum_notification()+".pdf");
		ByteArrayInputStream bis = GeneratePDFDocuments.generateRecapNumNotification(ns,urls);

		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_recap_collecte/{id}")
	public ResponseEntity<InputStreamResource> generate_recap_collecte(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		CollecteTransporteur ns = webt.getCollecteeById(id);
		headers.add("Content-Disposition", "attachment; filename="+ns.getNum_demande()+".pdf");
		ListDocNotif[] l = webt.listDocNotif(ns.getId_collecte(),"CT");
		DocImport[] d =webt.getDocImportByType("CT");
		ByteArrayInputStream bis = GeneratePDFDocuments.generateRecapCollecte(ns,l,d,urls);


		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@RequestMapping(value = "/generateRecapInscription/{id}/{password}", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> generateRecapInscriptioon(@PathVariable int id,@PathVariable String password) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		Compte c = webt.getCompteById(id);
		headers.add("Content-Disposition", "attachment; filename="+c.getSt().getRaison_fr()+".pdf");
		ByteArrayInputStream bis = GeneratePDFDocuments.generateRecapInscription(c,urls,password);


		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_recap_Eie/{id}")
	public ResponseEntity<InputStreamResource> generate_recap_Eie(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		DemandeInformation d = webt.getDemandeInfoById(id);
		headers.add("Content-Disposition", "attachment; filename="+d.getNum_demande()+".pdf");
		//ListDocNotif[] l = webt.listDocNotif(d.getId_demande_information(),"EIE");// dans l'admin il n'a pas le type EIE
		ListDocNotif[] l = webt.listDocNotif(d.getId_demande_information(),d.getType());
		ByteArrayInputStream bis = GeneratePDFDocuments.generateRecapEie(d,l,urls);
		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_recap_instalation/{id}")
	public ResponseEntity<InputStreamResource> generate_recap_instalation(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		Installation ins = webt.getInstallById(id);
		headers.add("Content-Disposition", "attachment; filename="+ins.getNum_demande()+".pdf");
		ListDocNotif[] l = webt.listDocNotif(ins.getId_installation(),"IT");
		DocImport[] d =webt.getDocImportByType("IT");
		ByteArrayInputStream bis = GeneratePDFDocuments.generateRecapInstalation(ins,l,d,urls);

		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}


	@RequestMapping(value = "/api/addTransporteuretranger/{id_notif}/{id_trans}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ModelAndView addTransporteuretranger(@PathVariable int id_trans,@PathVariable int id_notif,@RequestParam String raison,@RequestParam String matricule,@RequestParam String type_vehicule,@RequestParam String adresse,@RequestParam MultipartFile[] fileToUpload)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		String id = webt.saveTransporeuretranger(fileToUpload,raison,matricule,type_vehicule,adresse,id_notif,id_trans);
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("notif",notif);
		map.put("transporteur_etranger",notif.getTransporteur_etranger());
		map.put("url_Admin",urlRest);
		return new ModelAndView("user_select/auto_load_Transporteur_etranger",map);
	}

	@RequestMapping(value = "/api/addTransporteuretrangerXD/{id_notif}/{id_trans}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ModelAndView addTransporteuretrangerXD(@PathVariable int id_trans,@PathVariable int id_notif,@RequestParam String raison,@RequestParam String matricule,@RequestParam String type_vehicule,@RequestParam String adresse,@RequestParam String port[],@RequestParam MultipartFile[] fileToUpload)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		String id = webt.saveTransporeuretrangerXD(fileToUpload,raison,matricule,type_vehicule,adresse,port,id_notif,id_trans);
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("transporteur_etranger",notif.getTransporteur_etranger());
		map.put("url_Admin",urlRest);
		return new ModelAndView("user_select/auto_load_Transporteur_XD",map);
	}

	@RequestMapping(value = "/api/addPort/{id_notif}/{id_port}", method = RequestMethod.POST)
	public ModelAndView addPort(@PathVariable int id_port,@PathVariable int id_notif,@RequestParam String nom_fr, @RequestParam int pays)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		String id = webt.savePort(nom_fr,pays,id_notif,id_port);
		Object[] pays1 = webt.tronsaction("select", " pays_id,nom_fr,nom_ar from pays ", " delete_date_time is null ");
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("port",notif.getPorts());
		map.put("pays1", pays1);
		map.put("notification",notif);
		map.put("url_Admin",urlRest);
		return new ModelAndView("user_select/auto_load_port",map);
	}

	@RequestMapping(value = "/api/addTransporteuretrangerNational/{id_notif}/{id_trans}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ModelAndView addTransporteuretranger2(@PathVariable int id_trans,@PathVariable int id_notif,@RequestParam String raison,@RequestParam String matricule,@RequestParam String type_vehicule,@RequestParam String adresse,@RequestParam MultipartFile[] fileToUpload)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		String id = webt.saveTransporeuretrangerNational(fileToUpload,raison,matricule,type_vehicule,adresse,id_notif,id_trans);
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("notif",notif);
		TransporteurEtranger t = webt.getTransporteurEtrangerById(Integer.parseInt(id));
		if(id_trans!=0)
			map.put("one",t);
		map.put("transporteur_etranger",notif.getTransporteur_etranger());
		map.put("url_Admin",urlRest);
		return new ModelAndView("user_select/auto_load_Transporteur_etrangerNational",map);
	}

	@RequestMapping(value = "/api/addProducteurNotification/{id_notif}/{id_prod}", method = RequestMethod.POST)
	public ModelAndView addProducteurNotification(@PathVariable int id_notif,@PathVariable int id_prod,@RequestParam String nom_fr,@RequestParam String nom_ar,@RequestParam String contact_fr,@RequestParam String idf,@RequestParam String adresse_fr,@RequestParam String tel,@RequestParam String fax,@RequestParam String mail)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		String id = webt.saveProducteurNotification(nom_fr,nom_ar,contact_fr,idf,adresse_fr,tel,fax,mail,id_notif,id_prod);
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		Producteur p = webt.getProducteurById(Integer.parseInt(id));
		if(id_prod!=0)
			map.put("one",p);
		map.put("notification",notif.getProducteurs());
		map.put("url_Admin",urlRest);
		return new ModelAndView("autorisationPublic/tableProducteur",map);
	}

	@RequestMapping(value = "/api/savePaysAutoriteXD/{id_notif}/{idPays}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ModelAndView savePaysAutoriteXD(@RequestParam(value = "file",required = false) MultipartFile file,@PathVariable int id_notif,@RequestParam int pays,@RequestParam String desc_autorite, @PathVariable int idPays)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		Object[] paysList = webt.tronsaction("select", " pays_id,nom_fr,nom_ar from pays ", " delete_date_time is null ");
		String id = webt.savePaysAutoriteXD(file,id_notif,pays, desc_autorite,idPays);
		Notification not = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("notif",not);
		map.put("pays1",paysList);
		map.put("url_Admin",urlRest);
		return new ModelAndView("autorisationPublic/tablePaysautorite",map);
	}

	@RequestMapping(value = "/api/deleteTransporteuretranger/{id_notif}/{id_trans}/{type}", method = RequestMethod.POST)
	public ModelAndView deleteTransporteuretranger(@PathVariable int id_trans,@PathVariable int id_notif,@PathVariable String type)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.deleteTransporteuretranger(id_notif,id_trans);
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("notif",notif);
		map.put("transporteur_etranger",notif.getTransporteur_etranger());
		map.put("url_Admin",urlRest);
		if(type.equals("nationale")){
			return new ModelAndView("user_select/auto_load_Transporteur_etrangerNational",map);
		}
		return new ModelAndView("user_select/auto_load_Transporteur_etranger",map);
	}

	@RequestMapping(value = "/api/deletePortNotif/{id_notif}/{id_port}", method = RequestMethod.POST)
	public ModelAndView deletePortNotif(@PathVariable int id_port,@PathVariable int id_notif)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.deletePortNotif(id_notif,id_port);
		Object[] pays1 = webt.tronsaction("select", " pays_id,nom_fr,nom_ar from pays ", " delete_date_time is null ");
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("port",notif.getPorts());
		map.put("pays1", pays1);
		map.put("notification",notif);
		map.put("url_Admin",urlRest);
		return new ModelAndView("user_select/auto_load_port",map);
	}


	@RequestMapping(value = "/api/deleteProducteurNotification/{id_notif}/{id_prod}", method = RequestMethod.POST)
	public ModelAndView deleteProducteurNotification(@PathVariable int id_prod,@PathVariable int id_notif)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.deleteProducteurNotification(id_notif,id_prod);
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("notification",notif.getProducteurs());
		map.put("url_Admin",urlRest);
		return new ModelAndView("autorisationPublic/tableProducteur",map);
	}

	@RequestMapping(value = "/api/deleteAutoriteNotif/{id_notif}/{id_aut}", method = RequestMethod.POST)
	public ModelAndView deleteAutoriteNotif(@PathVariable int id_aut,@PathVariable int id_notif)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.deleteAutoriteNotif(id_notif,id_aut);
		map.put("notif",webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId()));
		map.put("paysautorites",webt.getPaysAutoriteById(id_aut));
		map.put("url_admin",urlRest);
		return new ModelAndView("autorisationPublic/tableFormPaysAutorite",map);
	}

	@RequestMapping(value = "/api/deletePort/{id_notif}/{id}/{id_trans}", method = RequestMethod.POST)
	public ModelAndView deletePort(@PathVariable int id_notif,@PathVariable int id, @PathVariable int id_trans)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.deletePort(id, id_trans);
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("transporteur_etranger",notif.getTransporteur_etranger());
		map.put("url_Admin",urlRest);
		return new ModelAndView("user_select/auto_load_Transporteur_etranger",map);
	}

@RequestMapping(value = "/api/getoneTransporteuretranger/{id_trans}/{id_notif}/{type}", method = RequestMethod.POST)
	public ModelAndView getoneTransporteuretranger(@PathVariable int id_trans,@PathVariable int id_notif,@PathVariable String type)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("notif",notif);
		map.put("transporteur_etranger",notif.getTransporteur_etranger());
		map.put("one",webt.getTransporteurEtrangerById(id_trans));
		map.put("url_Admin",urlRest);
		if(type.equals("nationale")){
			return new ModelAndView("user_select/auto_load_Transporteur_etrangerNational",map);
		}
		return new ModelAndView("user_select/auto_load_Transporteur_etranger",map);
	}

	@RequestMapping(value = "/api/getoneTransporteuretrangerXD/{id_trans}/{id_notif}/{type}", method = RequestMethod.POST)
	public ModelAndView getoneTransporteuretrangerXD(@PathVariable int id_trans,@PathVariable int id_notif,@PathVariable String type)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("transporteur_etranger",notif.getTransporteur_etranger());
		map.put("one",webt.getTransporteurEtrangerById(id_trans));
		map.put("url_Admin",urlRest);
		if(type.equals("nationale")){
			return new ModelAndView("user_select/auto_load_Transporteur_etrangerNational",map);
		}
		return new ModelAndView("user_select/auto_load_Transporteur_XD",map);
	}


	@RequestMapping(value = "/api/getoneProducteurNotification/{id_prod}/{id_notif}", method = RequestMethod.POST)
	public ModelAndView getoneProducteurNotification(@PathVariable int id_prod,@PathVariable int id_notif)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("notification",notif.getProducteurs());
		map.put("one",webt.getProducteurById(id_prod));
		map.put("url_Admin",urlRest);
		return new ModelAndView("autorisationPublic/tableProducteur",map);
	}

	@RequestMapping(value = "/api/getPaysAutoriteById/{id}/{id_notif}",method = RequestMethod.POST)
	public ModelAndView getPaysAutoriteById(@PathVariable int id,@PathVariable int id_notif) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("notif",notif);
		Object[] pays = webt.tronsaction("select", " pays_id,nom_fr,nom_ar from pays ", " delete_date_time is null ");
		map.put("pays1",pays);
		map.put("paysautorite",webt.getPaysAutoriteById(id));
		map.put("url_Admin",urlRest);
		return new ModelAndView("autorisationPublic/tablePaysautorite",map);
	}

	@RequestMapping(value = "/api/changerStatus", method = RequestMethod.POST)
	public @ResponseBody String changerStatus(@RequestParam String type,@RequestParam int id_notif,@RequestParam int id_statut)
			throws JsonParseException, IOException, MessagingException {
		return webt.setStatutNotification(id_notif,id_statut,webt.getCompteConnected().getCompteId(),type);
	}

	@RequestMapping(value = "/api/changerStatusNumNotification/{id}", method = RequestMethod.POST)
	public @ResponseBody String changerStatusNumNotification(@PathVariable int id)
			throws JsonParseException, IOException, MessagingException {
		return webt.getStatutNumNotification(id);
	}

	@RequestMapping(value = "/api/changerStatus1", method = RequestMethod.POST)
	public @ResponseBody String changerStatus1(@RequestParam int id_notif,@RequestParam int id_statut)
			throws JsonParseException, IOException, MessagingException {
		return webt.setStatutNotification1(id_notif,id_statut,webt.getCompteConnected().getCompteId());
	}

	@RequestMapping(value = "/api/updateDemandeInfomration/{id}", method = RequestMethod.GET)
	public @ResponseBody String updateDemandeInfomration(@PathVariable int id, @RequestParam String intitule_projet,@RequestParam double montant_investissement, @RequestParam String nature_projet )
			throws JsonParseException {
		DemandeInformation d = webt.getDemandeInfoById(id);
		d.setMontant_investissement(montant_investissement);
		d.setIntitule_projet(intitule_projet);
		d.setNature_projet(nature_projet);
		d.setTronsfrontalier("oui");
		d.setType(d.getType());
		webt.updateDemandeInformation(id,d);
		return "";
	}

	@RequestMapping(value = "/api/updateDemandeInfomrationEE/{id}", method = RequestMethod.GET)
	public @ResponseBody String updateDemandeInfomrationEE(@PathVariable int id, @RequestParam String intitule_projet,@RequestParam double montant_investissement,@RequestParam String tronsfrontalier, @RequestParam String interregion)
			throws JsonParseException {
		String xd= webt.updateDemandeInformationEE(id, intitule_projet, montant_investissement, tronsfrontalier, interregion);
		return xd;
	}

	@RequestMapping(value = "/api/updateDemandeInfomrationAE/{id}", method = RequestMethod.GET)
	public @ResponseBody String updateDemandeInfomrationAE(@PathVariable int id, @RequestParam String intitule_projet,@RequestParam double montant_investissement, @RequestParam String nature_projet)
			throws JsonParseException {
		String xd= webt.updateDemandeInformationAE(id, intitule_projet, montant_investissement, nature_projet);
		return xd;
	}


	@RequestMapping(value = "/api/getfileByIdDemande/{id}/{type}", method = RequestMethod.POST)
	public ModelAndView getfileByIdDemande(@PathVariable int id,@PathVariable String type){
		Map<String,Object> map = new HashMap<String,Object>();
		DemandeInformation d = webt.getDemandeInfoById(id);
		ListDocNotif[] l = webt.listDocNotif(d.getId_demande_information(),"EE");
		Reunion r = null;
		if(d.getReunions().size()>0)
			r = d.getReunions().get(d.getReunions().size()-1);

		map.put("doc",l);
		map.put("demande",d);
		map.put("reunion",r);
		map.put("url_Admin",urlRest);
		map.put("type",type);
		if(type.equals("sendfile")){
			return new ModelAndView("user_select/auto_load_filesModal",map);
		}

		return new ModelAndView("user_select/auto_load_filesModal",map);
	}

	@RequestMapping(value = "/getTabtransporteur/{code}", method = RequestMethod.POST)
	public ModelAndView getTabtransporteur(@PathVariable int code) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("trans",webt.getTransporteurParamByCode(code));
		return new ModelAndView("user_select/auto_load_TabtransporteurDechets",model);
	}

	@RequestMapping(value = "/api/search/{search}", method = RequestMethod.GET)
	public ModelAndView search(@PathVariable String search) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("listF",webt.search(search));
		return new ModelAndView("user_select/auto_load_Tabtransporteur",model);
	}

	@RequestMapping(value = "/api/setFileReunionToDemande/{id}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody String setFileReunionToDemande(@PathVariable int id, @RequestParam MultipartFile[] fileToUpload)
			throws JsonParseException, IOException, MessagingException {
		return webt.setFileToDemande(id,fileToUpload);
	}

	@RequestMapping(value = "/getAccordionDoc/{type}", method = RequestMethod.POST)
	public ModelAndView getAccordionDoc(@PathVariable String type) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("doc",webt.getDocImportByType(type));
		model.put("Admin_url",urlRest);
		model.put("show","accordion");
		return new ModelAndView("user_select/auto_load_accordion",model);
	}

	@RequestMapping(value = "/getProcedureAuto/{type}", method = RequestMethod.POST)
	public ModelAndView getProcedureAuto(@PathVariable String type) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("doc",webt.getDocImportByType(type));
		model.put("type",type);
		model.put("codes",webt.getListCodeTabByClassif(1));
		model.put("show","procedure");
		return new ModelAndView("user_select/auto_load_accordion",model);
	}
    @RequestMapping(value = "/Actualite",method = RequestMethod.GET)
    public ModelAndView Actualite() throws Exception {
        Map<String,Object> map = new HashMap<>();
        map.put("user",webt.getCompteConnected());
        //map.put("listF",webt.getListAllTransporteurParam());
        //map.put("code",webt.getListCodeTabByClassif(1));
        return new ModelAndView("aide/Actualite",map);
    }

    /* ------------------- login7 ----------------- */

	@RequestMapping(value = "/getAccordionDoc2/{type}", method = RequestMethod.POST)
	public ModelAndView getAccordionDoc2(@PathVariable String type) {
		Map<String,Object> model = new HashMap<String,Object>();
		if(type.equals("EIE")){
			model.put("doc",webt.getDocImportByType("EE"));
		}else if(type.equals("EIE1")){
			model.put("doc",webt.getDocImportByType("NT"));
		}else if(type.equals("EIE2")){
			model.put("doc",webt.getDocImportByType("AE"));
		}else{
			model.put("doc",webt.getDocImportByType(type));
		}
		model.put("Admin_url",urlRest);
		model.put("show","accordion");
		return new ModelAndView("user_select/login7_autoload_accordion",model);
	}

	@RequestMapping(value = "/getAccordionDocument/{type}", method = RequestMethod.GET)
	public ModelAndView getAccordionDocument(@PathVariable String type) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("doc",webt.getDocImportByType(type));
		model.put("Admin_url",urlRest);
		model.put("show","accordion");
		return new ModelAndView("user_select/mesDocument",model);
	}

	@RequestMapping(value = "/getAccordionImage/{type}", method = RequestMethod.GET)
	public ModelAndView getAccordionImage(@PathVariable String type) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("type",type);
		model.put("Admin_url",urlRest);
		model.put("show","accordion");
		return new ModelAndView("user_select/mesImages",model);
	}

	@RequestMapping(value = "/getBaseJuridique/{type}", method = RequestMethod.GET)
	public ModelAndView getAccordionBaseJuridique(@PathVariable String type) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("type",type);
		model.put("Admin_url",urlRest);
		model.put("show","accordion");
		return new ModelAndView("user_select/base_juridique",model);
	}

	@RequestMapping(value = "/getAccordionVideo/{type}", method = RequestMethod.GET)
	public ModelAndView getAccordionVideo(@PathVariable String type) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("type",type);
		model.put("Admin_url",urlRest);
		model.put("show","accordion");
		return new ModelAndView("user_select/mesVideos",model);
	}

	@RequestMapping(value = "/getProcedureAuto2/{type}", method = RequestMethod.POST)
	public ModelAndView getProcedureAuto2(@PathVariable String type) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("doc",webt.getDocImportByType(type));
		model.put("type",type);
		model.put("codes",webt.getListCodeTabByClassif(1));
		model.put("show","procedure");
		return new ModelAndView("user_select/login7_autoload_accordion",model);
	}

	@RequestMapping(value = "/api/save_DemandeAE/{id}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody String getProcedureAuto2(@PathVariable String id,@RequestParam MultipartFile[] fileToUpload) {
		String s = webt.saveDemandeAE(id,fileToUpload,webt.getCompteConnected().getCompteId());
		return s;
	}

	@RequestMapping(value = "/api/getListdocument/{id}", method = RequestMethod.GET)
	public ModelAndView getProcedureAuto2(@PathVariable int id) {
		Map<String,Object> map = new HashMap<String,Object>();
		DemandeInformation d = webt.getDemandeInformationByCompteId(id,webt.getCompteConnected().getCompteId());
		map.put("user",webt.getCompteConnected());
		map.put("demande",d);
		map.put("type",d.getType());
		map.put("Admin_url",urlRest);
		return new ModelAndView("demande_eie/completerDoc_AE",map);
	}

	@RequestMapping(value = "/api/validationDoc/{id}", method = RequestMethod.GET)
	public ModelAndView validationDoc(@PathVariable int id) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("doc", webt.listDocNotif(id,"AE"));
		map.put("url_Admin", urlRest);
		map.put("id", id);
		map.put("type", "AE");
		map.put("user",webt.getCompteConnected());
		return new ModelAndView("demande_eie/validationDoc",map);
	}

	@RequestMapping(value = "/api/setDocument_ae/{id_dmd}/{id_ae}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody String getProcedureAuto2(@PathVariable int id_dmd,@PathVariable int id_ae,@RequestParam MultipartFile file) {
		String s = webt.saveFile_complementaire(id_dmd,id_ae,file,webt.getCompteConnected().getCompteId());
		return s;
	}
	@RequestMapping(value = "/api/setRapport_ae/{id_dmd}/{id_rapport}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody String setRapport_ae(@PathVariable int id_dmd,@PathVariable int id_rapport,@RequestParam MultipartFile file) {
		String s = webt.saveFile_Rapport_ae(id_dmd,id_rapport,file,webt.getCompteConnected().getCompteId());
		return s;
	}

	@RequestMapping(value = "/api/AttacherListDocAE/{id}", method = RequestMethod.GET)
	public ModelAndView AttacherListDocAE(@PathVariable int id) {
		Map<String,Object> map = new HashMap<String,Object>();
		DemandeInformation d = webt.getDemandeInformationByCompteId(id,webt.getCompteConnected().getCompteId());
		map.put("user",webt.getCompteConnected());
		map.put("demande",d);
		map.put("type",d.getType());
		map.put("doc",webt.getDocImportByType("AE"));
		map.put("docNotify",webt.listDocNotif(id,"AE"));
		map.put("Admin_url",urlRest);
		return new ModelAndView("demande_eie/AttacherListDocAE",map);
	}

	@RequestMapping(value = "/api/affiche_FRM_Add_rapport_ae/{id}", method = RequestMethod.POST)
	public ModelAndView affiche_FRM_Add_rapport_ae(@PathVariable int id) throws ParseException {
		Map<String,Object> map = new HashMap<String,Object>();
		DemandeInformation d = webt.getDemandeInformationByCompteId(id,webt.getCompteConnected().getCompteId());
		map.put("user",webt.getCompteConnected());
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String show = "oui";
		if(d.getRapports_AE().size()>0 && d.getReunions().size()>0){

			RapportsAE rap = d.getRapports_AE().get(d.getRapports_AE().size()-1);
			Date dt_dt_dt = sm.parse(rap.getDate());
			Date dt_now = new Date();

			Calendar c2 = Calendar.getInstance();
			Calendar c3 = Calendar.getInstance();

			c2.setTime(dt_now);
			c3.setTime(dt_dt_dt);

			//si on est dans la periode et on dispose du fichier on fait rien
			c3.add(Calendar.MONTH,Integer.parseInt(d.getReunions().get(d.getReunions().size()-1).getPeriode_send_rapport()));
			if(c3.after(c2)){
				if(!rap.getUrl_file().isEmpty())
					show ="non";
			}
		}

		map.put("demande",d);
		map.put("show",show);
		map.put("type","Rapport_AE");
		map.put("Admin_url",urlRest);
		return new ModelAndView("user_select/auto_load_filesModal",map);
	}


	@RequestMapping(value = "/new_procedure/{type}",method = RequestMethod.GET)
	public ModelAndView new_procedure(@PathVariable String type) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("type",type);
		map.put("user",webt.getCompteConnected());
		map.put("doc",webt.getDocImportByType(type));
		map.put("Admin_url",urlRest);
		return new ModelAndView("user_select/page_new_procedure",map);
	}

	@RequestMapping(value = "/sendError",method = RequestMethod.POST)
	public @ResponseBody String SendErrorByMail(@RequestParam String errorMessage,@RequestParam String errorUrl,@RequestParam int errorStatutCode) {

		Compte ct = webt.getCompteConnected();
		webt.sendError(ct, errorMessage,errorUrl,errorStatutCode);

		return "ok";
	}




	/*@RequestMapping(value = "/mail_files/{id}/{type}", method = RequestMethod.GET)
	public ModelAndView email_files(@PathVariable int id, @PathVariable String type) throws Exception{
		Map<String,Object> map = new HashMap<>();
		//Notification ns = ;
		map.put("Admin_url",urlRest);
		map.put("doc",webt.listDocNotif(id, type));
		map.put("notif",webt.getNotificationById(id));
		return  new ModelAndView("user_select/mail_files", map);
	}*/


}









