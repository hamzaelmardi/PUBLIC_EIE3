package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "importHistorique")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class importHistorique implements Serializable {

	public importHistorique() {

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
	@JoinColumn(name = "id_notification")
	private Notification notif;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_installation")
	private Installation install;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_collecte")
	private CollecteTransporteur collecteTransporteur;

	public Installation getInstall() {
		return install;
	}

	public void setInstall(Installation install) {
		this.install = install;
	}

	public CollecteTransporteur getCollecteTransporteur() {
		return collecteTransporteur;
	}

	public void setCollecteTransporteur(CollecteTransporteur collecteTransporteur) {
		this.collecteTransporteur = collecteTransporteur;
	}

	public Notification getNotif() {
		return notif;
	}

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

	public void setNotif(Notification notif) {
		this.notif = notif;
	}

	

	

}
