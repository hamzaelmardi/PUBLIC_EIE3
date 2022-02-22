package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "installation_autorise")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class InstallationAutorise implements Serializable {

    public InstallationAutorise() {

    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_installation_autorise")
    private int id_installation_autorise;

    @Column(name = "raison", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String raison;
    @Column(name = "tel", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String tel;
    @Column(name = "fax", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String fax;
    @Column(name = "deleteDateTime", nullable = true)
    private Date deleteDateTime;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "installprefecture")
    private Prefecture prefecture;
    @Column(name = "date_delivrance", nullable = true)
    private Date date_delivrance;
    @Column(name = "date_prorogation", nullable = true)
    private Date date_prorogation;
    @Column(name = "date_fin", nullable = true)
    private String date_fin;

    public
    int getId_installation_autorise() {
        return id_installation_autorise;
    }

    public
    void setId_installation_autorise(int id_installation_autorise) {
        this.id_installation_autorise = id_installation_autorise;
    }

    public
    String getRaison() {
        return raison;
    }

    public
    void setRaison(String raison) {
        this.raison = raison;
    }

    public
    String getTel() {
        return tel;
    }

    public
    void setTel(String tel) {
        this.tel = tel;
    }

    public
    String getFax() {
        return fax;
    }

    public
    void setFax(String fax) {
        this.fax = fax;
    }

    public
    Date getDeleteDateTime() {
        return deleteDateTime;
    }

    public
    void setDeleteDateTime(Date deleteDateTime) {
        this.deleteDateTime = deleteDateTime;
    }

    public
    Prefecture getPrefecture() {
        return prefecture;
    }

    public
    void setPrefecture(Prefecture prefecture) {
        this.prefecture = prefecture;
    }

    public
    Date getDate_delivrance() {
        return date_delivrance;
    }

    public
    void setDate_delivrance(Date date_delivrance) {
        this.date_delivrance = date_delivrance;
    }

    public
    Date getDate_prorogation() {
        return date_prorogation;
    }

    public
    void setDate_prorogation(Date date_prorogation) {
        this.date_prorogation = date_prorogation;
    }

    public
    String getDate_fin() {
        return date_fin;
    }

    public
    void setDate_fin(String date_fin) {
        this.date_fin = date_fin;
    }
}
