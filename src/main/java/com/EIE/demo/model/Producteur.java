package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "producteur")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class Producteur implements Serializable {


	public Producteur() {

	}

	@Id
	@GeneratedValue (strategy=GenerationType.IDENTITY)
	@Column (name="id_producteur")
	private int id_producteur;

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

	@Column(name = "lieu_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String lieu_fr;

	@Column(name = "lieu_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String lieu_ar;

	public String getLieu_fr() {
		return lieu_fr;
	}

	public void setLieu_fr(String lieu_fr) {
		this.lieu_fr = lieu_fr;
	}

	public String getLieu_ar() {
		return lieu_ar;
	}

	public void setLieu_ar(String lieu_ar) {
		this.lieu_ar = lieu_ar;
	}

	@Column(name = "contact_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String contact_fr;



	@Column(name = "contact_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String contact_ar;

	@Column(name = "tel", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String tel;
	@Column(name = "fax", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String fax;

	public int getId_producteur() {
		return id_producteur;
	}

	public void setId_producteur(int id_producteur) {
		this.id_producteur = id_producteur;
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






















}
