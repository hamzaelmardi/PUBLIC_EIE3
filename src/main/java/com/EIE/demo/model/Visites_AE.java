package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "Visites_AE")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class Visites_AE implements Serializable {


	public Visites_AE() {
		
	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="id_visite_AE")
    private int id_visite_AE;

	
	@Column(name = "visite_site", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String visite_site;

	@Column(name = "visite_objet", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String visite_objet;

	@Column(name = "visite_date", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String visite_date;

	@Column(name = "visite_url", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String visite_url;


	@Column(name = "date_visite", nullable = true)
	private Date date_visite;

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;

	public int getId_visite_AE() {
		return id_visite_AE;
	}
	public void setId_visite_AE(int id_visite_AE) {
		this.id_visite_AE = id_visite_AE;
	}
	public String getVisite_site() {
		return visite_site;
	}
	public void setVisite_site(String visite_site) {
		this.visite_site = visite_site;
	}
	public String getVisite_objet() {
		return visite_objet;
	}
	public void setVisite_objet(String visite_objet) {
		this.visite_objet = visite_objet;
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
	public Date getDate_visite() {
		return date_visite;
	}
	public void setDate_visite(Date date_visite) {
		this.date_visite = date_visite;
	}
	public Date getDeleteDateTime() {
		return deleteDateTime;
	}
	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

}
