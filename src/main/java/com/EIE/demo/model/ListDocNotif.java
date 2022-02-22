package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "listDocNotif")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class ListDocNotif implements Serializable {

	public ListDocNotif() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_listDocNotif")
	private int id_listDocNotif;

	public int getId_listDocNotif() {
		return id_listDocNotif;
	}

	public void setId_listDocNotif(int id_listDocNotif) {
		this.id_listDocNotif = id_listDocNotif;
	}

	@Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_fr;

	@Column(name = "nom_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_ar;

	@Column(name = "url", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "iddocImport")
	private DocImport docImport;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_notification")
	private Notification notif;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_installation")
	private Installation install;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_demande_information")
	private DemandeInformation DemandeEIE;
	

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_collecte")
	private CollecteTransporteur collecte;

	
	public Installation getInstall() {
		return install;
	}

	public void setInstall(Installation install) {
		this.install = install;
	}

	public Notification getNotif() {
		return notif;
	}

	public void setNotif(Notification notif) {
		this.notif = notif;
	}

	public DocImport getDocImport() {
		return docImport;
	}

	public void setDocImport(DocImport docImport) {
		this.docImport = docImport;
	}

	public String getNom_ar() {
		return nom_ar;
	}

	public void setNom_ar(String nom_ar) {
		this.nom_ar = nom_ar;
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

	public CollecteTransporteur getCollecte() {
		return collecte;
	}

	public DemandeInformation getDemandeEIE() {
		return DemandeEIE;
	}

	public void setDemandeEIE(DemandeInformation demandeEIE) {
		DemandeEIE = demandeEIE;
	}

	public void setCollecte(CollecteTransporteur collecte) {
		this.collecte = collecte;
	}
}
