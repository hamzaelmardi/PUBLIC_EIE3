package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "lieuElimination")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class LieuElimination implements Serializable {

    public LieuElimination() {

    }

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column (name="id_lieuElimination")
    private int id_lieuElimination;

    @Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String nom_fr;

    @Column(name = "nom_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String nom_ar;
    
    @Column(name = "tel", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String tel;
    
    @Column(name = "dateD", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String dateD;

    public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getDateD() {
		return dateD;
	}

	public void setDateD(String dateD) {
		this.dateD = dateD;
	}

	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_classification")
    private Classification classification;

    @Column(name = "deleteDateTime", nullable = true)
    private Date deleteDateTime;

    public int getId_lieuElimination() {
        return id_lieuElimination;
    }

    public void setId_lieuElimination(int id_lieuElimination) {
        this.id_lieuElimination = id_lieuElimination;
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

    public Classification getClassification() {
        return classification;
    }

    public void setClassification(Classification classification) {
        this.classification = classification;
    }

    public Date getDeleteDateTime() {
        return deleteDateTime;
    }

    public void setDeleteDateTime(Date deleteDateTime) {
        this.deleteDateTime = deleteDateTime;
    }
}
