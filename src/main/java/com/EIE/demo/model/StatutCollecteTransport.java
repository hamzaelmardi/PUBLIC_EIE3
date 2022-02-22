package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "statut_collecte_transport")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class StatutCollecteTransport implements Serializable {


	public StatutCollecteTransport() {
		
	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="id_statut_Collecte")
    private int id_statut_Collecte;
	
	
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
	
	
	public int getId_statut_installation() {
		return id_statut_Collecte;
	}

	public void setId_statut_installation(int id_statut_installation) {
		this.id_statut_Collecte = id_statut_installation;
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
