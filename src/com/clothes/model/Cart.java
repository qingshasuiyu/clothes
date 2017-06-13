package com.clothes.model;

/**
 * Cart entity. @author MyEclipse Persistence Tools
 */

public class Cart implements java.io.Serializable {

	// Fields

	private Integer cartid;
	private Clothes clothes;
	private Customer customer;
	private Integer clothesnum;
	private Double total;

	// Constructors

	/** default constructor */
	public Cart() {
	}

	/** minimal constructor */
	public Cart(Clothes clothes) {
		this.clothes = clothes;
	}

	/** full constructor */
	public Cart(Clothes clothes, Customer customer, Integer clothesnum,
			Double total) {
		this.clothes = clothes;
		this.customer = customer;
		this.clothesnum = clothesnum;
		this.total = total;
	}

	// Property accessors

	public Integer getCartid() {
		return this.cartid;
	}

	public void setCartid(Integer cartid) {
		this.cartid = cartid;
	}

	public Clothes getClothes() {
		return this.clothes;
	}

	public void setClothes(Clothes clothes) {
		this.clothes = clothes;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Integer getClothesnum() {
		return this.clothesnum;
	}

	public void setClothesnum(Integer clothesnum) {
		this.clothesnum = clothesnum;
	}

	public Double getTotal() {
		return this.total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

}