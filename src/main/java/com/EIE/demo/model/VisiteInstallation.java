package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "visite_installation")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class VisiteInstallation implements Serializable {
	
	
	public VisiteInstallation() {
		
	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="id_visite_installation")
    private int id_visite_installation;
	
	
	@Column(name = "nomsite_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nomsite_fr;
	
	@Column(name = "nomsite_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nomsite_ar;

	@Column(name = "raison", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String raison;

	
	@Column(name = "object", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String object;

	@Column(name = "date_visite_S", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String date_visite_S;

	public int getId_visite_installation() {
		return id_visite_installation;
	}

	

	public void setId_visite_installation(int id_visite_installation) {
		this.id_visite_installation = id_visite_installation;
	}

	public String getNomsite_fr() {
		return nomsite_fr;
	}

	public void setNomsite_fr(String nomsite_fr) {
		this.nomsite_fr = nomsite_fr;
	}

	public String getNomsite_ar() {
		return nomsite_ar;
	}

	public void setNomsite_ar(String nomsite_ar) {
		this.nomsite_ar = nomsite_ar;
	}

	public String getObject() {
		return object;
	}

	public void setObject(String object) {
		this.object = object;
	}

	
	public Date getDate_visite() {
		return date_visite;
	}

	public void setDate_visite(Date date_visite) {
		this.date_visite = date_visite;
	}

	public Date getDate_transmission() {
		return date_transmission;
	}

	public void setDate_transmission(Date date_transmission) {
		this.date_transmission = date_transmission;
	}

	@Column(name = "date_visite", nullable = true)
	private Date date_visite;


	@Column(name = "date_transmission", nullable = true)
	private Date date_transmission;


	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;
	
	
	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}


	public String getRaison() {
		return raison;
	}

	public void setRaison(String raison) {
		this.raison = raison;
	}

	public String getDate_visite_S() {
		return date_visite_S;
	}
	public void setDate_visite_S(String date_visite_S) {
		this.date_visite_S = date_visite_S;
	}

}
