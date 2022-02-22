package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
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
@Table(name = "reunion")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class Reunion implements Serializable {
	
	
	public Reunion() {
		
	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="id_reunion")
    private int id_reunion;
	
	

	@Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_fr;
	
	@Column(name = "nom_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_ar;

	@Column(name = "url_pv", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url_pv;

	@Column(name = "url_presence", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url_presence;

	@Column(name = "periode_send_rapport", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String periode_send_rapport;

	public String getPeriode_send_rapport() {
		return periode_send_rapport;
	}
	public void setPeriode_send_rapport(String periode_send_rapport) {
		this.periode_send_rapport = periode_send_rapport;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_statut_projet")
	private StatutProjet statut;

	@Column(name = "commentaire", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String commentaire;
	
	@Column(name = "description", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String description;
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "reporte", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String reporte;

	@Column(name = "examen", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String examen;

	@Column(name = "type", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String type;

	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "reunion_comite",
			joinColumns = { @JoinColumn(name = "id_reunions", nullable = true) },
			inverseJoinColumns = { @JoinColumn(name = "id_comites", nullable = true) })

	@Column(nullable = true)
	private List<Comite> comite = new ArrayList<Comite>();
	
	/*@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "reunion_ids")
	private Reunion reunion;*/
	
	public String getReporte() {
		return reporte;
	}

	public void setReporte(String reporte) {
		this.reporte = reporte;
	}

	/*public Reunion getReunion() {
		return reunion;
	}

	public void setReunion(Reunion reunion) {
		this.reunion = reunion;
	}*/

	public int getId_reunion() {
		return id_reunion;
	}

	public void setId_reunion(int id_reunion) {
		this.id_reunion = id_reunion;
	}

	public String getDate_reunion() {
		return date_reunion;
	}

	public void setDate_reunion(String date_reunion) {
		this.date_reunion = date_reunion;
	}

	@Column(name = "date_reunion", nullable = true)
	private String date_reunion;
	
	public String getNom_ar() {
		return nom_ar;
	}

	public void setNom_ar(String nom_ar) {
		this.nom_ar = nom_ar;
	}

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;
	
	
	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	public String getExamen() {
		return examen;
	}

	public void setExamen(String examen) {
		this.examen = examen;
	}

	public String getNom_fr() {
		return nom_fr;
	}

	public void setNom_fr(String nom_fr) {
		this.nom_fr = nom_fr;
	}

	public List<Comite> getComite() {
		return comite;
	}

	public void setComite(List<Comite> comite) {
		this.comite = comite;
	}

	public String getUrl_pv() {
		return url_pv;
	}

	public void setUrl_pv(String url_pv) {
		this.url_pv = url_pv;
	}

	public String getUrl_presence() {
		return url_presence;
	}

	public void setUrl_presence(String url_presence) {
		this.url_presence = url_presence;
	}

	public StatutProjet getStatut() {
		return statut;
	}

	public void setStatut(StatutProjet statut) {
		this.statut = statut;
	}

	public String getCommentaire() {
		return commentaire;
	}

	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}
