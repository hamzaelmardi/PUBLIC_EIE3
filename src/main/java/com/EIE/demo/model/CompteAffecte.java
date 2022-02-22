package com.EIE.demo.model;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "compte_affecte")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class CompteAffecte implements Serializable {
public CompteAffecte() {
		
	}

	@Id
    @GeneratedValue (strategy=GenerationType. IDENTITY)
    @Column (name="id_compte_affecte")
    private int id_compte_affecte;
	
	@Column(name = "date_Affecte", nullable = true, columnDefinition = "NVARCHAR(255)")
	private Date date_Affecte;
	
	@Column(name = "type_A", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String type_A;
		
	public int getId_compte_affecte() {
		return id_compte_affecte;
	}

	public void setId_compte_affecte(int id_compte_affecte) {
		this.id_compte_affecte = id_compte_affecte;
	}

	public Date getDate_Affecte() {
		return date_Affecte;
	}

	public void setDate_Affecte(Date date_Affecte) {
		this.date_Affecte = date_Affecte;
	}

	

	public String getType_A() {
		return type_A;
	}

	public void setType_A(String type_A) {
		this.type_A = type_A;
	}

	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	public Compte getCompte() {
		return compte;
	}

	public void setCompte(Compte compte) {
		this.compte = compte;
	}

	public Notification getNotification() {
		return notification;
	}

	public void setNotification(Notification notification) {
		this.notification = notification;
	}

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "compte_id")
	private Compte compte;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_notification")
	private Notification notification;

}
