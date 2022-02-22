package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
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
@Table(name = "Affectation")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
@JsonAutoDetect
public class Affectation implements Serializable {

	public Affectation() {
		
	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="affectationId")
    private int affectationId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "notification")
	private Notification notification;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "collecte")
	private CollecteTransporteur collecte;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "installation")
	private Installation installation;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "demandeInformation")
	private DemandeInformation demandeInformation;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "compte")
	private Compte compte;

	@Column(name = "dateAffectation", nullable = true)
	private Date dateAffectation;

	@Column(name = "etat", nullable = true)
	private String etat;

	public int getAffectationId() {
		return affectationId;
	}

	public void setAffectationId(int affectationId) {
		this.affectationId = affectationId;
	}

	public Notification getNotification() {
		return notification;
	}

	public void setNotification(Notification notification) {
		this.notification = notification;
	}

	public CollecteTransporteur getCollecte() {
		return collecte;
	}

	public void setCollecte(CollecteTransporteur collecte) {
		this.collecte = collecte;
	}

	public Installation getInstallation() {
		return installation;
	}

	public void setInstallation(Installation installation) {
		this.installation = installation;
	}

	public DemandeInformation getDemandeInformation() {
		return demandeInformation;
	}

	public void setDemandeInformation(DemandeInformation demandeInformation) {
		this.demandeInformation = demandeInformation;
	}

	public Compte getCompte() {
		return compte;
	}

	public void setCompte(Compte compte) {
		this.compte = compte;
	}

	public Date getDateAffectation() {
		return dateAffectation;
	}

	public void setDateAffectation(Date dateAffectation) {
		this.dateAffectation = dateAffectation;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}
}
