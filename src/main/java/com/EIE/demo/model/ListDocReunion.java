package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "ListDocReunion")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class ListDocReunion implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column (name="id_listDocReunion")
    private int id_listDocReunion;

    @Column(name = "url_file", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String url_file;

    @Column(name = "deleteDateTime", nullable = true)
    private Date deleteDateTime;

    public int getId_listDocReunion() {
        return id_listDocReunion;
    }

    public void setId_listDocReunion(int id_listDocReunion) {
        this.id_listDocReunion = id_listDocReunion;
    }

    public String getUrl_file() {
        return url_file;
    }

    public void setUrl_file(String url_file) {
        this.url_file = url_file;
    }

    public Date getDeleteDateTime() {
        return deleteDateTime;
    }

    public void setDeleteDateTime(Date deleteDateTime) {
        this.deleteDateTime = deleteDateTime;
    }

    public ListDocReunion() {
    }


}
