package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "question")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class Questions implements Serializable {


	public Questions() {
		
	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="id_question")
    private int id_question;
	
	
	@Column(name = "type", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String type;
	
	@Column(name = "description", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String description;

	@Column(name = "description_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String description_ar;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "compte_id")
	private Compte compte;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_autorisation")
	private AutorisationParam autorisation;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_evaluation")
	private EvaluationParam eveluation;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "question_reponse", joinColumns = {
			@JoinColumn(name = "id_question") }, inverseJoinColumns = { @JoinColumn(name = "id_reponse") })
	private List<Reponse> reponses = new ArrayList<Reponse>();

	@Column(name = "nbr", nullable = true)
	private int nbr;

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;

	public int getNbr() {
		return nbr;
	}

	public void setNbr(int nbr) {
		this.nbr = nbr;
	}

	public int getId_question() {
		return id_question;
	}

	public void setId_question(int id_question) {
		this.id_question = id_question;
	}

	
	public String getDescription() {
		return description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public AutorisationParam getAutorisation() {
		return autorisation;
	}

	public void setAutorisation(AutorisationParam autorisation) {
		this.autorisation = autorisation;
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

	public List<Reponse> getReponses() {
		return reponses;
	}

	public void setReponses(List<Reponse> reponses) {
		this.reponses = reponses;
	}

	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	public EvaluationParam getEveluation() {
		return eveluation;
	}

	public void setEveluation(EvaluationParam eveluation) {
		this.eveluation = eveluation;
	}

	public String getDescription_ar() {
		return description_ar;
	}

	public void setDescription_ar(String description_ar) {
		this.description_ar = description_ar;
	}
}
