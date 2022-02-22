package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "paysautorite")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class PaysAutorite implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column (name="id_paysautorite")
    private int id_paysautorite;

    @Column(name = "deleteDateTime", nullable = true)
    private Date deleteDateTime;

    @Column(name = "url_autorite", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_autorite;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "pays")
    private Pays pays;

    @Column(name = "desc_autorite", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String desc_autorite;

    public int getId_paysautorite() {
        return id_paysautorite;
    }

    public void setId_paysautorite(int id_paysautorite) {
        this.id_paysautorite = id_paysautorite;
    }

    public Date getDeleteDateTime() {
        return deleteDateTime;
    }

    public void setDeleteDateTime(Date deleteDateTime) {
        this.deleteDateTime = deleteDateTime;
    }

    public String getUrl_autorite() {
        return url_autorite;
    }

    public void setUrl_autorite(String url_autorite) {
        this.url_autorite = url_autorite;
    }

    public Pays getPays() {
        return pays;
    }

    public void setPays(Pays pays) {
        this.pays = pays;
    }

    public
    String getDesc_autorite() {
        return desc_autorite;
    }

    public
    void setDesc_autorite(String desc_autorite) {
        this.desc_autorite = desc_autorite;
    }
}
