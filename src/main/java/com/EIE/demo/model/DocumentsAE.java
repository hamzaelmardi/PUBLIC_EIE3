package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "DocumentsAE")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class DocumentsAE implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column (name="id_documents_ae")
    private int id_documents_ae;

    @Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String nom_fr;

    @Column(name = "url_file", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_file;

    @Column(name = "commentaire", nullable = true, columnDefinition = "NVARCHAR(MAX)")
    private String commentaire;

    @Column(name = "statut", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String statut;

    public DocumentsAE() {
    }

    public int getId_documents_ae() {
        return id_documents_ae;
    }
    public void setId_documents_ae(int id_documents_ae) {
        this.id_documents_ae = id_documents_ae;
    }
    public String getUrl_file() {
        return url_file;
    }
    public void setUrl_file(String url_file) {
        this.url_file = url_file;
    }
    public String getNom_fr() {
        return nom_fr;
    }
    public String getCommentaire() {
        return commentaire;
    }
    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }
    public String getStatut() {
        return statut;
    }
    public void setStatut(String statut) {
        this.statut = statut;
    }
    public void setNom_fr(String nom_fr) {
        this.nom_fr = nom_fr;
    }
}
