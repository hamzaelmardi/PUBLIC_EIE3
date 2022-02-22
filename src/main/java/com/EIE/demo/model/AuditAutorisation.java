package com.EIE.demo.model;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "AuditAutorisation")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class AuditAutorisation implements Serializable{
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="auditAutorisationId")
    private int auditAutorisationId;

    @Column(name = "deleteDateTime", nullable = true)
    private Date deleteDateTime;

    @DateTimeFormat(pattern="dd.MM.yyyy HH:mm:ss")
    @Column(name = "dateAction")
    private Timestamp dateAction;

    @Column(name = "num_aut", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String num_aut;

    @Column(name = "AdresseIp", nullable = true, columnDefinition = "NVARCHAR(MAX)")
    private String AdresseIp;

    @Column(name = "Localisation", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String Localisation;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "compteId")
    private Compte compte;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "statut")
    private StatutProjet statut;

    @Column(name = "action", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String action;

    @Column(name = "type_aut", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String type_aut;

    @Column(name = "etat", nullable = true,columnDefinition = "int default 0")
    private int etat;

    public AuditAutorisation() {
    }

    public int getEtat() {
        return etat;
    }

    public void setEtat(int etat) {
        this.etat = etat;
    }

    public int getAuditAutorisationId() {
        return auditAutorisationId;
    }

    public void setAuditAutorisationId(int auditAutorisationId) {
        this.auditAutorisationId = auditAutorisationId;
    }

    public Date getDeleteDateTime() {
        return deleteDateTime;
    }

    public void setDeleteDateTime(Date deleteDateTime) {
        this.deleteDateTime = deleteDateTime;
    }

    public Timestamp getDateAction() {
        return dateAction;
    }

    public void setDateAction(Timestamp dateAction) {
        this.dateAction = dateAction;
    }

    public String getNum_aut() {
        return num_aut;
    }

    public void setNum_aut(String num_aut) {
        this.num_aut = num_aut;
    }

    public String getAdresseIp() {
        return AdresseIp;
    }

    public void setAdresseIp(String adresseIp) {
        AdresseIp = adresseIp;
    }

    public String getLocalisation() {
        return Localisation;
    }

    public void setLocalisation(String localisation) {
        Localisation = localisation;
    }

    public Compte getCompte() {
        return compte;
    }

    public void setCompte(Compte compte) {
        this.compte = compte;
    }

    public StatutProjet getStatut() {
        return statut;
    }

    public void setStatut(StatutProjet statut) {
        this.statut = statut;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getType_aut() {
        return type_aut;
    }

    public void setType_aut(String type_aut) {
        this.type_aut = type_aut;
    }
}
