package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "RapportsAE")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class RapportsAE implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column (name="id_rapports_ae")
    private int id_rapports_ae;

    @Column(name = "date", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String date;

    @Column(name = "url_file", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_file;

    public RapportsAE() {
    }

    public int getId_rapports_ae() {
        return id_rapports_ae;
    }
    public void setId_rapports_ae(int id_rapports_ae) {
        this.id_rapports_ae = id_rapports_ae;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getUrl_file() {
        return url_file;
    }
    public void setUrl_file(String url_file) {
        this.url_file = url_file;
    }

}
