package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "typevehicule")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class TypeVehicule implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public TypeVehicule() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_type_vehicule")
	private int id_type_vehicule;

	@Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_fr;

	@Column(name = "nom_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_ar;

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public int getId_type_vehicule() {
		return id_type_vehicule;
	}

	public void setId_type_vehicule(int id_type_vehicule) {
		this.id_type_vehicule = id_type_vehicule;
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
