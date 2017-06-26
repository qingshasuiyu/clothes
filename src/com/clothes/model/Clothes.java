package com.clothes.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Clothes entity. @author MyEclipse Persistence Tools
 */

public class Clothes implements java.io.Serializable {

	// Fields

	private Integer clothesid;
	private String type;
	private String clothestype;
	private Double unitprice;
	private String filepath;
	private Set carts = new HashSet(0);
	private Set orders = new HashSet(0);
	private Set carts_1 = new HashSet(0);
	private Set orders_1 = new HashSet(0);

	// Constructors

	/** default constructor */
	public Clothes() {
	}

	/** minimal constructor */
	public Clothes(String clothestype) {
		this.clothestype = clothestype;
	}

	/** full constructor */
	public Clothes(String type, String clothestype, Double unitprice,
			String filepath, Set carts, Set orders, Set carts_1, Set orders_1) {
		this.type = type;
		this.clothestype = clothestype;
		this.unitprice = unitprice;
		this.filepath = filepath;
		this.carts = carts;
		this.orders = orders;
		this.carts_1 = carts_1;
		this.orders_1 = orders_1;
	}

	// Property accessors

	public Integer getClothesid() {
		return this.clothesid;
	}

	public void setClothesid(Integer clothesid) {
		this.clothesid = clothesid;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
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

	public Set getCarts() {
		return this.carts;
	}

	public void setCarts(Set carts) {
		this.carts = carts;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}

	public Set getCarts_1() {
		return this.carts_1;
	}

	public void setCarts_1(Set carts_1) {
		this.carts_1 = carts_1;
	}

	public Set getOrders_1() {
		return this.orders_1;
	}

	public void setOrders_1(Set orders_1) {
		this.orders_1 = orders_1;
	}

}