package com.EIE.demo.model;
        import java.io.Serializable;
        import javax.persistence.Column;
        import javax.persistence.Entity;
        import javax.persistence.GeneratedValue;
        import javax.persistence.GenerationType;
        import javax.persistence.Id;
        import javax.persistence.Table;

        import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "DocumentTransaction")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class DocumentTransaction implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy= GenerationType. IDENTITY)
    @Column (name="tr")
    private int tr;

    @Column (name="titre", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String titre;

    @Column (name="p1", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p1;

    @Column (name="p2", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p2;

    @Column (name="p3", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p3;

    @Column (name="p4", nullable = true, columnDefinition = "NVARCHAR(Max)")
    private String p4;

    @Column (name="p5", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p5;

    @Column (name="p6", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p6;

    @Column (name="p7", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p7;

    @Column (name="p8", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p8;

    @Column (name="p9", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p9;

    @Column (name="p10", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p10;

    @Column (name="p11", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p11;
    
    @Column (name="p12", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p12;
    
    @Column (name="p13", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p13;
    
    @Column (name="p14", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p14;

    @Column (name="p15", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p15;

    @Column (name="p16", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p16;

    @Column (name="p17", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p17;

    @Column (name="p18", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p18;

    @Column (name="p19", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p19;

    @Column (name="p20", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p20;

    @Column (name="p21", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p22;

    @Column (name="p23", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p23;

    @Column (name="p24", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p24;

    @Column (name="p25", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p25;

    @Column (name="logo", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String logo;

    public DocumentTransaction() {
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public int getTr() {
        return tr;
    }

    public void setTr(int tr) {
        this.tr = tr;
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

    public String getP14() {
        return p14;
    }

    public void setP14(String p14) {
        this.p14 = p14;
    }

    public String getP15() {
        return p15;
    }

    public void setP15(String p15) {
        this.p15 = p15;
    }

    public String getP16() {
        return p16;
    }

    public void setP16(String p16) {
        this.p16 = p16;
    }

    public String getP17() {
        return p17;
    }

    public void setP17(String p17) {
        this.p17 = p17;
    }

    public String getP18() {
        return p18;
    }

    public void setP18(String p18) {
        this.p18 = p18;
    }

    public String getP19() {
        return p19;
    }

    public void setP19(String p19) {
        this.p19 = p19;
    }

    public String getP20() {
        return p20;
    }

    public void setP20(String p20) {
        this.p20 = p20;
    }

    public String getP22() {
        return p22;
    }

    public void setP22(String p22) {
        this.p22 = p22;
    }

    public String getP23() {
        return p23;
    }

    public void setP23(String p23) {
        this.p23 = p23;
    }

    public String getP24() {
        return p24;
    }

    public void setP24(String p24) {
        this.p24 = p24;
    }

    public String getP25() {
        return p25;
    }

    public void setP25(String p25) {
        this.p25 = p25;
    }
}

