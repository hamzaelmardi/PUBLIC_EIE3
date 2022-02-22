package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "typeRenouvellement")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class TypeRenouvellement implements Serializable {


	public TypeRenouvellement() {
		
	}

	@Id
    @GeneratedValue (strategy=GenerationType.IDENTITY)
    @Column (name="id_type_renouvellement")
    private int id_type_renouvellement;

	@Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_fr;
	
	@Column(name = "nom_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_ar;

	@Column(name = "code_name", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String code_name;


	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;

	public int getId_type_renouvellement() {
		return id_type_renouvellement;
	}

	public void setId_type_renouvellement(int id_type_renouvellement) {
		this.id_type_renouvellement = id_type_renouvellement;
	}

	public String getNom_ar() {
		return nom_ar;
	}

	public void setNom_ar(String nom_ar) {
		this.nom_ar = nom_ar;
	}

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

	public String getCode_name() {
		return code_name;
	}

	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
}
