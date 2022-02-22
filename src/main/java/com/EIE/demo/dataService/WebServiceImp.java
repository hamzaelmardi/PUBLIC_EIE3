package com.EIE.demo.dataService;

import com.EIE.demo.model.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.core.io.FileSystemResource;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URI;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

//
@Service
public
class WebServiceImp implements WebService {

	@Value("${url}")
	private String urlRest;




	@Override
	public Compte getCompteConnected() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name=auth.getName();
		final String uri = urlRest+"/SelectOneUser/"+name;
		RestTemplate restTemplate = new RestTemplate();
		Compte  result = restTemplate.getForObject(uri, Compte.class);
		return result;
	}



	@Override
	public void addNumNotification(Notification nt,String text) {
		final String uris = urlRest + "/addNumNotifcationRest/"+text;
		RestTemplate restTemplate = new RestTemplate();

		restTemplate.postForLocation(uris, nt, Notification.class);

	}

	@Override
	public String addSociete(Societe nt, int secteur) {
		final String uris = urlRest + "/addSocieteRest/"+secteur;
		RestTemplate restTemplate = new RestTemplate();

		URI identifiant =restTemplate.postForLocation(uris, nt, Societe.class);

		String tt = identifiant.getPath().split("/")[1];
		tt = identifiant.getPath().split("/")[2];
		return tt;
	}

	@Override
	public void changertatutDemande(DemandeInformation nt, int statut) {
		final String uris = urlRest + "/changeStatutRest/"+statut;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.postForLocation(uris, nt, DemandeInformation.class);

	}

	@Override
	public void changertatutDemande2(DemandeInformation nt, int statut) {
		final String uris = urlRest + "/changeStatutRestAE/"+statut;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.postForLocation(uris, nt, DemandeInformation.class);
	}


	@Override
	public void sendEmail(Compte ct){
		final String uris = urlRest + "/sendEmailRest/"+ct.getCompteId();
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getForObject(uris,  String.class);
	}
	public String[] getAllStatut(){
		final String uris = urlRest + "/getAllStatut/";
		RestTemplate restTemplate = new RestTemplate();
		String[] result= restTemplate.getForObject(uris,String[].class);
		return result;
	}

	@Override
	public Compte getCompteById(int id){
		final String uris = urlRest + "/getCompteByIdRest/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Compte  result = restTemplate.getForObject(uris, Compte.class);
		return result;
	}
	//******passe****
	@Override
	public Compte getCompteBypasse(String passe){
		final String uris = urlRest + "/getCompteBypasseRest/"+passe;
		RestTemplate restTemplate = new RestTemplate();
		Compte  result = restTemplate.getForObject(uris, Compte.class);
		return result;
	}


	//***************
	@Override
	public String UpdatePassword(int id,String passe,String password){
		final String uris = urlRest + "/updatepasswordRest/"+id+"/"+passe;
		MultiValueMap<String, Object> bodyMap = new LinkedMultiValueMap<>();
		bodyMap.add("password", password );
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMap, headers);
		RestTemplate restTemplate = new RestTemplate();
		try {
			ResponseEntity<String> response = restTemplate.exchange(uris,
					HttpMethod.POST, requestEntity, String.class);
			return "OK";

		} catch (Exception e) {
			return "le lien est expiré";
		}

	}



	@Override
	public String addDemandeInformation(DemandeInformation nt,String type) {

		final String uris = urlRest + "/addDemandeInformationRest/"+type;
		RestTemplate restTemplate = new RestTemplate();

		URI test = restTemplate.postForLocation(uris, nt, DemandeInformation.class);
		String tt = "";
		tt = test.getPath().split("/")[2];
		return tt;

	}

