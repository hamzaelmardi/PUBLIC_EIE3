package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "DetailDocumentMouvement")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class DetailDocumentMouvement implements Serializable {


	public DetailDocumentMouvement() {
		
	}

	@Id
    @GeneratedValue (strategy=GenerationType.IDENTITY)
    @Column (name="id_doc_mouvement")
    private int id_doc_mouvement;


	@Column(name = "quantite", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String quantite;
	
	@Column(name = "url", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url;

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;

	
	public Date getDeleteDateTime() {
		return deleteDateTime;
	}
	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}
	public int getId_doc_mouvement() {
		return id_doc_mouvement;
	}
	public void setId_doc_mouvement(int id_doc_mouvement) {
		this.id_doc_mouvement = id_doc_mouvement;
	}
	public String getQuantite() {
		return quantite;
	}
	public void setQuantite(String quantite) {
		this.quantite = quantite;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

}
