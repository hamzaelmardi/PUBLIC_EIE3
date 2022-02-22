package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "DeclarationTransporteur")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class DeclarationTransporteur implements Serializable {


	public DeclarationTransporteur() {
		
	}

	@Id
    @GeneratedValue (strategy=GenerationType.IDENTITY)
    @Column (name="declarationId")
    private int declarationId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_transporteurParam")
	private TransporteurParam transporteurParam;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_notification")
	private Notification notification;

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;

	@Column(name = "dateModification", nullable = true)
	private Date dateModification;

	@Column(name = "url_file", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url_file;

	@Column(name = "commentaire", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String commentaire;

	@Column(name = "etat", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String etat;

	public int getDeclarationId() {
		return declarationId;
	}
	public void setDeclarationId(int declarationId) {
		this.declarationId = declarationId;
	}
	public TransporteurParam getTransporteurParam() {
		return transporteurParam;
	}
	public void setTransporteurParam(TransporteurParam transporteurParam) {
		this.transporteurParam = transporteurParam;
	}
	public Notification getNotification() {
		return notification;
	}
	public void setNotification(Notification notification) {
		this.notification = notification;
	}
	public Date getDeleteDateTime() {
		return deleteDateTime;
	}
	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}
	public Date getDateModification() {
		return dateModification;
	}
	public void setDateModification(Date dateModification) {
		this.dateModification = dateModification;
	}
	public String getUrl_file() {
		return url_file;
	}
	public void setUrl_file(String url_file) {
		this.url_file = url_file;
	}
	public String getCommentaire() {
		return commentaire;
	}
	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}

}
