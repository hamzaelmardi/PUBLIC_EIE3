package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "categorie")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class Categorie implements Serializable {
	
	
	public Categorie() {
		
	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="id_categorie")
    private int id_categorie;
	
	
	@Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_fr;
	
	@Column(name = "nom_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_ar;


	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;

	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "categorie_souscategorie",
			joinColumns = { @JoinColumn(name = "id_cat") },
			inverseJoinColumns = { @JoinColumn(name = "id_souscat") })

	private List<SousCategorie> sousCategories = new ArrayList<SousCategorie>();

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

	public int getId_categorie() {
		return id_categorie;
	}

	public void setId_categorie(int id_categorie) {
		this.id_categorie = id_categorie;
	}

	public List<SousCategorie> getSousCategories() {
		return sousCategories;
	}

	public void setSousCategories(List<SousCategorie> sousCategories) {
		this.sousCategories = sousCategories;
	}
}
