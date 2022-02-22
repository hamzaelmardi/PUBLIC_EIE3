package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "DocumentEIE")
@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class DocumentEIE implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "eie")
    private int eie;

    @Column(name = "titre", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String titre;

    @Column(name = "p1", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p1;

    @Column(name = "p2", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p2;

    @Column(name = "p3", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p3;

    @Column(name = "p4", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p4;

    @Column(name = "p5", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p5;

    @Column(name = "p6", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p6;

    @Column(name = "p7", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p7;

    @Column(name = "p8", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p8;

    @Column(name = "p9", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p9;

    @Column(name = "p10", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p10;

    @Column(name = "p11", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p11;

    @Column(name = "p12", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p12;

    @Column(name = "p13", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p13;

    @Column(name = "logo", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String logo;

    public DocumentEIE() {
    }

    public int getEie() {
        return eie;
    }

    public void setEie(int eie) {
        this.eie = eie;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getP1() {
        return p1;
    }

    public void setP1(String p1) {
        this.p1 = p1;
    }

    public String getP2() {
        return p2;
    }

    public void setP2(String p2) {
        this.p2 = p2;
    }

    public String getP3() {
        return p3;
    }

    public void setP3(String p3) {
        this.p3 = p3;
    }

    public String getP4() {
        return p4;
    }

    public void setP4(String p4) {
        this.p4 = p4;
    }

    public String getP5() {
        return p5;
    }

    public void setP5(String p5) {
        this.p5 = p5;
    }

    public String getP6() {
        return p6;
    }

    public void setP6(String p6) {
        this.p6 = p6;
    }

    public String getP7() {
        return p7;
    }

    public void setP7(String p7) {
        this.p7 = p7;
    }

    public String getP8() {
        return p8;
    }

    public void setP8(String p8) {
        this.p8 = p8;
    }

    public String getP9() {
        return p9;
    }

    public void setP9(String p9) {
        this.p9 = p9;
    }

    public String getP10() {
        return p10;
    }

    public void setP10(String p10) {
        this.p10 = p10;
    }

    public String getP11() {
        return p11;
    }

    public void setP11(String p11) {
        this.p11 = p11;
    }

    public String getP12() {
        return p12;
    }

    public void setP12(String p12) {
        this.p12 = p12;
    }

    public String getP13() {
        return p13;
    }

    public void setP13(String p13) {
        this.p13 = p13;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }
}
