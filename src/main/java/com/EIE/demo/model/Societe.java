package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "societe")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class Societe implements Serializable {
	
	
	

	

	

	public Profil getProfil() {
		return profil;
	}

	public void setProfil(Profil profil) {
		this.profil = profil;
	}

	

	public Societe() {
		
	}

	@Id
    @GeneratedValue (strategy=GenerationType.IDENTITY)
    @Column (name="societesId")
    private int societesId;
	
	public int getSocietesId() {
		return societesId;
	}

	public void setSocietesId(int societesId) {
		this.societesId = societesId;
	}

	@Column(name = "NumRc", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String NumRc;
	
	@Column(name = "raison_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String raison_ar;
	
	@Column(name = "raison_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String raison_fr;
	
	@Column(name = "name_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String name_fr;
	
	@Column(name = "name_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String name_ar;
	@Column(name = "ZF", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String ZF;
	@Column(name = "environnement", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String environnement;
	@Column(name = "autorisation", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String autorisation;

	public String getEnvironnement() {
		return environnement;
	}

	public void setEnvironnement(String environnement) {
		this.environnement = environnement;
	}

	public String getAutorisation() {
		return autorisation;
	}

	public void setAutorisation(String autorisation) {
		this.autorisation = autorisation;
	}

	public String getZF() {
		return ZF;
	}

	public void setZF(String zF) {
		ZF = zF;
	}

	public String getET() {
		return ET;
	}

	public void setET(String eT) {
		ET = eT;
	}

	public String getTR() {
		return TR;
	}

	public void setTR(String tR) {
		TR = tR;
	}

	public String getXD() {
		return XD;
	}

	public void setXD(String xD) {
		XD = xD;
	}

	public String getIT() {
		return IT;
	}

	public void setIT(String iT) {
		IT = iT;
	}

	public String getCT() {
		return CT;
	}

	public void setCT(String cT) {
		CT = cT;
	}

	public String getEIE() {
		return EIE;
	}

	public void setEIE(String eIE) {
		EIE = eIE;
	}

	public String getEA() {
		return EA;
	}

	public void setEA(String eA) {
		EA = eA;
	}

	@Column(name = "ET", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String ET;
	@Column(name = "TR", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String TR;
	@Column(name = "XD", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String XD;
	@Column(name = "IT", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String IT;
	@Column(name = "CT", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String CT;
	@Column(name = "EIE", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String EIE;
	@Column(name = "EA", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String EA;
	@Column(name = "NT", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String NT;
	
	public String getNT() {
		return NT;
	}

	public void setNT(String nT) {
		NT = nT;
	}

	@Column(name = "tel", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String tel;
	@Column(name = "etat", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String etat;
	@Column(name = "type", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String type;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

	@Column(name = "password", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String password;
	public String getName_fr() {
		return name_fr;
	}

	public void setName_fr(String name_fr) {
		this.name_fr = name_fr;
	}

	public String getName_ar() {
		return name_ar;
	}

	public void setName_ar(String name_ar) {
		this.name_ar = name_ar;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "email", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String email;
	@Column(name = "captcha", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String captcha;
	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	@Column(name = "fax", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String fax;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idsecteur")
	private Secteur secteur;
	
	
	public String getNumRc() {
		return NumRc;
	}

	public void setNumRc(String numRc) {
		NumRc = numRc;
	}

	public String getRaison_ar() {
		return raison_ar;
	}

	public void setRaison_ar(String raison_ar) {
		this.raison_ar = raison_ar;
	}

	public String getRaison_fr() {
		return raison_fr;
	}

	public void setRaison_fr(String raison_fr) {
		this.raison_fr = raison_fr;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public Secteur getSecteur() {
		return secteur;
	}

	public void setSecteur(Secteur secteur) {
		this.secteur = secteur;
	}

	public String getAdresse_ar() {
		return adresse_ar;
	}

	public void setAdresse_ar(String adresse_ar) {
		this.adresse_ar = adresse_ar;
	}

	public String getAdresse_fr() {
		return adresse_fr;
	}

	public void setAdresse_fr(String adresse_fr) {
		this.adresse_fr = adresse_fr;
	}

	public String getUrlCertificat() {
		return urlCertificat;
	}

	public void setUrlCertificat(String urlCertificat) {
		this.urlCertificat = urlCertificat;
	}

	public String getUrlRegistre() {
		return urlRegistre;
	}

	public void setUrlRegistre(String urlRegistre) {
		this.urlRegistre = urlRegistre;
	}

	@Column(name = "adresse_ar", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String adresse_ar;
	@Column(name = "adresse_fr", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String adresse_fr;
	@Column(name = "deleted", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String deleted;
	@Column(name = "urlCertificat", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String urlCertificat;
	
	@Column(name = "urlRegistre", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String urlRegistre;
	
	
	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "profilId")
	private Profil profil;
	
	
	

	

	
	
	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	@Column
	private Date deleteDateTime;
	
	

	

	

	

	
	

	

	
	

	
	
	
	

}
