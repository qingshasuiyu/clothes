package com.clothes.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Clothes entity. @author MyEclipse Persistence Tools
 */

public class Clothes implements java.io.Serializable {

	// Fields

	private Integer clothesid;
	private String clothestype;
	private Double unitprice;
	private String filepath;
	private Set orders = new HashSet(0);

	// Constructors

	/** default constructor */
	public Clothes() {
	}

	/** minimal constructor */
	public Clothes(String clothestype) {
		this.clothestype = clothestype;
	}

	/** full constructor */
	public Clothes(String clothestype, Double unitprice, String filepath,
			Set orders) {
		this.clothestype = clothestype;
		this.unitprice = unitprice;
		this.filepath = filepath;
		this.orders = orders;
	}

	// Property accessors

	public Integer getClothesid() {
		return this.clothesid;
	}

	public void setClothesid(Integer clothesid) {
		this.clothesid = clothesid;
	}

	public String getClothestype() {
		return this.clothestype;
	}

	public void setClothestype(String clothestype) {
		this.clothestype = clothestype;
	}

	public Double getUnitprice() {
		return this.unitprice;
	}

	public void setUnitprice(Double unitprice) {
		this.unitprice = unitprice;
	}

	public String getFilepath() {
		return this.filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}

}