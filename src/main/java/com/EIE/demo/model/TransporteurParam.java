package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "transporteurparam")


@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class TransporteurParam implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column (name="id_transporteurParam")
    private int id_transporteurParam;

    @Column(name = "nom", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String nom;

    @Column(name = "adresse", nullable = true, columnDefinition = "NVARCHAR(MAX)")
    private String adresse;

    @Column(name = "tel", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String tel;

    @Column(name = "fax", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String fax;

    @Column(name = "identifiant", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String identifiant;
    @Column(name = "numero_autorisation", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String numero_autorisation;

    @Column(name = "deleteDateTime", nullable = true)
    private Date deleteDateTime;

    @Column(name = "dateFin", nullable = true)
    private Date dateFin;

    @ManyToMany(fetch = FetchType.LAZY)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name = "transporteurParam_moyenTransport",
            joinColumns = { @JoinColumn(name = "id_transporteurParam") },
            inverseJoinColumns = { @JoinColumn(name = "id_moyenTransport") })

    private List<MoyenTransport> moyenTransport = new ArrayList<MoyenTransport>();

    @ManyToMany(fetch = FetchType.LAZY)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name = "transporteurParam_code",
            joinColumns = { @JoinColumn(name = "id_transporteurParam") },
            inverseJoinColumns = { @JoinColumn(name = "id_code") })

    private List<Code> code = new ArrayList<Code>();

    public int getId_transporteurParam() {
        return id_transporteurParam;
    }

    public void setId_transporteurParam(int id_transporteurParam) {
        this.id_transporteurParam = id_transporteurParam;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getIdentifiant() {
        return identifiant;
    }

    public void setIdentifiant(String identifiant) {
        this.identifiant = identifiant;
    }

    public List<MoyenTransport> getMoyenTransport() {
        return moyenTransport;
    }

    public void setMoyenTransport(List<MoyenTransport> moyenTransport) {
        this.moyenTransport = moyenTransport;
    }

    

    

	public List<Code> getCode() {
		return code;
	}

	public void setCode(List<Code> code) {
		this.code = code;
	}

	public Date getDeleteDateTime() {
        return deleteDateTime;
    }

    public void setDeleteDateTime(Date deleteDateTime) {
        this.deleteDateTime = deleteDateTime;
    }

	public String getNumero_autorisation() {
		return numero_autorisation;
	}

	public void setNumero_autorisation(String numero_autorisation) {
		this.numero_autorisation = numero_autorisation;
	}

    public
    Date getDateFin() {
        return dateFin;
    }

    public
    void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }
}
