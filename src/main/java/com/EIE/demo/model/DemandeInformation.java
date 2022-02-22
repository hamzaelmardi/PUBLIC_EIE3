package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "demande_infromation")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
@JsonAutoDetect
public class DemandeInformation implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    public DemandeInformation() {

    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_demande_information")
    private int id_demande_information;

    @ManyToMany(fetch = FetchType.LAZY)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name = "region_demande", joinColumns = {
            @JoinColumn(name = "id_demande_information") }, inverseJoinColumns = { @JoinColumn(name = "id_region") })

    private List<Region> regions = new ArrayList<Region>();

    @ManyToMany(fetch = FetchType.LAZY)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name = "demande_docs", joinColumns = {
            @JoinColumn(name = "id_demande_information") }, inverseJoinColumns = { @JoinColumn(name = "id_region") })
    private List<ListDocReunion> listDocReunions = new ArrayList<ListDocReunion>();


    @ManyToMany(fetch = FetchType.LAZY)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name = "demande_reunion", joinColumns = {
            @JoinColumn(name = "id_demande_information") }, inverseJoinColumns = { @JoinColumn(name = "id_reunion") })
    private List<Reunion> reunions = new ArrayList<Reunion>();


    @ManyToMany(fetch = FetchType.LAZY)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name = "region_docs", joinColumns = {
            @JoinColumn(name = "id_demande_information") }, inverseJoinColumns = { @JoinColumn(name = "id_region_doc") })

    private List<RegionDoc> regiondoc = new ArrayList<RegionDoc>();


    public List<RegionDoc> getRegiondoc() {
        return regiondoc;
    }

    public void setRegiondoc(List<RegionDoc> regiondoc) {
        this.regiondoc = regiondoc;
    }

    @ManyToMany(fetch = FetchType.LAZY)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name = "categoires_demande", joinColumns = {
            @JoinColumn(name = "id_demande_information") }, inverseJoinColumns = { @JoinColumn(name = "id_categorie") })

    private List<Categorie> categories = new ArrayList<Categorie>();

    @ManyToMany(fetch = FetchType.LAZY)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name = "souscategoires_demande", joinColumns = {
            @JoinColumn(name = "id_demande_informations") }, inverseJoinColumns = { @JoinColumn(name = "id_sous_categorie") })

    private List<SousCategorie> sousCategories = new ArrayList<SousCategorie>();

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_detail")
    private DetailRegion detailRegion;

    @Column(name = "tronsfrontalier", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String tronsfrontalier;
    @Column(name = "raison_social", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String raison_social;
    @Column(name = "represantant", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String represantant;
    @Column(name = "email", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String email;
    @Column(name = "tel", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String tel;
    @Column(name = "fax", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String fax;
    @Column(name = "effectif", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String effectif;
    @Column(name = "consultationPublic", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String consultationPublic;
    @Column(name = "interregion", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String interregion;
    @Column(name = "typeEnv", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String typeEnv;

    @Column(name = "niveauExamen", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String niveauExamen;

    @Column(name = "Montant_investissement")
    private Double Montant_investissement=0.00;

    //***************************Notice********************************//
    @Column(name = "Date_reception", nullable = true)
    private Date Date_reception;

    @Column(name = "Nature_foncier", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String Nature_foncier;

    @Column(name = "caracteristiques_projet", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String caracteristiques_projet;

    @Column(name = "ressource", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String ressource;

    @Column(name = "source", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String source;

    @Column(name = "estimation_projet", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String estimation_projet;

    @Column(name = "nature_projet", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String nature_projet;

    @Column(name = "consistance_proj", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String consistance_proj;

    @Column(name = "quantite_projet", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String quantite_projet;

    @Column(name = "impacts", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String impacts;

    @Column(name = "qualitative", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String qualitative;

    @Column(name = "caracter_physique", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String caracter_physique;

    @Column(name = "url_registre", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_registre;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "uniteId")
    private Unite unite;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idcaracteristquePhysique")
    private CaracteristquePhysique caracteristquePhysique;

    public CaracteristquePhysique getCaracteristquePhysique() {
        return caracteristquePhysique;
    }

    public void setCaracteristquePhysique(CaracteristquePhysique caracteristquePhysique) {
        this.caracteristquePhysique = caracteristquePhysique;
    }



    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Column(name = "type", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String type;

    public Date getDate_reception() {
        return Date_reception;
    }

    public void setDate_reception(Date date_reception) {
        Date_reception = date_reception;
    }

    public String getNature_foncier() {
        return Nature_foncier;
    }

    public void setNature_foncier(String nature_foncier) {
        Nature_foncier = nature_foncier;
    }

    public String getCaracteristiques_projet() {
        return caracteristiques_projet;
    }

    public void setCaracteristiques_projet(String caracteristiques_projet) {
        this.caracteristiques_projet = caracteristiques_projet;
    }

    public String getRessource() {
        return ressource;
    }

    public void setRessource(String ressource) {
        this.ressource = ressource;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getEstimation_projet() {
        return estimation_projet;
    }

    public void setEstimation_projet(String estimation_projet) {
        this.estimation_projet = estimation_projet;
    }

    public String getNature_projet() {
        return nature_projet;
    }

    public void setNature_projet(String nature_projet) {
        this.nature_projet = nature_projet;
    }

    public String getQuantite_projet() {
        return quantite_projet;
    }

    public void setQuantite_projet(String quantite_projet) {
        this.quantite_projet = quantite_projet;
    }

    public String getImpacts() {
        return impacts;
    }

    public void setImpacts(String impacts) {
        this.impacts = impacts;
    }


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_population")
    private Population population;

    public Population getPopulation() {
        return population;
    }

    public void setPopulation(Population population) {
        this.population = population;
    }
    //***********************************************************//

    public String getTypeEnv() {
        return typeEnv;
    }

    public void setTypeEnv(String typeEnv) {
        this.typeEnv = typeEnv;
    }

    public String getFax() {
        return fax;
    }

    public String getNbr_emploi() {
        return nbr_emploi;
    }

    public void setNbr_emploi(String nbr_emploi) {
        this.nbr_emploi = nbr_emploi;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    @Column(name = "url_cachier", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_cachier;
    @Column(name = "url_cachier_defenitive", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_cachier_defenitive;

    @Column(name = "url_enquette_defenitive", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_enquette_defenitive;

    public String getUrl_cachier_defenitive() {
        return url_cachier_defenitive;
    }

    public void setUrl_cachier_defenitive(String url_cachier_defenitive) {
        this.url_cachier_defenitive = url_cachier_defenitive;
    }

    public String getUrl_enquette_defenitive() {
        return url_enquette_defenitive;
    }

    public void setUrl_enquette_defenitive(String url_enquette_defenitive) {
        this.url_enquette_defenitive = url_enquette_defenitive;
    }

    @Column(name = "url_enquette", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_enquette;
    @Column(name = "url_pv", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_pv;
    @Column(name = "url_presence", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_presence;
    @Column(name = "commentaire", nullable = true, columnDefinition = "NVARCHAR(MAX)")
    private String commentaire;

    @Column(name = "commentaireAvis", nullable = true, columnDefinition = "NVARCHAR(MAX)")
    private String commentaire_avis;

    @Column(name = "Statut_RC", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String Statut_RC;

    @Column(name = "Date_RC", nullable = true)
    private Date Date_RC;
    @Column(name = "url_decision", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_decision;

    @Column(name = "Date_DC", nullable = true)
    private Date Date_DC;

    public String getUrl_decision() {
        return url_decision;
    }

    public void setUrl_decision(String url_decision) {
        this.url_decision = url_decision;
    }

    public Date getDate_DC() {
        return Date_DC;
    }

    public void setDate_DC(Date date_DC) {
        Date_DC = date_DC;
    }





    public String getStatut_RC() {
        return Statut_RC;
    }

    public void setStatut_RC(String statut_RC) {
        Statut_RC = statut_RC;
    }

    public Date getDate_RC() {
        return Date_RC;
    }

    public void setDate_RC(Date date_RC) {
        Date_RC = date_RC;
    }

    public String getUrl_pv() {
        return url_pv;
    }

    public void setUrl_pv(String url_pv) {
        this.url_pv = url_pv;
    }

    public String getUrl_presence() {
        return url_presence;
    }

    public void setUrl_presence(String url_presence) {
        this.url_presence = url_presence;
    }

    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }

    public String getCommentaire_avis() {
        return commentaire_avis;
    }

    public void setCommentaire_avis(String commentaire_avis) {
        this.commentaire_avis = commentaire_avis;
    }

    @Column(name = "url_etude", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_etude;



    @Column(name = "url_document_signee", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_document_signee;

    public String getRaison_social() {
        return raison_social;
    }

    public void setRaison_social(String raison_social) {
        this.raison_social = raison_social;
    }

    public String getRepresantant() {
        return represantant;
    }

    public void setRepresantant(String represantant) {
        this.represantant = represantant;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEffectif() {
        return effectif;
    }

    public void setEffectif(String effectif) {
        this.effectif = effectif;
    }

    public String getUrl_cachier() {
        return url_cachier;
    }

    public void setUrl_cachier(String url_cachier) {
        this.url_cachier = url_cachier;
    }

    public String getUrl_enquette() {
        return url_enquette;
    }

    public void setUrl_enquette(String url_enquette) {
        this.url_enquette = url_enquette;
    }

    public String getUrl_etude() {
        return url_etude;
    }

    public void setUrl_etude(String url_etude) {
        this.url_etude = url_etude;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    @Column(name = "contact", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String contact;

    @Column(name = "petitionaire", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String petitionaire;

    @Column(name = "dateDepot", nullable = true)
    private Date dateDepot;
    @Column(name = "dateValidation", nullable = true)
    private Date dateValidation;
    @Column(name = "dateFinValidation", nullable = true)
    private Date dateFinValidation;

    @Column(name = "dateDebutUtilisation", nullable = true)
    private Date dateDebutUtilisation;
    @Column(name = "dateFinUtilisation", nullable = true)
    private Date dateFinUtilisation;

    public Date getDateValidation() {
        return dateValidation;
    }



    public void setDateValidation(Date dateValidation) {
        this.dateValidation = dateValidation;
    }

    public int getId_demande_information() {
        return id_demande_information;
    }

    public void setId_demande_information(int id_demande_information) {
        this.id_demande_information = id_demande_information;
    }

    public String getConsultationPublic() {
        return consultationPublic;
    }

    public void setConsultationPublic(String consultationPublic) {
        this.consultationPublic = consultationPublic;
    }

    public List<Region> getRegions() {
        return regions;
    }

    public void setRegions(List<Region> regions) {
        this.regions = regions;
    }

    public String getTronsfrontalier() {
        return tronsfrontalier;
    }

    public void setTronsfrontalier(String tronsfrontalier) {
        this.tronsfrontalier = tronsfrontalier;
    }

    public String getPetitionaire() {
        return petitionaire;
    }

    public void setPetitionaire(String petitionaire) {
        this.petitionaire = petitionaire;
    }

    public String getInformation_projet() {
        return information_projet;
    }

    public void setInformation_projet(String information_projet) {
        this.information_projet = information_projet;
    }

    public String getIntitule_projet() {
        return intitule_projet;
    }

    public void setIntitule_projet(String intitule_projet) {
        this.intitule_projet = intitule_projet;
    }

    public String getUrl_avis() {
        return url_avis;
    }

    public void setUrl_avis(String url_avis) {
        this.url_avis = url_avis;
    }



    public StatutProjet getStatut() {
        return statut;
    }

    public void setStatut(StatutProjet statut) {
        this.statut = statut;
    }


    public String getNum_demande() {
        return num_demande;
    }

    public void setNum_demande(String num_demande) {
        this.num_demande = num_demande;
    }


    public Date getDeleteDateTime() {
        return deleteDateTime;
    }

    public void setDeleteDateTime(Date deleteDateTime) {
        this.deleteDateTime = deleteDateTime;
    }

    @Column(name = "information_projet", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String information_projet;

    @Column(name = "intitule_projet", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String intitule_projet;

    @Column(name = "url_avis", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_avis;
    @Column(name = "adresse", nullable = true, columnDefinition = "NVARCHAR(MAX)")
    private String adresse;

    @Column(name = "visite_object", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String visite_object;
    @Column(name = "visite_adresse", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String visite_adresse;
    @Column(name = "visite_date", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String visite_date;
    @Column(name = "visite_url", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String visite_url;



    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_compte")
    private Compte compte;

    public Date getDateDepot() {
        return dateDepot;
    }

    public void setDateDepot(Date dateDepot) {
        this.dateDepot = dateDepot;
    }

    public Compte getCompte() {
        return compte;
    }

    public void setCompte(Compte compte) {
        this.compte = compte;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_statut")
    private StatutProjet statut;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_statut_installation")
    private StatutInstalation statut_installation;

    @Column(name = "num_demande", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String num_demande;

    @Column(name = "nbr_emploi", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String nbr_emploi;


    @Column(name = "deleteDateTime", nullable = true)
    private Date deleteDateTime;


    @Column(name = "dateDemarage", nullable = true)
    private String dateDemarage;

    @Column(name = "dateResiliation", nullable = true)
    private String dateResiliation;


    public String getDateDemarage() {
        return dateDemarage;
    }

    public void setDateDemarage(String dateDemarage) {
        this.dateDemarage = dateDemarage;
    }

    public String getDateResiliation() {
        return dateResiliation;
    }

    public void setDateResiliation(String dateResiliation) {
        this.dateResiliation = dateResiliation;
    }





    public StatutInstalation getStatut_installation() {
        return statut_installation;
    }

    public void setStatut_installation(StatutInstalation statut_installation) {
        this.statut_installation = statut_installation;
    }

    public List<Categorie> getCategories() {
        return categories;
    }

    public void setCategories(List<Categorie> categories) {
        this.categories = categories;
    }

    public String getUrl_document_signee() {
        return url_document_signee;
    }

    public void setUrl_document_signee(String url_document_signee) {
        this.url_document_signee = url_document_signee;
    }

    public Double getMontant_investissement() {
        return Montant_investissement;
    }

    public void setMontant_investissement(Double montant_investissement) {
        Montant_investissement = montant_investissement;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public DetailRegion getDetailRegion() {
        return detailRegion;
    }

    public void setDetailRegion(DetailRegion detailRegion) {
        this.detailRegion = detailRegion;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public List<Reunion> getReunions() {
        return reunions;
    }

    public void setReunions(List<Reunion> reunions) {
        this.reunions = reunions;
    }

    public List<ListDocReunion> getListDocReunions() {
        return listDocReunions;
    }

    public String getQualitative() {
        return qualitative;
    }

    public void setQualitative(String qualitative) {
        this.qualitative = qualitative;
    }

    public String getCaracter_physique() {
        return caracter_physique;
    }

    public void setCaracter_physique(String caracter_physique) {
        this.caracter_physique = caracter_physique;
    }

    public Unite getUnite() {
        return unite;
    }

    public void setUnite(Unite unite) {
        this.unite = unite;
    }

    public void setListDocReunions(List<ListDocReunion> listDocReunions) {
        this.listDocReunions = listDocReunions;
    }

    public Date getDateFinValidation() {
        return dateFinValidation;
    }
    public void setDateFinValidation(Date dateFinValidation) {
        this.dateFinValidation = dateFinValidation;
    }

    public Date getDateDebutUtilisation() {
        return dateDebutUtilisation;
    }
    public void setDateDebutUtilisation(Date dateDebutUtilisation) {
        this.dateDebutUtilisation = dateDebutUtilisation;
    }
    public Date getDateFinUtilisation() {
        return dateFinUtilisation;
    }
    public void setDateFinUtilisation(Date dateFinUtilisation) {
        this.dateFinUtilisation = dateFinUtilisation;
    }

    public String getVisite_object() {
        return visite_object;
    }
    public void setVisite_object(String visite_object) {
        this.visite_object = visite_object;
    }
    public String getVisite_adresse() {
        return visite_adresse;
    }
    public void setVisite_adresse(String visite_adresse) {
        this.visite_adresse = visite_adresse;
    }
    public String getVisite_date() {
        return visite_date;
    }
    public void setVisite_date(String visite_date) {
        this.visite_date = visite_date;
    }

    public String getVisite_url() {
        return visite_url;
    }
    public void setVisite_url(String visite_url) {
        this.visite_url = visite_url;
    }

    public String getConsistance_proj() {
        return consistance_proj;
    }
    public void setConsistance_proj(String consistance_proj) {
        this.consistance_proj = consistance_proj;
    }

    //***************************Audit demande********************************//
    @Column(name = "url_file_AE", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_file_AE;

    @Column(name = "commentaire_url_file_AE", nullable = true, columnDefinition = "NVARCHAR(MAX)")
    private String commentaire_url_file_AE;

    @Column(name = "date_debut_AE", nullable = true, columnDefinition = "nText")
    private String date_debut_AE;

    @Column(name = "date_fin_AE", nullable = true, columnDefinition = "nText")
    private String date_fin_AE;

    @ManyToMany(fetch = FetchType.LAZY)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name = "AE_documents", joinColumns = {
            @JoinColumn(name = "id_demande_information") }, inverseJoinColumns = { @JoinColumn(name = "id_documents_ae") })
    private List<DocumentsAE> documents_AE = new ArrayList<DocumentsAE>();


    @ManyToMany(fetch = FetchType.LAZY)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name = "AE_Repport", joinColumns = {
            @JoinColumn(name = "id_demande_information") }, inverseJoinColumns = { @JoinColumn(name = "id_rapports_ae") })
    private List<RapportsAE> rapports_AE = new ArrayList<RapportsAE>();

    @ManyToMany(fetch = FetchType.LAZY)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name = "AE_visites", joinColumns = {
            @JoinColumn(name = "id_demande_information") }, inverseJoinColumns = { @JoinColumn(name = "id_visite_AE") })
    private List<Visites_AE> visites = new ArrayList<Visites_AE>();

    public String getUrl_file_AE() {
        return url_file_AE;
    }
    public void setUrl_file_AE(String url_file_AE) {
        this.url_file_AE = url_file_AE;
    }

    public String getCommentaire_url_file_AE() {
        return commentaire_url_file_AE;
    }
    public void setCommentaire_url_file_AE(String commentaire_url_file_AE) {
        this.commentaire_url_file_AE = commentaire_url_file_AE;
    }
    public String getDate_debut_AE() {
        return date_debut_AE;
    }
    public void setDate_debut_AE(String date_debut_AE) {
        this.date_debut_AE = date_debut_AE;
    }
    public String getDate_fin_AE() {
        return date_fin_AE;
    }
    public void setDate_fin_AE(String date_fin_AE) {
        this.date_fin_AE = date_fin_AE;
    }
    public List<RapportsAE> getRapports_AE() {
        return rapports_AE;
    }
    public void setRapports_AE(List<RapportsAE> rapports_AE) {
        this.rapports_AE = rapports_AE;
    }
    public List<DocumentsAE> getDocuments_AE() {
        return documents_AE;
    }
    public void setDocuments_AE(List<DocumentsAE> documents_AE) {
        this.documents_AE = documents_AE;
    }
    public List<Visites_AE> getVisites() {
        return visites;
    }
    public void setVisites(List<Visites_AE> visites) {
        this.visites = visites;
    }
    //***************************End Audit demande********************************//

    public String getInterregion() {
        return interregion;
    }

    public void setInterregion(String interregion) {
        this.interregion = interregion;
    }

    public List<SousCategorie> getSousCategories() {
        return sousCategories;
    }

    public void setSousCategories(List<SousCategorie> sousCategories) {
        this.sousCategories = sousCategories;
    }

    public String getUrl_registre() {
        return url_registre;
    }

    public void setUrl_registre(String url_registre) {
        this.url_registre = url_registre;
    }

    public String getNiveauExamen() {
        return niveauExamen;
    }

    public void setNiveauExamen(String niveauExamen) {
        this.niveauExamen = niveauExamen;
    }
}
