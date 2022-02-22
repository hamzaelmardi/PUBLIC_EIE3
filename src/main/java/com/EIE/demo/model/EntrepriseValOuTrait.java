package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "EntrepriseValOuTrait")
@Inheritance(strategy = InheritanceType.JOINED)
@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler","createDateTime","updateDateTime"})
public class EntrepriseValOuTrait implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "id_notification", nullable = true)
    private int id_notification;

    private String nom_installation;

    private String adresse;

    private String telephone;

    private String num_patente;

    private String nom_entreprise;


    private String represent_entreprise;

    private String fax;

    private String email;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom_installation() {
        return nom_installation;
    }

    public void setNom_installation(String nom_installation) {
        this.nom_installation = nom_installation;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getNum_patente() {
        return num_patente;
    }

    public void setNum_patente(String num_patente) {
        this.num_patente = num_patente;
    }


    public int getId_notification() {
        return id_notification;
    }

    public void setId_notification(int id_notification) {
        this.id_notification = id_notification;
    }


    public String getNom_entreprise() {
        return nom_entreprise;
    }

    public void setNom_entreprise(String nom_entreprise) {
        this.nom_entreprise = nom_entreprise;
    }

    public String getRepresent_entreprise() {
        return represent_entreprise;
    }

    public void setRepresent_entreprise(String represent_entreprise) {
        this.represent_entreprise = represent_entreprise;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
