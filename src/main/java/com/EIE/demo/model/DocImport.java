package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "docImport")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class DocImport implements Serializable {

    public DocImport() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_docImport")
    private int id_docImport;

    public int getId_docImport() {
        return id_docImport;
    }

    public void setId_docImport(int id_docImport) {
        this.id_docImport = id_docImport;
    }

    @Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String nom_fr;
    @Column(name = "typeaut", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String typeaut;

    public String getTypeaut() {
        return typeaut;
    }

    public void setTypeaut(String typeaut) {
        this.typeaut = typeaut;
    }

    @Column(name = "nom_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String nom_ar;
    @Column(name = "uri", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String uri;
    @Column(name = "description", nullable = true, columnDefinition = "NVARCHAR(MAX)")
    private String description;
    @Column(name = "cocher", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String cocher;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idClassification")
    private Classification classification;

    public Classification getClassification() {
        return classification;
    }

    public void setClassification(Classification classification) {
        this.classification = classification;
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

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public String getCocher() {
        return cocher;
    }

    public void setCocher(String cocher) {
        this.cocher = cocher;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

}
