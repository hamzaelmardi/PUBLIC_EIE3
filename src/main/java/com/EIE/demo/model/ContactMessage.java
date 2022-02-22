package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "contactMessage")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class ContactMessage implements Serializable {


	public ContactMessage() {

	}

	@Id
	@GeneratedValue (strategy= GenerationType. IDENTITY)
	@Column (name="id_message")
	private int id_message;



	@Column(name = "typeMsg", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String typemsg;

	@Column(name = "sujet", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String sujet;

	@Column(name = "Email", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String email;

	@Column(name = "numtel", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String numtel;

	@Column(name = "nom", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom;

	@Column(name = "prenom", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String prenom;

	@Column(name = "message", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String message;

	@Column(name = "reponse", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String reponse;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "compte_id")
	private Compte compte;

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;

	@Column(name = "date", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String date;

	@Column(name = "heur", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String heur;


	public int getId_message() {
		return id_message;
	}

	public void setId_message(int id_message) {
		this.id_message = id_message;
	}



	public String getSujet() {
		return sujet;
	}

	public void setSujet(String sujet) {
		this.sujet = sujet;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getReponse() {
		return reponse;
	}

	public void setReponse(String reponse) {
		this.reponse = reponse;
	}

	public Compte getCompte() {
		return compte;
	}

	public void setCompte(Compte compte) {
		this.compte = compte;
	}

	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}


	public String getDate() {return date;}

	public void setDate(String date) {this.date = date;}

	public String getHeur() {return heur;}

	public void setHeur(String heur) {this.heur = heur;}

	public String getTypemsg() {
		return typemsg;
	}

	public void setTypemsg(String type_msg) {
		this.typemsg = type_msg;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getNumtel() {
		return numtel;
	}

	public void setNumtel(String numtel) {
		this.numtel = numtel;
	}
}
