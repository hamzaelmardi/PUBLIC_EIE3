package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "operation")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class operation implements Serializable {


	public operation() {
		
	}

	@Id
    @GeneratedValue (strategy=GenerationType. IDENTITY)
    @Column (name="id_operation")
    private int id_operation;
	
	public int getId_operation() {
		return id_operation;
	}

	public void setId_operation(int id_operation) {
		this.id_operation = id_operation;
	}

	@Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_fr;

	@Column(name = "type", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String type;

	@Column(name = "code", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String code;
	
	public String getOperation() {
		return code;
	}

	public void setOperation(String code) {
		this.code = code;
	}

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

	public String gettype() {
		return type;
	}

	public void settype(String type) {
		this.type = type;
	}



}
