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
@Table(name = "TransporteurEtranger")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class TransporteurEtranger implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public TransporteurEtranger() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_TransporteurEtranger")
	private int id_TransporteurEtranger;

	@Column(name = "typeVehicule", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String typeVehicule;

	@Column(name = "url_assurance", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String url_assurance;

	@Column(name = "raison_social", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String raison_social;

	@Column(name = "num_matricule", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String num_matricule;

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;

	@Column(name = "adresse", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String adresse;

	@Column(name = "type", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String type;

	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "transporteurET_Port", joinColumns = {
			@JoinColumn(name = "id_TransporteurEtrangere") }, inverseJoinColumns = { @JoinColumn(name = "id_port") })

	private List<Port> port = new ArrayList<Port>();

	public List<Port> getPort() {
		return port;
	}

	public void setPort(List<Port> port) {
		this.port = port;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public int getId_TransporteurEtranger() {
		return id_TransporteurEtranger;
	}

	public void setId_TransporteurEtranger(int id_TransporteurEtranger) {
		this.id_TransporteurEtranger = id_TransporteurEtranger;
	}

	public String getTypeVehicule() {
		return typeVehicule;
	}

	public void setTypeVehicule(String typeVehicule) {
		this.typeVehicule = typeVehicule;
	}

	public String getUrl_assurance() {
		return url_assurance;
	}

	public void setUrl_assurance(String url_assurance) {
		this.url_assurance = url_assurance;
	}

	public String getRaison_social() {
		return raison_social;
	}

	public void setRaison_social(String raison_social) {
		this.raison_social = raison_social;
	}

	public String getNum_matricule() {
		return num_matricule;
	}

	public void setNum_matricule(String num_matricule) {
		this.num_matricule = num_matricule;
	}

	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}
}
