package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "code")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class Code implements Serializable {
	
	
	public Code() {
		
	}

	@Id
    @GeneratedValue (strategy=GenerationType. IDENTITY)
    @Column (name="id_code")
    private int id_code;
	
	public int getId_code() {
		return id_code;
	}

	public void setId_code(int id_code) {
		this.id_code = id_code;
	}

	@Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_fr;
	
	@Column(name = "operation", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String operation;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idCodeparent")
	private Codeparentt codeparentt;
	
	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	@Column(name = "nom_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_ar;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idClassification")
	private Classification classification;
	
	public Classification getClassification() {
		return classification;
	}

	public void setClassification(Classification classification) {
		this.classification = classification;
	}

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
	
	public Codeparentt getCodeparentt() {
		return codeparentt;
	}

	public void setCodeparentt(Codeparentt codeparentt) {
		this.codeparentt = codeparentt;
	}

	
	
	

	

	

	
	

	

	
	

	
	
	
	

}
