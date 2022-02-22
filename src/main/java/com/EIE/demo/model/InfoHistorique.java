package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "InfoHistorique")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class InfoHistorique implements Serializable {

	public DemandeInformation getDemande() {
		return demande;
	}

	public void setDemande(DemandeInformation demande) {
		this.demande = demande;
	}

	public InfoHistorique() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_historique")
	private int id_historique;

	@Column(name = "etat", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String etat;
	
	@Column(name = "date", nullable = true)
	private Date date;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_demande_info")
	private DemandeInformation demande;
	

	
	public int getId_historique() {
		return id_historique;
	}

	public void setId_historique(int id_historique) {
		this.id_historique = id_historique;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	
	

	

}
