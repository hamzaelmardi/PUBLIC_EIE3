package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "eiedre")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class EieDre implements Serializable {
	
	
	public EieDre() {
		
	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="id_eiedre")
    private int id_eiedre;
	
	

	@Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_fr;
	

	@Column(name = "decision", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String decision;
	@Column(name = "date", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String date;
	@Column(name = "petitionaire", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String petitionaire;
	
	@Column(name = "objet", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String objet;
	
	@Column(name = "montant", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String montant;
	@Column(name = "consistance", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String consistance;
	
	public String getMontant() {
		return montant;
	}

	public void setMontant(String montant) {
		this.montant = montant;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_region")
	private Region region;

	public String getConsistance() {
		return consistance;
	}

	public void setConsistance(String consistance) {
		this.consistance = consistance;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_prefecture")
	private Prefecture province;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_commune")
	private Commune commune;

	public Prefecture getProvince() {
		return province;
	}

	public void setProvince(Prefecture province) {
		this.province = province;
	}

	public Commune getCommune() {
		return commune;
	}

	public void setCommune(Commune commune) {
		this.commune = commune;
	}


	public int getId_eiedre() {
		return id_eiedre;
	}

	public void setId_eiedre(int id_eiedre) {
		this.id_eiedre = id_eiedre;
	}

	public String getDecision() {
		return decision;
	}

	public void setDecision(String decision) {
		this.decision = decision;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPetitionaire() {
		return petitionaire;
	}

	public void setPetitionaire(String petitionaire) {
		this.petitionaire = petitionaire;
	}

	public String getObjet() {
		return objet;
	}

	public void setObjet(String objet) {
		this.objet = objet;
	}

	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
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

	
	
	

	

	

	
	

	

	
	

	
	
	
	

}
