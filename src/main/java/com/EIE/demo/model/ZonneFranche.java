package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "zonnefranche")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class ZonneFranche implements Serializable {
	
	
	public ZonneFranche() {
		
	}

	@Id
    @GeneratedValue (strategy=GenerationType.IDENTITY)
    @Column (name="id_zonnefranche")
    private int id_zonnefranche;
	
	public int getId_zonnefranche() {
		return id_zonnefranche;
	}

	public void setId_zonnefranche(int id_zonnefranche) {
		this.id_zonnefranche = id_zonnefranche;
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
	
	@Column(name = "code", nullable = true)
	private String code;
	
	
	

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	
	
	

	

	

	
	

	

	
	

	
	
	
	

}
