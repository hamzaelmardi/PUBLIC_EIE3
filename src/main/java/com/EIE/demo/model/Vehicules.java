package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "vehicules")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class Vehicules implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public Vehicules() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_vehicule")
	private int id_vehicule;



	@Column(name = "num_matricule", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String num_matricule;

	@Column(name = "equipementSecurite", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String equipementSecurite;

	@Column(name = "num_mat_enrg_voit", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String num_mat_enrg_voit;

	@Column(name = "num_mat_enrg_auto", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String num_mat_enrg_auto;

	@Column(name = "num_mat_id_prefect", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String num_mat_id_prefect;

	@Column(name = "num_chassis", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String num_chassis;

	@Column(name = "poit_totale_charge", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String poit_totale_charge;

	@Column(name = "point_net", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String point_net;

	@Column(name = "doc_assurance", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String doc_assurance;

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;

	@Column(name = "commantaire", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String commantaire;

	@Column(name = "typeVehicule", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String typeVehicule;

	@Column(name = "typeConteneur", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String typeConteneur;

	@Column(name = "valid", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String valid;

	public String getValid() {
		return valid;
	}

	public void setValid(String valid) {
		this.valid = valid;
	}

	public String getCommantaire() {
		return commantaire;
	}

	public void setCommantaire(String commantaire) {
		this.commantaire = commantaire;
	}

	public String getTypeVehicule() {
		return typeVehicule;
	}

	public void setTypeVehicule(String typeVehicule) {
		this.typeVehicule = typeVehicule;
	}

	public String getTypeConteneur() {
		return typeConteneur;
	}

	public void setTypeConteneur(String typeConteneur) {
		this.typeConteneur = typeConteneur;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public int getId_vehicule() {
		return id_vehicule;
	}

	public void setId_vehicule(int id_vehicule) {
		this.id_vehicule = id_vehicule;
	}

	public String getNum_matricule() {
		return num_matricule;
	}

	public void setNum_matricule(String num_matricule) {
		this.num_matricule = num_matricule;
	}

	public String getNum_chassis() {
		return num_chassis;
	}

	public void setNum_chassis(String num_chassis) {
		this.num_chassis = num_chassis;
	}

	public String getPoit_totale_charge() {
		return poit_totale_charge;
	}

	public void setPoit_totale_charge(String poit_totale_charge) {
		this.poit_totale_charge = poit_totale_charge;
	}

	public String getPoint_net() {
		return point_net;
	}

	public void setPoint_net(String point_net) {
		this.point_net = point_net;
	}

	public String getDoc_assurance() {
		return doc_assurance;
	}

	public void setDoc_assurance(String doc_assurance) {
		this.doc_assurance = doc_assurance;
	}

	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	public String getEquipementSecurite() {
		return equipementSecurite;
	}

	public void setEquipementSecurite(String equipementSecurite) {
		this.equipementSecurite = equipementSecurite;
	}

	public String getNum_mat_enrg_voit() {
		return num_mat_enrg_voit;
	}

	public void setNum_mat_enrg_voit(String num_mat_enrg_voit) {
		this.num_mat_enrg_voit = num_mat_enrg_voit;
	}

	public String getNum_mat_enrg_auto() {
		return num_mat_enrg_auto;
	}

	public void setNum_mat_enrg_auto(String num_mat_enrg_auto) {
		this.num_mat_enrg_auto = num_mat_enrg_auto;
	}

	public String getNum_mat_id_prefect() {
		return num_mat_id_prefect;
	}

	public void setNum_mat_id_prefect(String num_mat_id_prefect) {
		this.num_mat_id_prefect = num_mat_id_prefect;
	}
}
