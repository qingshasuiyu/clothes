package com.clothes.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.clothes.dao.CartDao;
import com.clothes.dao.ClothesDao;
import com.clothes.dao.CustomerDao;
import com.clothes.dao.OrderDao;

import com.clothes.model.Cart;
import com.clothes.model.Clothes;
import com.clothes.model.Customer;
import com.clothes.model.Order;

@Controller @Scope("prototype")
public class CartAction {
	/*业务层对象*/
	@Resource CartDao cartDao;
    @Resource CustomerDao customerDao;
    @Resource ClothesDao clothesDao;
    
    private Cart cart;
    private List<Cart> cartList;
    private Customer customer;
    private Clothes clothes;
	private Integer clothesnum;
    
    public Integer getClothesnum() {
		return clothesnum;
	}
	public void setClothesnum(Integer clothesnum) {
		this.clothesnum = clothesnum;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public List<Cart> getCartList() {
		return cartList;
	}
	public void setCartList(List<Cart> cartList) {
		this.cartList = cartList;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Clothes getClothes() {
		return clothes;
	}
	public void setClothes(Clothes clothes) {
		this.clothes = clothes;
	}
	
    
	/*向购物车中添加服装*/
	public String addCart() throws Exception{
		customer = customerDao.queryCustomerInfo(customer.getName()).get(0);
		Cart cart =new Cart();
		clothesnum=1;
		cart.setCustomer(customer);
		cart.setClothes(clothes);
		cart.setClothesnum(clothesnum);
		cart.setTotal(clothesDao.GetClothesById(clothes.getClothesid()).getUnitprice()*clothesnum);
		cartDao.AddCart(cart);
		return "cart_message";
		
	}
	
	/*显示购物车中所有商品*/
    public String showCart() {
    	
        //将系统设定为用户名不重复，因此在系统中查询到第一个该名称用户即可
    	System.out.println(customer.getName());
        Customer cus= customerDao.queryCustomerInfo(customer.getName()).get(0);
        //注意不需要clothes的查询条件时，下面语句的写法，直接将clothes的条件置为null
        cartList = cartDao.QueryCartInfo(cus,null);

        return "show_view";
    }

    /*显示某一cart的详细信息*/
    public String showDetail() {
    	System.out.print(cart.getCartid());
    	cart = cartDao.GetCartById(cart.getCartid());
        return "detail_view";
    }
    
    /*显示Order的修改项*/
    /*public String showEdit() throws Exception {
    	order = orderDao.GetOrderById(order.getOrderid());
        return "edit_view";
    }*/

    /*编辑Order*/
    /*public String editOrder() throws Exception {
    	orderDao.UpdateOrder(order);
        return "edit_message";
    }*/
    
    /*删除购物车中的某件商品*/
    public String deleteCart() throws Exception {
    	cartDao.DeleteCart(cart.getCartid());
        return "delete_message";
    }
    
    /*查询购物车中的某件商品*/
    public String queryCarts() throws Exception {
    	cartList = cartDao.QueryCartInfo(customer,clothes);
        return "show_view";
    }
    
}