//	@Override
//	public void addDemandeInformationDoc(DemandeInformation nt) {
//		final String uris = urlRest + "/addDemandeInformationDocRest";
//		RestTemplate restTemplate = new RestTemplate();
//
//		restTemplate.postForLocation(uris, nt, DemandeInformation.class);
//
//	}

	@Override
	public void addDocInfo( MultipartFile[] fileToUpload,int id,int check) {
		final String uris = urlRest + "/addDemandeInformationDocRest/"+id+"/"+check;
		MultiValueMap<String, Object> bodyMap = new LinkedMultiValueMap<>();
		bodyMap.add("file", new FileSystemResource(convert(fileToUpload[0])));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMap, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);

	}

	@Override
	public void addDocAut( MultipartFile[] fileToUpload,int id,int check,String typeauto) {
		final String uris = urlRest + "/addDocAutRest/"+id+"/"+check+"/"+typeauto;
		MultiValueMap<String, Object> bodyMap = new LinkedMultiValueMap<>();
		bodyMap.add("file", new FileSystemResource(convert(fileToUpload[0])));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMap, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);

	}



	public static File convert(MultipartFile file)
	{
		File convFile = new File(file.getOriginalFilename());
		try {
			convFile.createNewFile();
			FileOutputStream fos = new FileOutputStream(convFile);
			fos.write(file.getBytes());
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return convFile;
	}

	@Override
	public void verifierCompte(int id) {
		final String uris = urlRest + "/verifiedCompteRest/"+id;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.postForLocation(uris,  CollecteTransporteur.class);
	}

	/*@Override
	public int changerStatutNotif(int id) {
		final String uris = urlRest + "/changerStatutNotifRest/"+id;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getForObject(uris,  String.class);
		return 0;
	}*/

	@Override
	public Notification changerStatutNotif(int id_notification) {
		final String uri = urlRest+"/changerStatutNotifRest/"+id_notification ;
		RestTemplate restTemplate = new RestTemplate();
		Notification response = restTemplate.getForObject(uri, Notification.class);
		return response;
	}

	@Override
	public Installation changerStatutInstall(int id_installation) {
		final String uri = urlRest+"/changerStatutInstallRest/"+id_installation ;
		RestTemplate restTemplate = new RestTemplate();
		Installation response = restTemplate.getForObject(uri, Installation.class);
		return response;
	}

	@Override
	public String changerStatutCT(int id) {
		final String uris = urlRest + "/changerStatutCTRest/"+id;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getForObject(uris,  String.class);
		return "OK";
	}

	@Override
	public String changerStatutIT(int id) {
		final String uris = urlRest + "/changerStatutITRest/"+id;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getForObject(uris,  String.class);
		return "OK";
	}

	@Override
	public String changerTypeIT(int id) {
		final String uris = urlRest + "/changerTypeITRest/"+id;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getForObject(uris,  String.class);
		return "OK";
	}

	@Override
	public String autologin2(String j_name, String j_pass) {
		final String uris = urlRest + "/login2/"+j_name+"/"+j_pass;
		RestTemplate restTemplate = new RestTemplate();
		String response = restTemplate.getForObject(uris, String.class);
		return response;
	}

	@Override
	public Compte chackmail(String email) {
		final String uris = urlRest + "/SelectOneUser/"+email;
		RestTemplate restTemplate = new RestTemplate();
		Compte response = restTemplate.getForObject(uris, Compte.class);
		return response;
	}

	@Override
	public Compte chackmail1(String email) {
		final String uris = urlRest + "/SelectOneEmail/"+email;
		RestTemplate restTemplate = new RestTemplate();
		Compte response = restTemplate.getForObject(uris, Compte.class);
		return response;
	}
	public Compte chackmailmonprofil(String email,int id) {
		final String uris = urlRest + "/chackmailmonprofil/"+email+"/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Compte response = restTemplate.getForObject(uris, Compte.class);
		return response;
	}

	@Override
	public Compte chackmail2(String email) {
		final String uris = urlRest + "/SelectOneUser2/"+email;
		RestTemplate restTemplate = new RestTemplate();
		Compte response = restTemplate.getForObject(uris, Compte.class);
		return response;
	}

	@Override
	public Notification chackmail3(String email,String Password) {
		final String uris = urlRest + "/SelectOneUser3/"+email+"/"+Password;
		RestTemplate restTemplate = new RestTemplate();
		Notification response = restTemplate.getForObject(uris, Notification.class);
		return response;
	}
	public Compte check_autorisation(String email,String statut,int id) {
		final String uris = urlRest + "/check_autorisation/"+email+"/"+statut+"/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Compte response = restTemplate.getForObject(uris, Compte.class);
		return response;
	}


	@Override
	public DocImport[] listDocImport() {

		final String uri = urlRest + "/listDocRest";
		RestTemplate restTemplate = new RestTemplate();
		DocImport[] resultat = restTemplate.getForObject(uri, DocImport[].class);

		return resultat;
	}

	@Override
	public Compte oneCompte(int id) {

		final String uri = urlRest + "/OneCompte/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Compte resultat = restTemplate.getForObject(uri, Compte.class);

		return resultat;
	}

	@Override
	public DocImport[] listDocImportByType(int id,String type) {

		final String uri = urlRest + "/listDocRestByType/"+id+"/"+type;
		RestTemplate restTemplate = new RestTemplate();
		DocImport[] resultat = restTemplate.getForObject(uri, DocImport[].class);

		return resultat;
	}

	@Override
	public ListDocNotif[] listDocNotif(int id,String type) {

		final String uri = urlRest + "/listDocNotifRest/"+id+"/"+type;
		RestTemplate restTemplate = new RestTemplate();
		ListDocNotif[] resultat = restTemplate.getForObject(uri, ListDocNotif[].class);

		return resultat;
	}


	@Override
	public Notification findByIdnotif(int idNotif) {
		final String uris = urlRest + "/findByIdnotifRest/"+idNotif;
		RestTemplate restTemplate = new RestTemplate();
		Notification response = restTemplate.getForObject(uris, Notification.class);
		return response;
	}


	@Override
	public Object[] tronsaction(String opiration, String table,String filter) {

		final String uri = urlRest + "/TransactionInTable/"+opiration+"/"+table+"/"+filter;
		RestTemplate restTemplate = new RestTemplate();
		Object[] resultat = restTemplate.getForObject(uri, Object[].class);

		return resultat;
	}

	@Override
	public String addObject(Object nt, String table) {
		final String uris = urlRest + "/add_object/"+table;
		RestTemplate restTemplate = new RestTemplate();

		URI test = restTemplate.postForLocation(uris, nt, Object.class);
		String tt = test.getPath().split("/")[1];
		tt = test.getPath().split("/")[2];
		return tt;
	}


	@Override
	public String updateObject(Object nt, String table,String id) {
		final String uris = urlRest + "/update_object/"+table+"/"+id;
		RestTemplate restTemplate = new RestTemplate();
		URI test = restTemplate.postForLocation(uris, nt, Object.class);
		String tt = test.getPath().split("/")[1];
		tt = test.getPath().split("/")[2];
		return tt;
	}

	@Override
	public void sendError(Compte ct, String errorMessage,String errorUrl,int errorStatutCode) {
		final String uris = urlRest + "/sendErrorMail";
		MultiValueMap<String, Object> bodyMap = new LinkedMultiValueMap<>();
		if(ct!=null){
			bodyMap.add("compte", ct.getCompteId() );
		}
		bodyMap.add("errorMessage", errorMessage);
		bodyMap.add("errorUrl", errorUrl);
		bodyMap.add("errorStatutCode", errorStatutCode);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMap, headers);
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.exchange(uris, HttpMethod.POST, requestEntity, String.class);
	}

	@Override
	public ResponseEntity<RestResponsePage<Notification>> getListNotiifcationByCompte(Pageable page, int compteId, String  type, String  zfet) {
		final String uri = urlRest+"/getListeNotificationByCompte/"+page.getPageNumber()+"/"+page.getPageSize()+"/"+compteId+"/"+type+"/"+zfet;
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<Notification>> responseType = new ParameterizedTypeReference<RestResponsePage<Notification>>() { };

		ResponseEntity<RestResponsePage<Notification>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);

		return result;
	}

	@Override
	public ResponseEntity<RestResponsePage<Installation>> getListInstallationByCompte(Pageable page, int compteId) {
		final String uri = urlRest+"/getListInstallationByCompte/"+page.getPageNumber()+"/"+page.getPageSize()+"/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<Installation>> responseType = new ParameterizedTypeReference<RestResponsePage<Installation>>() { };

		ResponseEntity<RestResponsePage<Installation>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);

		return result;
	}

	@Override
	public ResponseEntity<RestResponsePage<CollecteTransporteur>> getListCollectesByCompte(Pageable page, int compteId) {
		final String uri = urlRest+"/getListCollecteByCompte/"+page.getPageNumber()+"/"+page.getPageSize()+"/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<CollecteTransporteur>> responseType = new ParameterizedTypeReference<RestResponsePage<CollecteTransporteur>>() { };

		ResponseEntity<RestResponsePage<CollecteTransporteur>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);

		return result;
	}

	@Override
	public ResponseEntity<RestResponsePage<DemandeInformation>> getListDemandeInformationByCompte(Pageable page, int compteId, String type) {
		final String uri = urlRest+"/getListeDemandeInformationByCompte/"+page.getPageNumber()+"/"+page.getPageSize()+"/"+compteId+"/"+type;
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<DemandeInformation>> responseType = new ParameterizedTypeReference<RestResponsePage<DemandeInformation>>() { };

		ResponseEntity<RestResponsePage<DemandeInformation>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);

		return result;
	}

	@Override
	public ResponseEntity<RestResponsePage<DemandeInformation>> getListDemandeInformationByCompteStatut(Pageable page, int compteId,int statut) {
		final String uri = urlRest+"/getListeDemandeInformationByCompteStatut/"+page.getPageNumber()+"/"+page.getPageSize()+"/"+compteId+"/"+statut;
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<DemandeInformation>> responseType = new ParameterizedTypeReference<RestResponsePage<DemandeInformation>>() { };

		ResponseEntity<RestResponsePage<DemandeInformation>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);

		return result;
	}

	@Override
	public Notification getNotiifcationByNumZFET(String num,String type) {


		final String uri = urlRest+"/getNotByNumzfEt/"+num+"/"+type;
		RestTemplate restTemplate = new RestTemplate();
		Notification  result = restTemplate.getForObject(uri, Notification.class);
		return result;
	}

	@Override
	public Notification getNotiifcationByNum(String num) {


		final String uri = urlRest+"/getNotByNum/"+num;
		RestTemplate restTemplate = new RestTemplate();
		Notification  result = restTemplate.getForObject(uri, Notification.class);
		return result;
	}

	@Override
	public void addCategorieDechet(int id_notif) {

		final String uris = urlRest+"/addCategoriesDechetRest/"+id_notif;

		MultiValueMap<String, Object> bodyMap = new LinkedMultiValueMap<>();
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMap, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);


	}

	@Override
	public CollecteTransporteur getCollecteByNum(String num) {

		final String uri = urlRest+"/getCollByNum/"+num;
		RestTemplate restTemplate = new RestTemplate();
		CollecteTransporteur  result = restTemplate.getForObject(uri, CollecteTransporteur.class);
		return result;
	}
	@Override
	public Installation getInstallByNum(String num) {

		final String uri = urlRest+"/getInstallByNum/"+num;
		RestTemplate restTemplate = new RestTemplate();
		Installation  result = restTemplate.getForObject(uri, Installation.class);
		return result;
	}
	@Override
	public Installation getInstalById(int id,int compt_id) {

		final String uri = urlRest+"/getInstallByIdentifiant/"+id+"/"+compt_id;
		RestTemplate restTemplate = new RestTemplate();
		Installation  result = restTemplate.getForObject(uri, Installation.class);
		return result;
	}

	@Override
	public Installation getInstallById(int id) {
		final String uri = urlRest+"/getInstallById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Installation  result = restTemplate.getForObject(uri, Installation.class);
		return result;
	}

	@Override
	public DemandeInformation getDemandeInfoByNum(String num) {


		final String uri = urlRest+"/getDemandeInfoByNum/"+num;
		RestTemplate restTemplate = new RestTemplate();
		DemandeInformation  result = restTemplate.getForObject(uri, DemandeInformation.class);
		return result;
	}

	@Override
	public DemandeInformation getDemandeInfoById(int id) {
		final String uri = urlRest+"/getDemandeInfoByIdRest/"+id;
		RestTemplate restTemplate = new RestTemplate();
		DemandeInformation  result = restTemplate.getForObject(uri, DemandeInformation.class);
		return result;
	}

	@Override
	public DemandeInformation getDemandeInfoByIdNotice(int id) {
		final String uri = urlRest+"/getDemandeInfoByIdNoticeRest/"+id;
		RestTemplate restTemplate = new RestTemplate();
		DemandeInformation  result = restTemplate.getForObject(uri, DemandeInformation.class);
		return result;
	}

	@Override
	public DemandeInformation getDemandeInfoByIdType(int id, String type) {


		final String uri = urlRest+"/getDemandeInfoByIdTypeRest/"+id+"/"+type;
		RestTemplate restTemplate = new RestTemplate();
		DemandeInformation  result = restTemplate.getForObject(uri, DemandeInformation.class);
		return result;
	}

	@Override
	public Notification getNotiifcationById(int id) {
		final String uri = urlRest+"/getNotById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Notification  result = restTemplate.getForObject(uri, Notification.class);
		return result;
	}

	@Override
	public Installation getIndtallationById(int id) {
		final String uri = urlRest+"/getInstallById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Installation  result = restTemplate.getForObject(uri, Installation.class);
		return result;
	}

	@Override
	public Region getRegion(int id) {


		final String uri = urlRest+"/getRegionId/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Region  result = restTemplate.getForObject(uri, Region.class);
		return result;
	}


	@Override
	public ResponseEntity<RestResponsePage<Questions>> getListQuestions(Pageable page) {
		final String uri = urlRest+"/getListQuestions/"+page.getPageNumber()+"/"+page.getPageSize();
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<Questions>> responseType = new ParameterizedTypeReference<RestResponsePage<Questions>>() { };
		ResponseEntity<RestResponsePage<Questions>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);
		return result;
	}


	@Override
	public void saveQuestion(Questions question) {
		final String uris = urlRest + "/saveQuestion";
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.postForLocation(uris, question, Questions.class);
	}

	@Override
	public Questions getQuestionById(int id) {
		final String uri = urlRest+"/getquestionbyId/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Questions  result = restTemplate.getForObject(uri, Questions.class);
		return result;
	}

	@Override
	public List<AutorisationParam> getListParam() {
		final String uri = urlRest+"/getListParam/";
		RestTemplate restTemplate = new RestTemplate();
		AutorisationParam[] result= restTemplate.getForObject(uri,AutorisationParam[].class);
		return Arrays.asList(result);
	}

	@Override
	public List<EvaluationParam> getListEvaParam() {
		final String uri = urlRest+"/getListEvaParam/";
		RestTemplate restTemplate = new RestTemplate();
		EvaluationParam[] result= restTemplate.getForObject(uri,EvaluationParam[].class);
		return Arrays.asList(result);
	}

	@Override
	public ResponseEntity<RestResponsePage<Questions>> getListQuestionsByAuto(String type, PageRequest page) {
		final String uri = urlRest+"/getListQuestionsByAuto/"+page.getPageNumber()+"/"+page.getPageSize()+"/"+type;
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<Questions>> responseType = new ParameterizedTypeReference<RestResponsePage<Questions>>() { };
		ResponseEntity<RestResponsePage<Questions>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);
		return result;
	}

	@Override
	public List<Code> getListcodeTab() {
		final String uri = urlRest+"/getListCodeTab";
		RestTemplate restTemplate = new RestTemplate();
		Code[] result= restTemplate.getForObject(uri,Code[].class);
		return Arrays.asList(result);
	}

	@Override
	public List<CategorieDechet> getListCategorieDechet() {
		final String uri = urlRest+"/getListCategorieDechet";
		RestTemplate restTemplate = new RestTemplate();
		CategorieDechet[] result= restTemplate.getForObject(uri,CategorieDechet[].class);
		return Arrays.asList(result);
	}

	@Override
	public List<Code> getListCodeTabByClassif(int classification) {
		final String uri = urlRest+"/getListCodeTabByClassif/"+classification;
		RestTemplate restTemplate = new RestTemplate();
		Code[] result= restTemplate.getForObject(uri,Code[].class);
		return Arrays.asList(result);
	}





	@Override
	public ResponseEntity<RestResponsePage<Reponse>> getListReponseByIdQuestion(int id, PageRequest page) {
		final String uri = urlRest+"/getListReponseByIdQuestion/"+page.getPageNumber()+"/"+page.getPageSize()+"/"+id;
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<Reponse>> responseType = new ParameterizedTypeReference<RestResponsePage<Reponse>>() { };
		ResponseEntity<RestResponsePage<Reponse>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);
		return result;
	}

	@Override
	public void saveReponse(Reponse r,int id) {
		final String uris = urlRest + "/saveReponse/"+id;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.postForLocation(uris, r, Reponse.class);
	}

	@Override
	public void deleteReponse(int id_ques, int idrep) {
		final String uris = urlRest + "/deleteReponse/"+idrep+"/"+id_ques;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getForObject(uris, Reponse.class);
	}

	@Override
	public Reponse getReponseById(int id) {
		final String uri = urlRest+"/getReponseById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Reponse  result = restTemplate.getForObject(uri, Reponse.class);
		return result;
	}

	@Override
	public ResponseEntity<RestResponsePage<ContactMessage>> getListContactMessage(PageRequest page,int iduser) {
		final String uri = urlRest+"/getListeMessageContact/"+page.getPageNumber()+"/"+page.getPageSize()+"/"+iduser;
		RestTemplate restTemplate = new RestTemplate();
		ParameterizedTypeReference<RestResponsePage<ContactMessage>> responseType = new ParameterizedTypeReference<RestResponsePage<ContactMessage>>() { };
		ResponseEntity<RestResponsePage<ContactMessage>> result = restTemplate.exchange(uri, HttpMethod.GET, null/*httpEntity*/, responseType);
		return result;
	}


	@Override
	public void addMsgContact(ContactMessage msg) {
		final String uris = urlRest + "/saveMsgContact";
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.postForLocation(uris, msg, ContactMessage.class);
	}

	@Override
	public ContactMessage getContactMessageById(int id,int iduser) {
		final String uri = urlRest+"/getContactMessageById/"+id+"/"+iduser;
		RestTemplate restTemplate = new RestTemplate();
		ContactMessage  result = restTemplate.getForObject(uri, ContactMessage.class);
		return result;
	}

	@Override
	public CollecteTransporteur getCollecteById(int id, int compteId) {
		final String uri = urlRest+"/getCollecteByIdRest/"+id+"/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		CollecteTransporteur  result = restTemplate.getForObject(uri, CollecteTransporteur.class);
		return result;
	}

	@Override
	public CollecteTransporteur getCollecteeById(int id) {
		final String uri = urlRest+"/getCollecteeById/"+id;
		RestTemplate restTemplate = new RestTemplate();
		CollecteTransporteur  result = restTemplate.getForObject(uri, CollecteTransporteur.class);
		return result;
	}

	@Override
	public DemandeInformation getDemandeInformationByCompteId(int id, int compteId) {
		final String uri = urlRest+"/getDemandeInformationByCompteIdRest/"+id+"/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		DemandeInformation  result = restTemplate.getForObject(uri, DemandeInformation.class);
		return result;
	}

	@Override
	public CollecteTransporteur getCollecteById(int id, int compteId,String typerenew) {
		final String uri = urlRest+"/getCollecteById2Rest/"+id+"/"+compteId+"/"+typerenew;
		RestTemplate restTemplate = new RestTemplate();
		CollecteTransporteur  result = restTemplate.getForObject(uri, CollecteTransporteur.class);
		return result;
	}

	@Override
	public Installation getInstallationById(int id, int compteId) {
		final String uri = urlRest+"/getInstallationByIdRest/"+id+"/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		Installation  result = restTemplate.getForObject(uri, Installation.class);
		return result;
	}

	@Override
	public List<EquipementSecurite> getListEquipementSecurite() {
		final String uri = urlRest+"/getListEquipementSecurite/";
		RestTemplate restTemplate = new RestTemplate();
		EquipementSecurite[] result= restTemplate.getForObject(uri, EquipementSecurite[].class);
		return Arrays.asList(result);
	}

	@Override
	public List<TypeVehicule> getListAllTypeVehicule() {
		final String uri = urlRest+"/getListTypeVehicule/";
		RestTemplate restTemplate = new RestTemplate();
		TypeVehicule[] result= restTemplate.getForObject(uri, TypeVehicule[].class);
		return Arrays.asList(result);
	}

	@Override
	public List<CollecteTransporteur> getAllCollecteNumAncienne(int id,int idCompte) {
		final String uri = urlRest+"/getListColAncienne/"+id+"/"+idCompte;
		RestTemplate restTemplate = new RestTemplate();
		CollecteTransporteur[] result= restTemplate.getForObject(uri, CollecteTransporteur[].class);
		return Arrays.asList(result);
	}


	@Override
	public List<Integer> getAllStatutAvenant(int idCompte) {
		final String uri = urlRest+"/getAllStatutAvenant/"+idCompte;
		RestTemplate restTemplate = new RestTemplate();
		Integer[] result= restTemplate.getForObject(uri, Integer[].class);
		return Arrays.asList(result);
	}

	@Override
	public List<TypeConteneurs> getListAllTypeConteneur() {
		final String uri = urlRest+"/getListTypeConteneur/";
		RestTemplate restTemplate = new RestTemplate();
		TypeConteneurs[] result= restTemplate.getForObject(uri, TypeConteneurs[].class);
		return Arrays.asList(result);
	}

	@Override
	public List<Region> getListAllRegion() {
		final String uri = urlRest+"/getListAllRegion";
		RestTemplate restTemplate = new RestTemplate();
		Region[] result= restTemplate.getForObject(uri, Region[].class);
		return Arrays.asList(result);
	}

	@Override
	public List<TransporteurParam> getListAllTransporteurParam() {
		final String uri = urlRest+"/getListAllTransporteurParam/";
		RestTemplate restTemplate = new RestTemplate();
		TransporteurParam[] result= restTemplate.getForObject(uri, TransporteurParam[].class);
		return Arrays.asList(result);
	}
	//*********
	@Override
	public List<Code> getListAllCode() {
		final String uri = urlRest+"/getListAllCode/";
		RestTemplate restTemplate = new RestTemplate();
		Code[] result= restTemplate.getForObject(uri, Code[].class);
		return Arrays.asList(result);
	}
	//*********

	public List<Codeparentt> getListCodeParent(){
		final String uri = urlRest+"/getListAllCodeParent/";
		RestTemplate restTemplate = new RestTemplate();
		Codeparentt[] result= restTemplate.getForObject(uri, Codeparentt[].class);
		return Arrays.asList(result);
	}

	public List<Code> getListCodeByParentCategorie(int id,int classification){
		final String uri = urlRest+"/getListCodeByParent/"+id+"/"+classification;
		RestTemplate restTemplate = new RestTemplate();
		Code[] result= restTemplate.getForObject(uri, Code[].class);
		return Arrays.asList(result);
	}
	@Override
	public List<Code> getListAllCode1(int id) {
		final String uri = urlRest+"/getListAllCode1/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Code[] result= restTemplate.getForObject(uri, Code[].class);
		return Arrays.asList(result);
	}
	//*****
	@Override
	public List<Questions> getListAllQuestion(String type) {
		final String uri = urlRest+"/getListAllQuestion/"+type;
		RestTemplate restTemplate = new RestTemplate();
		Questions[] result= restTemplate.getForObject(uri, Questions[].class);
		return Arrays.asList(result);
	}
	//***************


	public String saveVehicule(MultipartFile[] fileToUpload,MultipartFile[] equipementsecurite, int id_collecte, String v) {
		final String uris = urlRest + "/saveVehiculeRest";
		MultiValueMap<String, Object> bodyMap = new LinkedMultiValueMap<>();
		if(fileToUpload.length>0){
			bodyMap.add("file", new FileSystemResource(convert(fileToUpload[0])));
		}else{
			bodyMap.add("file", null);
		}

		if(equipementsecurite.length>0){
			bodyMap.add("file1", new FileSystemResource(convert(equipementsecurite[0])));
		}else{
			bodyMap.add("file1", null);
		}


		bodyMap.add("id_collecte", id_collecte);
		bodyMap.add("vehicule", v );

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMap, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		String nn = response.getHeaders().getLocation().getPath().split("/")[2];
		return nn;
	}

	public void savePaysAutorite(int v) {
		final String uris = urlRest + "/savePaysautoriteRest/"+v;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getForObject(uris, PaysAutorite.class);
	}

	public String savePaysAutoriteXD(MultipartFile fileToUpload, int id_notif, int v, String desc_autorite, int idPays) {
		final String uris = urlRest + "/savePaysautoriteXDRest/"+id_notif+"/"+idPays;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();

		if(fileToUpload!= null)
			bodyMapw.add("file", new FileSystemResource(convert(fileToUpload)));
		else
			bodyMapw.add("file", null);

		bodyMapw.add("desc_autorite", desc_autorite);
		bodyMapw.add("pays", v);


		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		String nn = response.getHeaders().getLocation().getPath().split("/")[2];
		return nn;
	}


	@Override
	public Vehicules getVehiculeById(int parseInt) {
		final String uri = urlRest+"/getVehiculeByIdRest/"+parseInt;
		RestTemplate restTemplate = new RestTemplate();
		Vehicules  result = restTemplate.getForObject(uri, Vehicules.class);
		return result;
	}

	@Override
	public PaysAutorite getPaysAutoriteById(int parseInt) {
		final String uri = urlRest+"/getPaysAutoriteByIdRest/"+parseInt;
		RestTemplate restTemplate = new RestTemplate();
		PaysAutorite  result = restTemplate.getForObject(uri, PaysAutorite.class);
		return result;
	}

	@Override
	public void deleteVehiculeById(int id, int id_coll, int id_user) {
		final String uris = urlRest + "/deleteVehiculeRest/"+id+"/"+id_coll + "/"+ id_user;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uris,Vehicules.class);
	}

	@Override
	public void deletePaysautoriteById(int id, int id_notif, int id_user) {
		final String uris = urlRest + "/deletePaysautoriteRest/"+id+"/"+id_notif + "/"+ id_user;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uris,PaysAutorite.class);
	}

	@Override
	public void setcode(int id_coll, int id_code, int id_user,String type) {
		final String uris = urlRest + "/setcodeCollectRest/"+id_coll+"/"+id_code + "/"+ type+"/"+id_user;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uris,Code.class);
	}

	@Override
	public void deleteCodeTmp(int id_coll, int id_code, int id_user,String type) {
		final String uris = urlRest + "/deleteCodeTmpRest/"+id_coll+"/"+id_code + "/"+ type+"/"+id_user;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uris,Code.class);
	}

	@Override
	public void deleteCodeTmp_inst(int id_inst, int id_code, int id_user,String type) {
		final String uris = urlRest + "/deleteCodeTmp_instRest/"+id_inst+"/"+id_code + "/"+ type+"/"+id_user;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uris,Code.class);
	}

	@Override
	public List<Prefecture> updateRegion(int id, int regionId) {
		final String uris = urlRest + "/updateRegionRest/"+id+"/"+regionId;
		RestTemplate restTemplate = new RestTemplate();
		Prefecture[]  result = restTemplate.getForObject(uris,Prefecture[].class);
		return Arrays.asList(result);
	}

	@Override
	public List<Prefecture> updateRegionCT(int regionId) {
		final String uris = urlRest + "/updateRegionCTRest/"+regionId;
		RestTemplate restTemplate = new RestTemplate();
		Prefecture[]  result = restTemplate.getForObject(uris,Prefecture[].class);
		return Arrays.asList(result);
	}

	@Override
	public void updatePrefecture(int id, int prefectureId) {
		final String uris = urlRest + "/updatePrefectureRest/"+id+"/"+prefectureId;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uris,Code.class);
	}

	@Override
	public void updatePrefectureCT(int id, int prefectureId) {
		final String uris = urlRest + "/updatePrefectureCTRest/"+id+"/"+prefectureId;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uris,Code.class);
	}

	@Override
	public void setcodeinstall(int id_inst, int id_code, int id_user,String type) {
		final String uris = urlRest + "/setcodeInstallationRest/"+id_inst+"/"+id_code + "/"+ type+"/"+id_user;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uris,Code.class);
	}

	@Override
	public void deleteAllCodeByInstall(int id_inst,int id_user) {
		final String uris = urlRest + "/deleteAllCodeByInstall/"+id_inst+"/"+id_user;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uris,Code.class);
	}

	@Override
	public CollecteTransporteur getCollecteByNumDemande(String id, int compteId) {
		final String uri = urlRest+"/getCollecteByNumDemandeRest/"+id+"/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		CollecteTransporteur  result = restTemplate.getForObject(uri, CollecteTransporteur.class);
		return result;
	}

	@Override
	public CollecteTransporteur getCollecteByNumDemande2(int id, int compteId) {
		final String uri = urlRest+"/getCollecteByNumDemande2Rest/"+id+"/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		CollecteTransporteur  result = restTemplate.getForObject(uri, CollecteTransporteur.class);
		return result;
	}

	@Override
	public CollecteTransporteur getCollecteByNumDemande3(int id, int compteId) {
		final String uri = urlRest+"/getAvenant/"+id+"/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		CollecteTransporteur  result = restTemplate.getForObject(uri, CollecteTransporteur.class);
		return result;
	}

	@Override
	public Installation getInstalById2(int id, int compteId, String typeRenv) {
		final String uri = urlRest+"/getInstalById2Rest/"+id+"/"+compteId+"/"+typeRenv;
		RestTemplate restTemplate = new RestTemplate();
		Installation  result = restTemplate.getForObject(uri, Installation.class);
		return result;
	}

	@Override
	public Installation getInstallByNumDemande(String id, int compteId) {
		final String uri = urlRest+"/getInstallByNumDemandeRest/"+id+"/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		Installation  result = restTemplate.getForObject(uri, Installation.class);
		return result;
	}

	@Override
	public Notification getNotificationByNumDemande(String id, int compteId,String type) {
		final String uri = urlRest+"/getNotificationByNumDemandeRest/"+id+"/"+type+"/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		Notification  result = restTemplate.getForObject(uri, Notification.class);
		return result;
	}

	@Override
	public int getNombreCollecteByUser(int compteId,String type) {
		final String uri = urlRest+"/getNombreCollecteByUserRest/"+compteId+"/"+type;
		RestTemplate restTemplate = new RestTemplate();
		Integer  result = restTemplate.getForObject(uri, Integer.class);
		return result;
	}

	@Override
	public List<CollecteTransporteur> getListCollectesRenouvByCompte( int compteId) {
		final String uri = urlRest+"/getListCollectesRenouvByCompteRest/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		CollecteTransporteur[] result = restTemplate.getForObject(uri,CollecteTransporteur[].class);
		return Arrays.asList(result);

	}

	@Override
	public int getNombreInstaByUser(int compteId, String type) {
		final String uri = urlRest+"/getNombreInstaByUserRest/"+compteId+"/"+type;
		RestTemplate restTemplate = new RestTemplate();
		Integer  result = restTemplate.getForObject(uri, Integer.class);
		return result;
	}

	@Override
	public List<Installation> getListInstallRenouvByCompte( int compteId) {
		final String uri = urlRest+"/getListInstallRenouvByCompteRest/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		Installation[] result = restTemplate.getForObject(uri,Installation[].class);
		return Arrays.asList(result);

	}

	@Override
	public Installation getInstallByNumAndUser(String num, int compteId) {
		final String uri = urlRest+"/getInstallByNumAndUserRest/"+num+"/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		Installation result = restTemplate.getForObject(uri,Installation.class);
		return result;

	}

	@Override
	public DocImport[] getDocImportByType(String type) {
		final String uri = urlRest+"/getDocImportByTypeREST/"+type;
		RestTemplate restTemplate = new RestTemplate();
		DocImport[]  result = restTemplate.getForObject(uri, DocImport[].class);
		return result;

	}

	@Override
	public int getNombreNotifUser(int compteId, String all,String type) {
		final String uri = urlRest+"/getNombreNotifUserRest/" + compteId + "/" + all + "/" + type;
		RestTemplate restTemplate = new RestTemplate();
		Integer  result = restTemplate.getForObject(uri, Integer.class);
		return result;
	}

	@Override
	public DemandeInformation getDemandeInfoByNumByUser(String id, int compteId) {
		final String uri = urlRest+"/getDemandeInfoByNumByUserRest/" + id + "/" + compteId;
		RestTemplate restTemplate = new RestTemplate();
		DemandeInformation  result = restTemplate.getForObject(uri, DemandeInformation.class);
		return result;
	}

	@Override
	public List<Prefecture> getAllPrefectureByRegion2(String id,int id_dmd,int id_compt) {
		final String uri = urlRest+"/getProvinceByRegionRest/"+id+"/"+id_dmd+"/"+id_compt;
		RestTemplate restTemplate = new RestTemplate();
		Prefecture[] result = restTemplate.getForObject(uri, Prefecture[].class);
		return Arrays.asList(result);
	}

	@Override
	public List<Prefecture> getAllPrefectureByRegion(String id) {
		final String uri = urlRest+"/getProvinceByRegion/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Prefecture[] result = restTemplate.getForObject(uri, Prefecture[].class);
		return Arrays.asList(result);
	}

	@Override
	public List<Commune> getAllCommuneByPrefecture(String id) {
		final String uri = urlRest+"/getCommuneByPrefecture/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Commune[] result = restTemplate.getForObject(uri, Commune[].class);
		return Arrays.asList(result);
	}

	@Override
	public List<Commune> getAllCommuneByPrefecture2(String id,int id_dmd, int id_compt) {
		final String uri = urlRest+"/getCommuneByPrefectureRest/"+id+"/"+id_dmd+"/"+id_compt;
		RestTemplate restTemplate = new RestTemplate();
		Commune[] result = restTemplate.getForObject(uri, Commune[].class);
		return Arrays.asList(result);
	}

	@Override
	public Region[] getArrRegion() {
		final String uri = urlRest+"/getArrRegionRest";
		RestTemplate restTemplate = new RestTemplate();
		Region[] result = restTemplate.getForObject(uri, Region[].class);
		return result;
	}

	@Override
	public Categorie[] getArrCategorie() {
		final String uri = urlRest+"/getArrCategorieRest";
		RestTemplate restTemplate = new RestTemplate();
		Categorie[] result = restTemplate.getForObject(uri, Categorie[].class);
		return result;
	}

	@Override
	public CollecteTransporteur getCollecteById_v2(int compteId) {
		final String uri = urlRest+"/getCollecteById_v2Rest/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		CollecteTransporteur result = restTemplate.getForObject(uri, CollecteTransporteur.class);
		return result;
	}

	@Override
		public CollecteTransporteur getOneCollecteByUserFirst(int compteId) {
			final String uri = urlRest+"/getOneCollecteByUserFirst/"+compteId;
			RestTemplate restTemplate = new RestTemplate();
			CollecteTransporteur result = restTemplate.getForObject(uri, CollecteTransporteur.class);
			return result;
		}

	@Override
	public DemandeInformation getDemandeByUser(int compteId) {
		final String uri = urlRest+"/getDemandeByUserRest/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		DemandeInformation result = restTemplate.getForObject(uri, DemandeInformation.class);
		return result;
	}


	@Override
	public Installation getInstallById_v2(int compteId) {
		final String uri = urlRest+"/getInstallById_v2Rest/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		Installation result = restTemplate.getForObject(uri, Installation.class);
		return result;
	}

	@Override
	public Notification[] getNotificationNotDepo(int compteId, String type) {
		final String uri = urlRest+"/getNotificationNotDepoRest/"+compteId+"/"+type;
		RestTemplate restTemplate = new RestTemplate();
		Notification[] result = restTemplate.getForObject(uri, Notification[].class);
		return result;
	}


	@Override
	public Notification[] getNotificationAll(int compteId, String type) {
		final String uri = urlRest+"/getNotificationAllRest/"+compteId + "/" + type;
		RestTemplate restTemplate = new RestTemplate();
		Notification[] result = restTemplate.getForObject(uri, Notification[].class);

		return result;
	}

	@Override
	public Installation[] getInstallationAll(int compteId) {
		final String uri = urlRest+"/getInstallationAllRest/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		Installation[] result = restTemplate.getForObject(uri, Installation[].class);

		return result;
	}

	@Override
	public LieuElimination[] getLieuEliminationArr() {
		final String uri = urlRest+"/getLieuEliminationArrRest";
		RestTemplate restTemplate = new RestTemplate();
		LieuElimination[] result = restTemplate.getForObject(uri, LieuElimination[].class);
		return result;
	}

	@Override
	public InstallationAutorise[] getInstallationAutoriseArr() {
		final String uri = urlRest+"/getInstallationAutoriseArrRest";
		RestTemplate restTemplate = new RestTemplate();
		InstallationAutorise[] result = restTemplate.getForObject(uri, InstallationAutorise[].class);
		return result;
	}

	@Override
	public String setFilQualifToInstall(int id, MultipartFile[] fileToUpload) {
		final String uris = urlRest + "/setFilQualifToInstallRest/"+id;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();
		bodyMapw.add("file", new FileSystemResource(convert(fileToUpload[0])));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		return response.getBody();

	}

	@Override
	public String setFilImpactToDemandeInfo(int id, MultipartFile[] fileToUpload) {
		final String uris = urlRest + "/setFilImpactToDemandeInfoRest/"+id;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();
		bodyMapw.add("file", new FileSystemResource(convert(fileToUpload[0])));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		return response.getBody();

	}

	@Override
	public String updateDetailRegionInstall(int id, String region, String prefecture, String commune,String type) {
		final String uri = urlRest+"/updateDetailRegionInstall/"+id +"/"+region + "/" +prefecture+"/"+commune+"/"+type;
		RestTemplate restTemplate = new RestTemplate();
		String result = restTemplate.getForObject(uri,String.class);
		return result;
	}

	@Override
	public Integer getcountEIEByType(String type,int id_compt) {
		final String uri = urlRest+"/getcountEIEByTypeRest/"+type +"/"+id_compt;
		RestTemplate restTemplate = new RestTemplate();
		Integer result = restTemplate.getForObject(uri,Integer.class);
		return result;
	}

	@Override
	public Notification getNotificationByIdComptId(int id, int id_compt) {
		final String uri = urlRest+"/getNotificationByIdComptIdRest/"+id +"/"+id_compt;
		RestTemplate restTemplate = new RestTemplate();
		Notification result = restTemplate.getForObject(uri,Notification.class);
		return result;
	}

	@Override
	public Notification getNotificationById(int id) {
		final String uri = urlRest+"/getNotificationByIdRest/"+id;
		RestTemplate restTemplate = new RestTemplate();
		Notification result = restTemplate.getForObject(uri,Notification.class);
		return result;
	}

	@Override
	public String setAvisProjetDemandeInformation(int id, MultipartFile[] fileToUpload) {
		final String uris = urlRest + "/setAvisProjetDemandeInformationRest/"+id;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();
		bodyMapw.add("file", new FileSystemResource(convert(fileToUpload[0])));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		return response.getBody();
	}

	public String saveProducteurNotification(String nom_fr, String nom_ar, String contact_fr,String idf,String adresse_fr, String tel, String fax, String mail, int id_notif,int id_prod) {
		final String uris = urlRest + "/saveProducteurNotificationRest/"+id_notif+"/"+id_prod;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();

		bodyMapw.add("nom_fr", nom_fr);
		bodyMapw.add("nom_ar", nom_ar);
		bodyMapw.add("contact_fr",contact_fr);
		bodyMapw.add("idf",idf);
		bodyMapw.add("adresse_fr",adresse_fr);
		bodyMapw.add("tel",tel);
		bodyMapw.add("fax",fax);
		bodyMapw.add("mail",mail);

		HttpHeaders headers = new HttpHeaders();
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		String nn = response.getHeaders().getLocation().getPath().split("/")[2];
		return nn;
	}

	@Override
	public String saveTransporeuretranger(MultipartFile[] fileToUpload, String raison, String matricule, String type_vehicule,String adresse ,int id_notif, int id_trans) {
		final String uris = urlRest + "/saveTransporeuretranger/"+id_notif+"/"+id_trans;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();
		if(fileToUpload.length>0)
			bodyMapw.add("file", new FileSystemResource(convert(fileToUpload[0])));
		else
			bodyMapw.add("file", null);
		bodyMapw.add("raison", raison);
		bodyMapw.add("type_vehicule", type_vehicule);
		bodyMapw.add("matricule",matricule);
		bodyMapw.add("adresse",adresse);
		//bodyMapw.add("port",port);


		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		String nn = response.getHeaders().getLocation().getPath().split("/")[2];
		return nn;
	}

	@Override
	public String saveTransporeuretrangerXD(MultipartFile[] fileToUpload, String raison, String matricule, String type_vehicule,String adresse ,String port[],int id_notif, int id_trans) {
		final String uris = urlRest + "/saveTransporeuretrangerXD/"+id_notif+"/"+id_trans;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();
		if(fileToUpload.length>0)
			bodyMapw.add("file", new FileSystemResource(convert(fileToUpload[0])));
		else
			bodyMapw.add("file", null);
		bodyMapw.add("raison", raison);
		bodyMapw.add("type_vehicule", type_vehicule);
		bodyMapw.add("matricule",matricule);
		bodyMapw.add("adresse",adresse);
		bodyMapw.add("port",port);


		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		String nn = response.getHeaders().getLocation().getPath().split("/")[2];
		return nn;
	}


	@Override
	public String savePort(String nom_fr, int pays ,int id_notif, int id_port) {
		final String uris = urlRest + "/savePortRest/"+id_notif+"/"+id_port;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();

		bodyMapw.add("nom_fr",nom_fr);
		bodyMapw.add("pays", pays);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris, HttpMethod.POST, requestEntity, String.class);
		String nn = response.getHeaders().getLocation().getPath().split("/")[2];
		return nn;
	}

	@Override
	public String saveTransporeuretrangerNational(MultipartFile[] fileToUpload, String raison, String matricule, String type_vehicule,String adresse,int id_notif, int id_trans) {
		final String uris = urlRest + "/saveTransporeuretrangerNational/"+id_notif+"/"+id_trans;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();
		if(fileToUpload.length>0)
			bodyMapw.add("file", new FileSystemResource(convert(fileToUpload[0])));
		else
			bodyMapw.add("file", null);
		bodyMapw.add("raison", raison);
		bodyMapw.add("type_vehicule", type_vehicule);
		bodyMapw.add("matricule",matricule);
		bodyMapw.add("adresse",adresse);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		String nn = response.getHeaders().getLocation().getPath().split("/")[2];
		return nn;
	}

	@Override
	public void deleteTransporteuretranger(int id_notif, int id_trans) {
		final String uri = urlRest+"/deleteTransporteuretrangerRest/"+id_trans+"/"+id_notif ;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getForObject(uri,String.class);
	}

	@Override
	public void deleteProducteurNotification(int id_notif, int id_prod) {
		final String uri = urlRest+"/deleteProducteurNotificationRest/"+id_prod+"/"+id_notif ;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getForObject(uri,String.class);
	}


	@Override
	public void deleteAutoriteNotif(int id_notif, int id_aut) {
		final String uri = urlRest+"/deleteAutoriteNotifRest/"+id_aut+"/"+id_notif ;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getForObject(uri,String.class);
	}

	@Override
	public void deletePort(int id, int id_port) {
		final String uri = urlRest+"/deletePortRest/"+id +"/"+id_port;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getForObject(uri,String.class);
	}

	@Override
	public void deletePortNotif(int id, int id_port) {
		final String uri = urlRest+"/deletePortNotifRest/"+id +"/"+id_port;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getForObject(uri,String.class);
	}


	@Override
	public TransporteurEtranger getTransporteurEtrangerById(int id_trans) {
		final String uri = urlRest+"/getTransporteurEtrangerByIdRest/"+id_trans ;
		RestTemplate restTemplate = new RestTemplate();
		TransporteurEtranger result = restTemplate.getForObject(uri,TransporteurEtranger.class);
		return result;
	}

	@Override
	public Producteur getProducteurById(int id_trans) {
		final String uri = urlRest+"/getProducteurByIdRest/"+id_trans ;
		RestTemplate restTemplate = new RestTemplate();
		Producteur result = restTemplate.getForObject(uri,Producteur.class);
		return result;
	}

	@Override
	public String setStatutNotification(int id_notif, int id_statut, int compteId,String type) {
		final String uri = urlRest+"/setStatutNotificationRest/"+id_notif+"/"+id_statut+"/"+compteId+"/"+type ;
		RestTemplate restTemplate = new RestTemplate();
		String result = restTemplate.getForObject(uri,String.class);
		return result;
	}

	@Override
	public String getStatutNumNotification(int id) {
		final String uri = urlRest+"/getStatutNumNotificationREST/"+id ;
		RestTemplate restTemplate = new RestTemplate();
		String result = restTemplate.getForObject(uri,String.class);
		return result;
	}

	@Override
	public String setStatutNotification1(int id_notif, int id_statut, int compteId) {
		final String uri = urlRest+"/setStatutNotificationRest1/"+id_notif+"/"+id_statut+"/"+compteId ;
		RestTemplate restTemplate = new RestTemplate();
		String result = restTemplate.getForObject(uri,String.class);
		return result;
	}

	@Override
	public DocumentDechetND getDocumentDechetND() {
		final String uri = urlRest+"/getDocumentDechetNDRest";
		RestTemplate restTemplate = new RestTemplate();
		DocumentDechetND result = restTemplate.getForObject(uri,DocumentDechetND.class);
		return result;
	}

	@Override
	public List<Commune> savecommuneDetailRegion(String id, int id_dmd, int compteId) {
		final String uri = urlRest+"/savecommuneDetailRegionRest/"+id+"/"+id_dmd+"/"+compteId;
		RestTemplate restTemplate = new RestTemplate();
		Commune[] result = restTemplate.getForObject(uri,Commune[].class);
		return Arrays.asList(result);
	}

	@Override
	public void updateDemandeInformation(int id, DemandeInformation d ) {
		final String uri = urlRest+"/updateDemandeInformationRest/"+id;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.postForLocation(uri, d, DemandeInformation.class);
	}

	@Override
	public String updateDemandeInformationEE(int id, String intitule_projet, double montant_investissement, String tronsfrontalier, String interregion) {
		final String uri = urlRest+"/updateDemandeInformationEERest/"+id+"/"+intitule_projet+"/"+montant_investissement+"/"+tronsfrontalier+"/"+interregion;
		RestTemplate restTemplate = new RestTemplate();
		return restTemplate.getForObject(uri, String.class);
	}

	@Override
	public String updateDemandeInformationAE(int id, String intitule_projet, double montant_investissement, String nature_projet) {
		final String uri = urlRest+"/updateDemandeInformationAERest/"+id+"/"+intitule_projet+"/"+montant_investissement+"/"+nature_projet;
		RestTemplate restTemplate = new RestTemplate();
		return restTemplate.getForObject(uri, String.class);
	}


	@Override
	public String setFileToDemande(int id, MultipartFile[] fileToUpload) {
		final String uris = urlRest + "/setFileToDemandeRest/"+id;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();

		bodyMapw.add("file",new FileSystemResource(convert(fileToUpload[0])));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		return response.getBody();
	}
	@Override
	public List<TransporteurParam> getTransporteurParamByCode(int code) {
		final String uri = urlRest+"/getTransporteurParamByCodeRest/"+code;
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<TransporteurParam[]> result = restTemplate.getForEntity(uri,TransporteurParam[].class);
		return result.getBody()!=null?Arrays.asList(result.getBody()):null;
	}
	@Override
	public Notification saveDocumentMouvement(int id_notif, int id_detail, int qte, MultipartFile file) {
		final String uris = urlRest + "/saveDocumentMouvementRest/"+id_notif+"/"+id_detail;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();

		bodyMapw.add("file",new FileSystemResource(convert(file)));
		bodyMapw.add("qte",qte);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Notification> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, Notification.class);
		return response.getBody();
	}
	@Override
	public Notification deleteDocMouvbyId(int id,int id_notif) {
		final String uri = urlRest+"/deleteDocMouvbyIdRest/"+id+"/"+id_notif;
		RestTemplate restTemplate = new RestTemplate();
		return restTemplate.getForObject(uri,Notification.class);
	}
	@Override
	public String setNbrColies(int id_notif, int nbr) {
		final String uri = urlRest+"/setNbrColiesRest/"+id_notif+"/"+nbr;
		RestTemplate restTemplate = new RestTemplate();
		return restTemplate.getForObject(uri,String.class);
	}
	@Override
	public String setdocMouvement(MultipartFile file, int id_notif, int type) {
		final String uris = urlRest + "/setdocMouvementRest/"+id_notif+"/"+type;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();
		bodyMapw.add("file",new FileSystemResource(convert(file)));

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		return response.getBody();
	}

	@Override
	public String setdocMouvementNonDangereux(MultipartFile file, int id_notif) {
		final String uris = urlRest + "/setdocMouvementNonDangereuxRest/"+id_notif;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();
		bodyMapw.add("file",new FileSystemResource(convert(file)));

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		return response.getBody();
	}
	//autorisation@2020
