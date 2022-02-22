package com.EIE.demo.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "classification")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
@JsonAutoDetect
public class Classification implements Serializable {

	private static final long serialVersionUID = 1L;

	public Classification() {
		
	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="id_classification")
    private int id_classification;
	
	public int getId_classification() {
		return id_classification;
	}

	public void setId_classification(int id_classification) {
		this.id_classification = id_classification;
	}

	@Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_fr;
	
	@Column(name = "nom_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_ar;
	
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


	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
}
