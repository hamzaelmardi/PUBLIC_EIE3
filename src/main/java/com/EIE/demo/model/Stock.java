//package com.dentaire.demo.model;
//
//import java.time.LocalDateTime;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.Inheritance;
//import javax.persistence.InheritanceType;
//import javax.persistence.JoinColumn;
//import javax.persistence.JoinTable;
//import javax.persistence.ManyToMany;
//import javax.persistence.ManyToOne;
//import javax.persistence.Table;
//
//import org.hibernate.annotations.CreationTimestamp;
//import org.hibernate.annotations.Fetch;
//import org.hibernate.annotations.FetchMode;
//import org.hibernate.annotations.UpdateTimestamp;
//
//import com.fasterxml.jackson.annotation.JsonAutoDetect;
//import com.fasterxml.jackson.annotation.JsonIgnore;
//import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
//import com.fasterxml.jackson.annotation.JsonInclude;
//import com.fasterxml.jackson.databind.annotation.JsonSerialize;
//
//
//@Entity
//@org.hibernate.annotations.Proxy(lazy = true)
//@Table(name = "stock")
//
//@JsonIgnoreProperties(ignoreUnknown = true)
//@JsonAutoDetect
//public class Stock {
//	
//	
//	public Stock() {
//		
//	}
//
//	@Id
//    @GeneratedValue (strategy=GenerationType.AUTO)
//    @Column (name="stockId")
//    private int stockId;
//	
//
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "articleId")
//	private Article article;
//	
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "magasinId")
//	private Magasin magasin;
//	
//	public int getStockId() {
//		return stockId;
//	}
//
//	public void setStockId(int stockId) {
//		this.stockId = stockId;
//	}
//
//	public Article getArticle() {
//		return article;
//	}
//
//	public void setArticle(Article article) {
//		this.article = article;
//	}
//
//	public Magasin getMagasin() {
//		return magasin;
//	}
//
//	public void setMagasin(Magasin magasin) {
//		this.magasin = magasin;
//	}
//
//	
//
//	public Double getQuantite() {
//		return quantite;
//	}
//
//	public void setQuantite(Double quantite) {
//		this.quantite = quantite;
//	}
//
//	public LocalDateTime getCreateDateTime() {
//		return createDateTime;
//	}
//
//	public void setCreateDateTime(LocalDateTime createDateTime) {
//		this.createDateTime = createDateTime;
//	}
//
//	public LocalDateTime getUpdateDateTime() {
//		return updateDateTime;
//	}
//
//	public void setUpdateDateTime(LocalDateTime updateDateTime) {
//		this.updateDateTime = updateDateTime;
//	}
//
//	public Date getDeleteDateTime() {
//		return deleteDateTime;
//	}
//
//	public void setDeleteDateTime(Date deleteDateTime) {
//		this.deleteDateTime = deleteDateTime;
//	}
//
//	@Column(name = "quantite", nullable = true, columnDefinition = "NVARCHAR(255)")
//	private Double quantite;
//	
//	@Column
//	@CreationTimestamp
//	private LocalDateTime createDateTime;
//
//	@Column
//	@UpdateTimestamp
//	private LocalDateTime updateDateTime;
//	
//	@Column
//	private Date deleteDateTime;
//	
//	
//
//
//}
