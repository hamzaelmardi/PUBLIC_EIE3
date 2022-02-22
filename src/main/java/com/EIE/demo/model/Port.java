package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;


    @Entity
    @org.hibernate.annotations.Proxy(lazy = true)
    @Table(name = "Port")

    @JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
    public class Port implements Serializable {

        @Id
        @GeneratedValue(strategy= GenerationType.IDENTITY)
        @Column (name="id_port")
        private int id_port;

        @Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
        private String nom_fr;

        @ManyToOne(fetch = FetchType.EAGER)
        @JoinColumn(name = "idpaysdestinataire")
        private Pays pays;
        
        public Port() {
        }

        public int getId_port() {
            return id_port;
        }

        public void setId_port(int id_port) {
            this.id_port = id_port;
        }

        public String getNom_fr() {
            return nom_fr;
        }

        public void setNom_fr(String nom_fr) {
            this.nom_fr = nom_fr;
        }

        public Pays getPays() {
            return pays;
        }

        public void setPays(Pays pays) {
            this.pays = pays;
        }
    }
