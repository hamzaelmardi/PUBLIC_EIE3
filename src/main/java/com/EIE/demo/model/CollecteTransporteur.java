package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
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
@Table(name = "collectetransporteur")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class CollecteTransporteur implements Serializable {

  public CollecteTransporteur() {

  }

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id_collecte")
  private int id_collecte;

  @Column(name = "demandeur_Nom", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String demandeur_Nom;

  @Column(name = "raison", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String raison;
  @Column(name = "cin", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String cin;
  public String getRaison() {
    return raison;
  }

  public void setRaison(String raison) {
    this.raison = raison;
  }

  public String getCin() {
    return cin;
  }

  public void setCin(String cin) {
    this.cin = cin;
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

  @Column(name = "demandeur_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String demandeur_ar;
  @Column(name = "idfiscale", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String idfiscale;
  @Column(name = "demandeurAdresse", nullable = true, columnDefinition = "NVARCHAR(MAX)")
  private String demandeurAdresse;
  @Column(name = "demandeurTel", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String demandeurTel;
  @Column(name = "demandeurFax", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String demandeurFax;
  @Column(name = "dateDepot", nullable = true)
  private Date dateDepot;

  @Column(name = "dateAvenant", nullable = true)
  private Date dateAvenant;

  @Column(name = "typevehicule", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String typevehicule;

  @Column(name = "dateValidation", nullable = true)
  private Date dateValidation;
  @Column(name = "demandeurEmail", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String demandeurEmail;
  @Column(name = "nombre_vehicule", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String nombre_vehicule;
  @Column(name = "nombre_conteneur", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String nombre_conteneur;
  @Column(name = "no", nullable = true, columnDefinition = "int default 0")
  private int no;
  @Column(name = "num_demande", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String num_demande;

  @Column(name = "typeDechet", nullable = true,columnDefinition = "NVARCHAR(255)")
  private String typeDechet;

  @Column(name = "deleteDateTime", nullable = true)
  private Date deleteDateTime;
  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "id_compte")
  private Compte compte;

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "id_statut")
  private StatutProjet statut;

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "id_type")
  private Type type;


  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "id_type_conteneur")
  private TypeConteneurs typeConteneurs;


  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "typeRenouvellement")
  private TypeRenouvellement typeRenouvellement;

  @ManyToMany(fetch = FetchType.LAZY)
  @Fetch(FetchMode.SELECT)
  @JoinTable(name = "collect_vehicules", joinColumns = {
          @JoinColumn(name = "id_collecte") }, inverseJoinColumns = { @JoinColumn(name = "id_vehicule") })

  private List<Vehicules> vehicules = new ArrayList<>();

  @ManyToMany(fetch = FetchType.LAZY)
  @Fetch(FetchMode.SELECT)
  @JoinTable(name = "codelist", joinColumns = {
          @JoinColumn(name = "id_collecte") }, inverseJoinColumns = { @JoinColumn(name = "id_code") })

  private List<Code> code = new ArrayList<>();

  @ManyToMany(fetch = FetchType.LAZY)
  @Fetch(FetchMode.SELECT)
  @JoinTable(name = "codelistTmp", joinColumns = {
          @JoinColumn(name = "id_collecte") }, inverseJoinColumns = { @JoinColumn(name = "id_code_tmp") })

  private List<Code> codeTmp = new ArrayList<>();

  public List<Code> getCodeTmp() {
    return codeTmp;
  }

  public void setCodeTmp(List<Code> codeTmp) {
    this.codeTmp = codeTmp;
  }

  @Column(name = "datecoll1", nullable = true)
  private Date datecoll1;

  @Column(name = "datecoll2", nullable = true)
  private Date datecoll2;
  
  @Column(name = "dateInformation", nullable = true)
  private Date dateInfomration;

  public Date getDateInfomration() {
	return dateInfomration;
}

public void setDateInfomration(Date dateInfomration) {
	this.dateInfomration = dateInfomration;
}

  @Column(name = "commentaire", nullable = true,columnDefinition = "NVARCHAR(MAX)")
  private String commentaire;

  @Column(name = "typeCollecte", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String typeCollecte;

  @Column(name = "url_doc_signer", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String url_doc_signer;

  @Column(name = "url_pv_commission", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String url_pv_commission;

  @ManyToMany(fetch = FetchType.LAZY)
  @Fetch(FetchMode.SELECT)
  @JoinTable(name = "collecte_reunion",
          joinColumns = { @JoinColumn(name = "id_collect") },
          inverseJoinColumns = { @JoinColumn(name = "id_reunions") })

  private List<Reunion> reunions = new ArrayList<Reunion>();

  @Column(name = "id_collecteOriginale", nullable = true)
  private Integer id_collecteOriginale=0;

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "regionId")
  private Region region;

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "prefectureId")
  private Prefecture prefecture;
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


  public String getCommentaire() {
    return commentaire;
  }

  public void setCommentaire(String commentaire) {
    this.commentaire = commentaire;
  }

  public Date getDatecoll1() {
    return datecoll1;
  }

  public void setDatecoll1(Date datecoll1) {
    this.datecoll1 = datecoll1;
  }

  public Date getDatecoll2() {
    return datecoll2;
  }

  public void setDatecoll2(Date datecoll2) {
    this.datecoll2 = datecoll2;
  }

  public int getId_collecte() {
    return id_collecte;
  }

  public void setId_collecte(int id_collecte) {
    this.id_collecte = id_collecte;
  }

  @Column(name = "document_attache", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String document_attache;
  @Column(name = "site", nullable = true, columnDefinition = "NVARCHAR(255)")
  private String site;

  public String getSite() {
    return site;
  }

  public void setSite(String site) {
    this.site = site;
  }

  public String getDocument_attache() {
    return document_attache;
  }

  public void setDocument_attache(String document_attache) {
    this.document_attache = document_attache;
  }

  public String getIdfiscale() {
    return idfiscale;
  }

  public String getDemandeur_Nom() {
    return demandeur_Nom;
  }

  public void setDemandeur_Nom(String demandeur_Nom) {
    this.demandeur_Nom = demandeur_Nom;
  }

  public String getDemandeur_ar() {
    return demandeur_ar;
  }

  public void setDemandeur_ar(String demandeur_ar) {
    this.demandeur_ar = demandeur_ar;
  }

  public Date getDeleteDateTime() {
    return deleteDateTime;
  }

  public void setDeleteDateTime(Date deleteDateTime) {
    this.deleteDateTime = deleteDateTime;
  }

  public Compte getCompte() {
    return compte;
  }

  public void setCompte(Compte compte) {
    this.compte = compte;
  }

  public StatutProjet getStatut() {
    return statut;
  }

  public void setStatut(StatutProjet statut) {
    this.statut = statut;
  }

  public void setIdfiscale(String idfiscale) {
    this.idfiscale = idfiscale;
  }

  public String getDemandeurAdresse() {
    return demandeurAdresse;
  }

  public void setDemandeurAdresse(String demandeurAdresse) {
    this.demandeurAdresse = demandeurAdresse;
  }

  public String getDemandeurTel() {
    return demandeurTel;
  }

  public void setDemandeurTel(String demandeurTel) {
    this.demandeurTel = demandeurTel;
  }

  public String getDemandeurFax() {
    return demandeurFax;
  }

  public void setDemandeurFax(String demandeurFax) {
    this.demandeurFax = demandeurFax;
  }

  public String getDemandeurEmail() {
    return demandeurEmail;
  }

  public void setDemandeurEmail(String demandeurEmail) {
    this.demandeurEmail = demandeurEmail;
  }

  public List<Vehicules> getVehicules() {
    return vehicules;
  }

  public void setVehicules(List<Vehicules> vehicules) {
    this.vehicules = vehicules;
  }

  public String getNombre_vehicule() {
    return nombre_vehicule;
  }

  public void setNombre_vehicule(String nombre_vehicule) {
    this.nombre_vehicule = nombre_vehicule;
  }

  public String getNombre_conteneur() {
    return nombre_conteneur;
  }

  public void setNombre_conteneur(String nombre_conteneur) {
    this.nombre_conteneur = nombre_conteneur;
  }

  public Type getType() {
    return type;
  }

  public void setType(Type type) {
    this.type = type;
  }

  public String getTypevehicule() {
    return typevehicule;
  }

  public void setTypevehicule(String typevehicule) {
    this.typevehicule = typevehicule;
  }

  public TypeConteneurs getTypeConteneurs() {
    return typeConteneurs;
  }

  public void setTypeConteneurs(TypeConteneurs typeConteneurs) {
    this.typeConteneurs = typeConteneurs;
  }

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

  public String getTypeDechet() {
    return typeDechet;
  }

  public void setTypeDechet(String typeDechet) {
    this.typeDechet = typeDechet;
  }

  public List<Code> getCode() {
    return code;
  }

  public void setCode(List<Code> code) {
    this.code = code;
  }

  public List<Reunion> getReunions() {
    return reunions;
  }

  public void setReunions(List<Reunion> reunions) {
    this.reunions = reunions;
  }

  public String getTypeCollecte() {
    return typeCollecte;
  }

  public void setTypeCollecte(String typeCollecte) {
    this.typeCollecte = typeCollecte;
  }

  public TypeRenouvellement getTypeRenouvellement() {
    return typeRenouvellement;
  }

  public void setTypeRenouvellement(TypeRenouvellement typeRenouvellement) {
    this.typeRenouvellement = typeRenouvellement;
  }

  public Integer getId_collecteOriginale() {
    return id_collecteOriginale;
  }

  public void setId_collecteOriginale(Integer id_collecteOriginale) {
    this.id_collecteOriginale = id_collecteOriginale;
  }

  public String getUrl_doc_signer() {
    return url_doc_signer;
  }

  public void setUrl_doc_signer(String url_doc_signer) {
    this.url_doc_signer = url_doc_signer;
  }

  public String getUrl_pv_commission() {
    return url_pv_commission;
  }
  public void setUrl_pv_commission(String url_pv_commission) {
    this.url_pv_commission = url_pv_commission;
  }

  public Date getDateAvenant() {
    return dateAvenant;
  }

  public void setDateAvenant(Date dateAvenant) {
    this.dateAvenant = dateAvenant;
  }
}
