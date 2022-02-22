package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "importateurnotifiant")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class ImportateurNotifiant implements Serializable {
	
	
	public ImportateurNotifiant() {
		
	}

	@Id
    @GeneratedValue (strategy=GenerationType.IDENTITY)
    @Column (name="id_ImportateurNotifiant")
    private int id_ImportateurNotifiant;
	
	@Column(name = "idf", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String idf;

	public String getIdf() {
		return idf;
	}

	public void setIdf(String idf) {
		this.idf = idf;
	}

	@Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_fr;
	
	@Column(name = "nom_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_ar;
	
	@Column(name = "adresse_fr", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String adresse_fr;
	
	@Column(name = "adresse_ar", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String adresse_ar;
	
	@Column(name = "contact_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String contact_fr;
	
	@Column(name = "contact_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String contact_ar;


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
	

	@Column(name = "tel", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String tel;
	
	@Column(name = "notification_id", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String notification_id;
	
	public String getNotification_id() {
		return notification_id;
	}

	public void setNotification_id(String notification_id) {
		this.notification_id = notification_id;
	}

	@Column(name = "fax", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String fax;

	@Column(name = "genre", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String genre;
	@Column(name = "qualite", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String qualite;
	
	public int getId_ImportateurNotifiant() {
		return id_ImportateurNotifiant;
	}

	public void setId_ImportateurNotifiant(int id_ImportateurNotifiant) {
		this.id_ImportateurNotifiant = id_ImportateurNotifiant;
	}

	public String getAdresse_fr() {
		return adresse_fr;
	}

	public void setAdresse_fr(String adresse_fr) {
		this.adresse_fr = adresse_fr;
	}

	public String getAdresse_ar() {
		return adresse_ar;
	}

	public void setAdresse_ar(String adresse_ar) {
		this.adresse_ar = adresse_ar;
	}

	public String getContact_fr() {
		return contact_fr;
	}

	public void setContact_fr(String contact_fr) {
		this.contact_fr = contact_fr;
	}

	public String getContact_ar() {
		return contact_ar;
	}

	public void setContact_ar(String contact_ar) {
		this.contact_ar = contact_ar;
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

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	@Column(name = "mail", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String mail;
	
	public String getNom_ar() {
		return nom_ar;
	}

	public void setNom_ar(String nom_ar) {
		this.nom_ar = nom_ar;
	}

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;
	
	
	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	
	

	public String getNom_fr() {
		return nom_fr;
	}

	public void setNom_fr(String nom_fr) {
		this.nom_fr = nom_fr;
	}


	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getQualite() {
		return qualite;
	}

	public void setQualite(String qualite) {
		this.qualite = qualite;
	}
}
