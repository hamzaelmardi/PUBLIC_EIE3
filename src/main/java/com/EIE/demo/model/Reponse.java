package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "reponse")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class Reponse implements Serializable {


	public Reponse() {

	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="id_reponse")
    private int id_reponse;

	@Column(name = "description", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String description;

	@Column(name = "description_fr", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String description_fr;

	public String getDate_pub() {
		return date_pub;
	}

	public void setDate_pub(String date_pub) {
		this.date_pub = date_pub;
	}

	public String getHeur_pub() {
		return heur_pub;
	}

	public void setHeur_pub(String heur_pub) {
		this.heur_pub = heur_pub;
	}

	@Column(name = "date_pub", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String date_pub;

	@Column(name = "heur_pub", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String heur_pub;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "compte_id")
	private Compte compte;

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;


	public int getId_reponse() {
		return id_reponse;
	}

	public void setId_reponse(int id_reponse) {
		this.id_reponse = id_reponse;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public
	String getDescription_fr() {
		return description_fr;
	}

	public
	void setDescription_fr(String description_fr) {
		this.description_fr = description_fr;
	}
}
