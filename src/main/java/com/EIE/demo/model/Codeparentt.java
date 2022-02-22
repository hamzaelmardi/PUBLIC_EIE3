package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "codeparent")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class Codeparentt implements Serializable {

	@Id
    @GeneratedValue (strategy=GenerationType. IDENTITY)
    @Column (name="id_codeparentt")
    private int id_codeparentt;
	
	@Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String nom_fr;
	
	@Column(name = "nom_ar", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String nom_ar;
	
	@Column(name = "numeroCode", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String numeroCode;
	
	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;
	
	
	
public Codeparentt() {
		
	}

public int getId_codeparentt() {
	return id_codeparentt;
}

public void setId_codeparentt(int id_codeparentt) {
	this.id_codeparentt = id_codeparentt;
}

public String getNom_fr() {
	return nom_fr;
}

public void setNom_fr(String nom_fr) {
	this.nom_fr = nom_fr;
}

public String getNom_ar() {
	return nom_ar;
}

public void setNom_ar(String nom_ar) {
	this.nom_ar = nom_ar;
}

public String getNumeroCode() {
	return numeroCode;
}

public void setNumeroCode(String numeroCode) {
	this.numeroCode = numeroCode;
}

public Date getDeleteDateTime() {
	return deleteDateTime;
}

public void setDeleteDateTime(Date deleteDateTime) {
	this.deleteDateTime = deleteDateTime;
}


	
	
	
	
	

	

	

	
	

	

	
	

	
	
	
	

}