//	admin_auto



	//dounia

	@Override
	public int getNombreEIEByUser(int compteId, String type) {
		final String uri = urlRest+"/getNombreEIEByUserRest/"+compteId + "/" + type;
		RestTemplate restTemplate = new RestTemplate();
		Integer  result = restTemplate.getForObject(uri, Integer.class);
		return result;
	}
	@Override
	public DeclarationTransporteur getdeclarationbyNotification(int id_notification) {
		final String uri = urlRest+"/getdeclarationbyNotificationRest/"+id_notification ;
		RestTemplate restTemplate = new RestTemplate();
		DeclarationTransporteur  result = restTemplate.getForObject(uri, DeclarationTransporteur.class);
		return result;
	}

	@Override
	public void createDeclarationTransporteur(int id_trans, int id_notif, int id_decl,MultipartFile[] file) {
		final String uri = urlRest+"/createDeclarationTransporteurRest/"+id_trans+"/"+id_notif+"/"+id_decl ;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();
		if(file.length!=0)
			bodyMapw.add("file",new FileSystemResource(convert(file[0])));
		else
			bodyMapw.add("file",null);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uri,
				HttpMethod.POST, requestEntity, String.class);

	}

	@Override
	public DeclarationTransporteur getDeclaravionValideByNotificationId(int id_notification) {
		final String uri = urlRest+"/getDeclaravionValideByNotificationIdRest/"+id_notification ;
		RestTemplate restTemplate = new RestTemplate();
		DeclarationTransporteur  result = restTemplate.getForObject(uri, DeclarationTransporteur.class);
		return result;
	}

	@Override
	public Notification changerEtat(int id_notification,String Type) {
		final String uri = urlRest+"/changerEtat/"+id_notification+"/"+Type ;
		RestTemplate restTemplate = new RestTemplate();
		Notification  result = restTemplate.getForObject(uri, Notification.class);
		return result;
	}

	@Override
	public List<TransporteurParam> getListTransporteurParamByCodeNotInNotif(int id_notification) {
		final String uri = urlRest+"/getListTransporteurParamByCodeNotInNotifRest/"+id_notification;
		RestTemplate restTemplate = new RestTemplate();
		TransporteurParam[] result= restTemplate.getForObject(uri,TransporteurParam[].class);
		return Arrays.asList(result);
	}

	@Override
	public List<TransporteurParam> search(String txt) {
		final String uri = urlRest+"/searchRest/"+txt;
		RestTemplate restTemplate = new RestTemplate();
		TransporteurParam[] result = restTemplate.getForObject(uri,TransporteurParam[].class);
		return Arrays.asList(result);
	}

	@Override
	public String saveDemandeAE(String id, MultipartFile[] fileToUpload, int compteId) {
		final String uris = urlRest + "/saveDemandeAERest/"+id+"/"+compteId;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();
		if(fileToUpload.length>0)
			bodyMapw.add("file",new FileSystemResource(convert(fileToUpload[0])));
		else
			bodyMapw.add("file",null);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		String nn = response.getHeaders().getLocation().getPath().split("/")[2];
		return nn;
	}

	@Override
	public String saveFile_complementaire(int id_dmd, int id_ae, MultipartFile file, int compteId) {
		final String uris = urlRest + "/saveFile_complementaireRest/"+id_dmd+"/"+id_ae+"/"+compteId;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();
		bodyMapw.add("file",new FileSystemResource(convert(file)));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		return response.getBody();
	}

	@Override
	public String saveFile_Rapport_ae(int id_dmd,int id_rapport, MultipartFile file, int compteId) {
		final String uris = urlRest + "/saveFile_Rapport_aeRest/"+id_dmd+"/"+id_rapport+"/"+compteId;
		MultiValueMap<String, Object> bodyMapw = new LinkedMultiValueMap<String,Object>();
		bodyMapw.add("file",new FileSystemResource(convert(file)));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(bodyMapw, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uris,
				HttpMethod.POST, requestEntity, String.class);
		return response.getBody();
	}

	@Override
	public DeclarationTransporteur getDeclaravionByNotificationId(int id_notification) {
		final String uri = urlRest+"/getDeclaravionByNotificationIdRest/"+id_notification ;
		RestTemplate restTemplate = new RestTemplate();
		DeclarationTransporteur  result = restTemplate.getForObject(uri, DeclarationTransporteur.class);
		return result;
	}

	@Override
	public DocumentImportationDechet getDocumentImortationDechet() {
		final String uri = urlRest+"/getDocumentImortationDechetRest" ;
		RestTemplate restTemplate = new RestTemplate();
		DocumentImportationDechet  result = restTemplate.getForObject(uri, DocumentImportationDechet.class);
		return result;
	}
}
