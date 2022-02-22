package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "equipementSecurite")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class EquipementSecurite implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public EquipementSecurite() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_equipement")
	private int id_equipement;

	@Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_fr;

	@Column(name = "nom_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_ar;

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public int getId_equipement() {
		return id_equipement;
	}

	public void setId_equipement(int id_equipement) {
		this.id_equipement = id_equipement;
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

	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}
}
