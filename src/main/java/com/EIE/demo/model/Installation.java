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
@Table(name = "installation")


@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class Installation implements Serializable {

	public Installation() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_installation")
	private int id_installation;

	@Column(name = "projet", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String projet;

	@Column(name = "motifRefus", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String motifRefus;

	@Column(name = "operation", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String operation;

	@Column(name = "site", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String site;

	@Column(name = "quantite", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String quantite;

	@Column(name = "description", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String description;
	@Column(name = "structure", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String structure;
	@Column(name = "type_appareil", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String type_appareil;

	@Column(name = "horaire_exploitation", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String horaire_exploitation;
	@Column(name = "horaire_exploitation_fin", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String horaire_exploitation_fin;

	@Column(name = "nbr_equipe_travail", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nbr_equipe_travail;

	@Column(name = "qualification", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String qualification;

	@Column(name = "formation", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String formation;

	@Column(name = "id_installOriginale", nullable = true)
	private Integer id_installOriginale=0;

	@Column(name = "ife", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String ife;
	@Column(name = "raison", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String raison;
	@Column(name = "tel", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String tel;
	@Column(name = "fax", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String fax;
	@Column(name = "email", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String email;

	@Column(name = "adresse", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String adresse;

	@Column(name = "document_attache", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String document_attache;


	@Column(name = "conclusion", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String conclusion;


	@Column(name = "resultat", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String resultat;

	@Column(name = "commentaire", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String commentaire;

	@Column(name = "url_doc_signer", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url_doc_signer;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "regionId")
	private Region region;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "prefectureId")
	private Prefecture prefecture;

	@Column(name = "complement", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String complement;

	public Prefecture getPrefecture() {
		return prefecture;
	}

	public void setPrefecture(Prefecture prefecture) {
		this.prefecture = prefecture;
	}

	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public String getDocument_attache() {
		return document_attache;
	}

	public void setDocument_attache(String document_attache) {
		this.document_attache = document_attache;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getIfe() {
		return ife;
	}

	public void setIfe(String ife) {
		this.ife = ife;
	}

	public String getRaison() {
		return raison;
	}

	public void setRaison(String raison) {
		this.raison = raison;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "num_demande", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String num_demande;

	@Column(name = "no", nullable = true, columnDefinition = "int default 0")
	private int no;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getNum_demande() {
		return num_demande;
	}

	public void setNum_demande(String num_demande) {
		this.num_demande = num_demande;
	}

	public int getId_installation() {
		return id_installation;
	}

	public void setId_installation(int id_installation) {
		this.id_installation = id_installation;
	}

	public String getProjet() {
		return projet;
	}

	public void setProjet(String projet) {
		this.projet = projet;
	}

	public String getMotifRefus() {
		return motifRefus;
	}

	public void setMotifRefus(String motifRefus) {
		this.motifRefus = motifRefus;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getQuantite() {
		return quantite;
	}

	public void setQuantite(String quantite) {
		this.quantite = quantite;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStructure() {
		return structure;
	}

	public void setStructure(String structure) {
		this.structure = structure;
	}

	public String getType_appareil() {
		return type_appareil;
	}

	public void setType_appareil(String type_appareil) {
		this.type_appareil = type_appareil;
	}

	public String getHoraire_exploitation() {
		return horaire_exploitation;
	}

	public void setHoraire_exploitation(String horaire_exploitation) {
		this.horaire_exploitation = horaire_exploitation;
	}

	public String getNbr_equipe_travail() {
		return nbr_equipe_travail;
	}

	public void setNbr_equipe_travail(String nbr_equipe_travail) {
		this.nbr_equipe_travail = nbr_equipe_travail;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getFormation() {
		return formation;
	}

	public void setFormation(String formation) {
		this.formation = formation;
	}

	

	public StatutProjet getStatut() {
		return statut;
	}

	public void setStatut(StatutProjet statut) {
		this.statut = statut;
	}

	public VisiteInstallation getVisite() {
		return visite;
	}

	public void setVisite(VisiteInstallation visite) {
		this.visite = visite;
	}

	public List<Participant> getParticipant() {
		return participant;
	}

	public void setParticipant(List<Participant> participant) {
		this.participant = participant;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_statut")
	private StatutProjet statut;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_visite_installation")
	private VisiteInstallation visite;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_unite")
	private Unite unite;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_activite")
	private NatureActivite nature;

	public NatureActivite getNature() {
		return nature;
	}

	public void setNature(NatureActivite nature) {
		this.nature = nature;
	}

	public Unite getUnite() {
		return unite;
	}

	public void setUnite(Unite unite) {
		this.unite = unite;
	}

	/*@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_code")
	private Code code;*/

	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "codeInstallation", joinColumns = {
			@JoinColumn(name = "id_installation") }, inverseJoinColumns = { @JoinColumn(name = "id_codes") })

	private List<Code> code = new ArrayList<>();

	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "codelistInstalationTmp", joinColumns = {
			@JoinColumn(name = "id_installation") }, inverseJoinColumns = { @JoinColumn(name = "id_code_tmp_inst") })

	private List<Code> codeTmp = new ArrayList<>();

	public List<Code> getCodeTmp() {
		return codeTmp;
	}

	public void setCodeTmp(List<Code> codeTmp) {
		this.codeTmp = codeTmp;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_compte")
	private Compte compte;


	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_type_renouvellement")
	private TypeRenouvellement typeRenouvellement;

	public TypeRenouvellement getTypeRenouvellement() {
		return typeRenouvellement;
	}

	public void setTypeRenouvellement(TypeRenouvellement typeRenouvellement) {
		this.typeRenouvellement = typeRenouvellement;
	}


	public List<Code> getCode() {
		return code;
	}

	public void setCode(List<Code> code) {
		this.code = code;
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

	public void setDateValidation(Date dateValidation) {
		this.dateValidation = dateValidation;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "participant_instal", joinColumns = {
			@JoinColumn(name = "id_instalation") }, inverseJoinColumns = { @JoinColumn(name = "id_participant") })

	private List<Participant> participant = new ArrayList<Participant>();

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;

	@Column(name = "dateDepot", nullable = true)
	private Date dateDepot;

	@Column(name = "dateValidation", nullable = true)
	private Date dateValidation;

	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "catagorie_instalation", joinColumns = {
			@JoinColumn(name = "id_installationn") }, inverseJoinColumns = { @JoinColumn(name = "id_categoriedechets") })

	private List<CategorieDechet> categorie = new ArrayList<>();

	@Column(name = "type", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String type;

	public String getType() {
		return type;
	}

	public List<CategorieDechet> getCategorie() {
		return categorie;
	}

	public void setCategorie(List<CategorieDechet> categorie) {
		this.categorie = categorie;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	public String getHoraire_exploitation_fin() {
		return horaire_exploitation_fin;
	}

	public void setHoraire_exploitation_fin(String horaire_exploitation_fin) {
		this.horaire_exploitation_fin = horaire_exploitation_fin;
	}

	public String getConclusion() {
		return conclusion;
	}

	public void setConclusion(String conclusion) {
		this.conclusion = conclusion;
	}

	public String getResultat() {
		return resultat;
	}

	public void setResultat(String resultat) {
		this.resultat = resultat;
	}

	public String getCommentaire() {
		return commentaire;
	}

	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}

	public Integer getId_installOriginale() {
		return id_installOriginale;
	}

	public void setId_installOriginale(Integer id_installOriginale) {
		this.id_installOriginale = id_installOriginale;
	}

	public Compte getCompte() {
		return compte;
	}

	public void setCompte(Compte compte) {
		this.compte = compte;
	}

	public String getUrl_doc_signer() {
		return url_doc_signer;
	}

	public void setUrl_doc_signer(String url_doc_signer) {
		this.url_doc_signer = url_doc_signer;
	}

	public
	String getComplement() {
		return complement;
	}

	public
	void setComplement(String complement) {
		this.complement = complement;
	}
}
