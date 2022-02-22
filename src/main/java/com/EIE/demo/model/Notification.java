package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "notification")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })

public class Notification implements Serializable {

	private static final long serialVersionUID = 1L;

	public Notification() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_notification")
	private int id_notification;

	public int getId_notification() {
		return id_notification;
	}

	public void setId_notification(int id_notification) {
		this.id_notification = id_notification;
	}

	@Column(name = "num_notification", nullable = true, columnDefinition = "NVARCHAR(255)",unique = true)
	private String num_notification;
	@Column(name = "premier", nullable = true)
	private String premier;
	@Column(name = "dernier", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String dernier;
	@Column(name = "nom", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom;
	@Column(name = "adresse", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String adresse;
	@Column(name = "courrier", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String courrier;
	@Column(name = "personne", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String personne;
	@Column(name = "tel", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String tel;
	@Column(name = "telecopie", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String telecopie;
	@Column(name = "numerCorrespondance", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String numerCorrespondance;
	@Column(name = "dateCoresspondance", nullable = true)
	private Date dateCoresspondance;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idautorite")
	private Autorite autorite;

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getCourrier() {
		return courrier;
	}

	public void setCourrier(String courrier) {
		this.courrier = courrier;
	}

	public String getPersonne() {
		return personne;
	}

	public void setPersonne(String personne) {
		this.personne = personne;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTelecopie() {
		return telecopie;
	}

	public void setTelecopie(String telecopie) {
		this.telecopie = telecopie;
	}

	@Column(name = "zf_et", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String zf_et;



	public String getZf_et() {
		return zf_et;
	}

	public void setZf_et(String zf_et) {
		this.zf_et = zf_et;
	}

	public String getPremier() {
		return premier;
	}

	public void setPremier(String premier) {
		this.premier = premier;
	}

	public String getDernier() {
		return dernier;
	}

	public void setDernier(String dernier) {
		this.dernier = dernier;
	}

	@Column(name = "uniques", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String uniques;

	@Column(name = "lieu", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String lieu;

	public String getUniques() {
		return uniques;
	}

	public String getLieu() {
		return lieu;
	}

	public void setLieu(String lieu) {
		this.lieu = lieu;
	}

	public void setUniques(String uniques) {
		this.uniques = uniques;
	}

	@Column(name = "operation", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String operation;

	@Column(name = "no", nullable = true, columnDefinition = "int default 0")
	private int no;

	@Column(name = "commentaire", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String commentaire;

	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "notification_paysautorite", joinColumns = {
			@JoinColumn(name = "id_notiff") }, inverseJoinColumns = { @JoinColumn(name = "id_paysaut") })

	private List<PaysAutorite> paysAutorites = new ArrayList<>();

	public String getCommentaire() {
		return commentaire;
	}

	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}

	public String getQuantite_reel() {
		return quantite_reel;
	}

	public void setQuantite_reel(String quantite_reel) {
		this.quantite_reel = quantite_reel;
	}

	public String getManutention() {
		return manutention;
	}

	public void setManutention(String manutention) {
		this.manutention = manutention;
	}

	public String getNbr_colis() {
		return nbr_colis;
	}

	public void setNbr_colis(String nbr_colis) {
		this.nbr_colis = nbr_colis;
	}

	public String getSerie() {
		return serie;
	}

	public void setSerie(String serie) {
		this.serie = serie;
	}

	public String getNbr_total() {
		return nbr_total;
	}

	public void setNbr_total(String nbr_total) {
		this.nbr_total = nbr_total;
	}

	public Date getDate_reel() {
		return date_reel;
	}

	public void setDate_reel(Date date_reel) {
		this.date_reel = date_reel;
	}

	@Column(name = "quantite", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String quantite;

	@Column(name = "quantite_reel", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String quantite_reel;

	@Column(name = "manutention", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String manutention;

	@Column(name = "nbr_colis", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nbr_colis;

	@Column(name = "serie", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String serie;
	@Column(name = "nbr_total", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nbr_total;
	@Column(name = "date_reel", nullable = true)
	private Date date_reel;
	@Column(name = "producteur_text", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String producteur_text;

	public String getProducteur_text() {
		return producteur_text;
	}

	public void setProducteur_text(String producteur_text) {
		this.producteur_text = producteur_text;
	}

	public Code getCode() {
		return code;
	}

	public void setCode(Code code) {
		this.code = code;
	}

	public Classification getClassification() {
		return classification;
	}

	public void setClassification(Classification classification) {
		this.classification = classification;
	}

	@Column(name = "expedition", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String expedition;
	@Column(name = "dateD", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String dateD;
	@Column(name = "dateF", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String dateF;

	@Column(name = "codeNationalXD", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String codeNationalXD;
	@Column(name = "codeNationalIm", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String codeNationalIm;
	@Column(name = "CodeCE", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String CodeCE;
	@Column(name = "etat", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String etat;

	public String getCodeNationalXD() {
		return codeNationalXD;
	}

	public void setCodeNationalXD(String codeNationalXD) {
		this.codeNationalXD = codeNationalXD;
	}

	public String getCodeNationalIm() {
		return codeNationalIm;
	}

	public void setCodeNationalIm(String codeNationalIm) {
		this.codeNationalIm = codeNationalIm;
	}

	public String getCodeCE() {
		return CodeCE;
	}

	public void setCodeCE(String codeCE) {
		CodeCE = codeCE;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

	@Column(name = "url_doc_signer", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url_doc_signer;

	@Column(name = "url_dmd_lettre", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url_dmd_lettre;

	@Column(name = "url_lettre", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url_lettre;

	@Column(name = "url_document_validation", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url_document_validation;

	@Column(name = "passwordAutorite", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String passwordAutorite;

	public String getPasswordAutorite() {
		return passwordAutorite;
	}

	public void setPasswordAutorite(String passwordAutorite) {
		this.passwordAutorite = passwordAutorite;
	}

	@Column(name = "url_lettre_conforme", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url_lettre_conforme;

	@Column(name = "url_lettre_nonconforme", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url_lettre_nonconforme;

	@Column(name = "destination_final", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String destination_final;

	public String getDestination_final() {
		return destination_final;
	}

	public StatutProjet getStatut() {
		return statut;
	}

	public void setStatut(StatutProjet statut) {
		this.statut = statut;
	}

	public void setDestination_final(String destination_final) {
		this.destination_final = destination_final;
	}

	@Column(name = "dateValidation", nullable = true)
	private Date dateValidation;
	@Column(name = "dateDepot", nullable = true)
	private Date dateDepot;

	@Column(name = "dateTransaction", nullable = true)
	private Date dateTransaction;

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public Date getDateTransaction() {
		return dateTransaction;
	}

	public void setDateTransaction(Date dateTransaction) {
		this.dateTransaction = dateTransaction;
	}

	public Date getDateDepot() {
		return dateDepot;
	}

	public void setDateDepot(Date dateDepot) {
		this.dateDepot = dateDepot;
	}



	public Date getDateValidation() {
		return dateValidation;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_statut")
	private StatutProjet statut;

	public void setDateValidation(Date dateValidation) {
		this.dateValidation = dateValidation;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idimportateurNotifiant")
	private ImportateurNotifiant importateur;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "unite_id")
	private Unite unite;

	public Unite getUnite() {
		return unite;
	}

	public void setUnite(Unite unite) {
		this.unite = unite;
	}

	public String getNum_notification() {
		return num_notification;
	}

	public void setNum_notification(String num_notification) {
		this.num_notification = num_notification;
	}

	public String getQuantite() {
		return quantite;
	}

	public void setQuantite(String quantite) {
		this.quantite = quantite;
	}

	public String getExpedition() {
		return expedition;
	}

	public void setExpedition(String expedition) {
		this.expedition = expedition;
	}

	public String getDateD() {
		return dateD;
	}

	public void setDateD(String dateD) {
		this.dateD = dateD;
	}

	public String getDateF() {
		return dateF;
	}

	public void setDateF(String dateF) {
		this.dateF = dateF;
	}

	public ImportateurNotifiant getImportateur() {
		return importateur;
	}

	public void setImportateur(ImportateurNotifiant importateur) {
		this.importateur = importateur;
	}

	public Producteur getProducteur() {
		return producteur;
	}

	public void setProducteur(Producteur producteur) {
		this.producteur = producteur;
	}

	public Eliminateur getEliminateur() {
		return eliminateur;
	}

	public void setEliminateur(Eliminateur eliminateur) {
		this.eliminateur = eliminateur;
	}

	public TypeConditionnement getTypeconditionnement() {
		return typeconditionnement;
	}

	public void setTypeconditionnement(TypeConditionnement typeconditionnement) {
		this.typeconditionnement = typeconditionnement;
	}

	public ZonneFranche getZonneFranche() {
		return zonneFranche;
	}

	public void setZonneFranche(ZonneFranche zonneFranche) {
		this.zonneFranche = zonneFranche;
	}

	public CaracteristquePhysique getCaracteristquePhysique() {
		return caracteristquePhysique;
	}

	public void setCaracteristquePhysique(CaracteristquePhysique caracteristquePhysique) {
		this.caracteristquePhysique = caracteristquePhysique;
	}



	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idproducteur")
	private Producteur producteur;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "regionId")
	private Region region;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "prefectureId")
	private Prefecture prefecture;
	public Prefecture getPrefecture() {
		return prefecture;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "notification_producteur", joinColumns = {
			@JoinColumn(name = "id_notifs_p") }, inverseJoinColumns = { @JoinColumn(name = "id_prods") })

	private List<Producteur> producteurs = new ArrayList<>();

	public void setPrefecture(Prefecture prefecture) {
		this.prefecture = prefecture;
	}

	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "compte_id")
	private Compte compte;

	public List<TransporteurParam> getTransporteur() {
		return transporteur;
	}

	public void setTransporteur(List<TransporteurParam> transporteur) {
		this.transporteur = transporteur;
	}

	public Compte getCompte() {
		return compte;
	}

	public void setCompte(Compte compte) {
		this.compte = compte;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "code_id")
	private Code code;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_type_renouvellement")
	private TypeRenouvellement typeRenouvellement;

	@Column(name = "id_notif_original", nullable = true)
	private Integer id_notif_original=0;

	public TypeRenouvellement getTypeRenouvellement() {
		return typeRenouvellement;
	}

	public void setTypeRenouvellement(TypeRenouvellement typeRenouvellement) {
		this.typeRenouvellement = typeRenouvellement;
	}

	public Integer getId_notif_original() {
		return id_notif_original;
	}

	public void setId_notif_original(Integer id_notif_original) {
		this.id_notif_original = id_notif_original;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "classification_id")
	private Classification classification;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ideliminateur")
	private Eliminateur eliminateur;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idtypeconditionnement")
	private TypeConditionnement typeconditionnement;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idzonneFranche")
	private ZonneFranche zonneFranche;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_pays")
	private Pays pays;

	public Pays getPays() {
		return pays;
	}

	public void setPays(Pays pays) {
		this.pays = pays;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idcaracteristquePhysique")
	private CaracteristquePhysique caracteristquePhysique;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "transporteur_id")
	private Transporteur transporteurOne;

	public Transporteur getTransporteurOne() {
		return transporteurOne;
	}

	public void setTransporteurOne(Transporteur transporteurOne) {
		this.transporteurOne = transporteurOne;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "notif_tranport", joinColumns = { @JoinColumn(name = "idNotification") }, inverseJoinColumns = {
			@JoinColumn(name = "idTransporteur") })

	private List<TransporteurParam> transporteur = new ArrayList<TransporteurParam>();



	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "notification_transporteur_etranger", joinColumns = { @JoinColumn(name = "idNotification") }, inverseJoinColumns = {
			@JoinColumn(name = "id_TransporteurEtranger") })

	private List<TransporteurEtranger> transporteur_etranger = new ArrayList<TransporteurEtranger>();

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;
	@Column(name = "dateaut1", nullable = true)
	private Date dateaut1;
	@Column(name = "dateaut2", nullable = true)
	private Date dateaut2;


	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "lieux_elimination")
	private LieuElimination lieux_elimination;

	@Column(name = "url_document_mouvement", nullable = true)
	private String url_document_mouvement;

	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "notification_port", joinColumns = {
			@JoinColumn(name = "id_notif_port") }, inverseJoinColumns = { @JoinColumn(name = "id_port_notif") })

	private List<Port> ports = new ArrayList<Port>();

	@Column(name = "dateConteur", nullable = true)
	private Date dateConteur;

	@Column(name = "nbJour", nullable = true, columnDefinition = "int default 0")
	private Integer nbJour;

	@Column(name = "url_certicat_elimination", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url_certicat_elimination;

	@Column(name = "url_quantite_justificatif", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url_quantite_justificatif;

	@Column(name = "Operationdelimination", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String Operationdelimination;

	@Column(name = "CodeH", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String CodeH;

	public String getCodeH() {
		return CodeH;
	}

	public void setCodeH(String codeH) {
		CodeH = codeH;
	}

	public String getOperationdelimination() {
		return Operationdelimination;
	}

	public void setOperationdelimination(String operationdelimination) {
		Operationdelimination = operationdelimination;
	}

	public String getUrl_certicat_elimination() {
		return url_certicat_elimination;
	}

	public void setUrl_certicat_elimination(String url_certicat_elimination) {
		this.url_certicat_elimination = url_certicat_elimination;
	}

	public String getUrl_quantite_justificatif() {
		return url_quantite_justificatif;
	}

	public void setUrl_quantite_justificatif(String url_quantite_justificatif) {
		this.url_quantite_justificatif = url_quantite_justificatif;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "notification_DetailDocMouvement", joinColumns = { @JoinColumn(name = "idNotification") }, inverseJoinColumns = {
			@JoinColumn(name = "id_doc_mouvement") })

	private List<DetailDocumentMouvement> docMouvement = new ArrayList<DetailDocumentMouvement>();



	public Date getDateConteur() {
		return dateConteur;
	}

	public void setDateConteur(Date dateConteur) {
		this.dateConteur = dateConteur;
	}

	public Integer getNbJour() {
		return nbJour;
	}

	public void setNbJour(Integer nbJour) {
		this.nbJour = nbJour;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Date getDateaut1() {
		return dateaut1;
	}

	public void setDateaut1(Date dateaut1) {
		this.dateaut1 = dateaut1;
	}

	public Date getDateaut2() {
		return dateaut2;
	}

	public void setDateaut2(Date dateaut2) {
		this.dateaut2 = dateaut2;
	}

	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	public LieuElimination getLieux_elimination() {
		return lieux_elimination;
	}

	public void setLieux_elimination(LieuElimination lieux_elimination) {
		this.lieux_elimination = lieux_elimination;
	}

	public String getUrl_doc_signer() {
		return url_doc_signer;
	}

	public void setUrl_doc_signer(String url_doc_signer) {
		this.url_doc_signer = url_doc_signer;
	}

	public List<TransporteurEtranger> getTransporteur_etranger() {
		return transporteur_etranger;
	}

	public void setTransporteur_etranger(List<TransporteurEtranger> transporteur_etranger) {
		this.transporteur_etranger = transporteur_etranger;
	}
	public List<DetailDocumentMouvement> getDocMouvement() {
		return docMouvement;
	}
	public void setDocMouvement(List<DetailDocumentMouvement> docMouvement) {
		this.docMouvement = docMouvement;
	}

	public Autorite getAutorite() {
		return autorite;
	}

	public void setAutorite(Autorite autorite) {
		this.autorite = autorite;
	}

	public List<PaysAutorite> getPaysAutorites() {
		return paysAutorites;
	}

	public void setPaysAutorites(List<PaysAutorite> paysAutorites) {
		this.paysAutorites = paysAutorites;
	}

	public String getUrl_dmd_lettre() {
		return url_dmd_lettre;
	}

	public void setUrl_dmd_lettre(String url_dmd_lettre) {
		this.url_dmd_lettre = url_dmd_lettre;
	}

	public String getUrl_lettre() {
		return url_lettre;
	}

	public void setUrl_lettre(String url_lettre) {
		this.url_lettre = url_lettre;
	}

	public String getUrl_lettre_conforme() {
		return url_lettre_conforme;
	}

	public void setUrl_lettre_conforme(String url_lettre_conforme) {
		this.url_lettre_conforme = url_lettre_conforme;
	}

	public String getUrl_lettre_nonconforme() {
		return url_lettre_nonconforme;
	}

	public void setUrl_lettre_nonconforme(String url_lettre_nonconforme) {
		this.url_lettre_nonconforme = url_lettre_nonconforme;
	}

	public List<Producteur> getProducteurs() {
		return producteurs;
	}

	public void setProducteurs(List<Producteur> producteurs) {
		this.producteurs = producteurs;
	}

	public String getUrl_document_validation() {
		return url_document_validation;
	}
	public void setUrl_document_validation(String url_document_validation) {
		this.url_document_validation = url_document_validation;
	}
	public List<Port> getPorts() {
		return ports;
	}

	public void setPorts(List<Port> ports) {
		this.ports = ports;
	}

	public
	String getNumerCorrespondance() {
		return numerCorrespondance;
	}

	public
	void setNumerCorrespondance(String numerCorrespondance) {
		this.numerCorrespondance = numerCorrespondance;
	}

	public
	Date getDateCoresspondance() {
		return dateCoresspondance;
	}

	public
	void setDateCoresspondance(Date dateCoresspondance) {
		this.dateCoresspondance = dateCoresspondance;
	}

	public
	String getUrl_document_mouvement() {
		return url_document_mouvement;
	}

	public
	void setUrl_document_mouvement(String url_document_mouvement) {
		this.url_document_mouvement = url_document_mouvement;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "installationautorises")
	private InstallationAutorise installationAutorise;

	public
	InstallationAutorise getInstallationAutorise() {
		return installationAutorise;
	}

	public
	void setInstallationAutorise(InstallationAutorise installationAutorise) {
		this.installationAutorise = installationAutorise;
	}

	@Column(name = "autre", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String autre;

	public
	String getAutre() {
		return autre;
	}

	public
	void setAutre(String autre) {
		this.autre = autre;
	}
}
