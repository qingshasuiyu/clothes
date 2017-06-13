package com.clothes.dao;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clothes.model.Cart;
import com.clothes.model.Clothes;
import com.clothes.model.Customer;
import com.clothes.model.Order;

@Service @Transactional
public class CartDao {
	@Resource SessionFactory factory;
	private Clothes clothes;
	private Customer customer;
	private Integer clothesnum;
	private Double total;
	/*添加订单*/
    public void AddCart(Cart cart) throws Exception {
    	Session s = factory.getCurrentSession();
    	s.save(cart);
    }
    
    /*删除订单*/
    public void DeleteCart (Integer cartId) throws Exception {
        Session s = factory.getCurrentSession(); 
        Object cart = s.load(Cart.class, cartId);
        s.delete(cart);
    }
    
    /*更新订单*/
    public void UpdateCart(Cart cart) throws Exception {
        Session s = factory.getCurrentSession();
        s.update(cart);
    }
    
    /*显示所有订单*/
    public ArrayList<Cart> QueryAllCart() {
        Session s = factory.getCurrentSession();
        String hql = "From Cart";
        Query q = s.createQuery(hql);
        List cartList = q.list();
        return (ArrayList<Cart>) cartList;
    }

    /*根据主键获取信息*/
    public Cart GetCartById(Integer cartid) {
        Session s = factory.getCurrentSession();
        Cart cart = (Cart)s.get(Cart.class, cartid);
        return cart;
    }
    
    /*根据查询条件查询，一般来说，订单查询时，会根据用户ID查对应的订单，或根据服装的名称查对应的订单*/
    public ArrayList<Cart> QueryCartInfo(Customer customer, Clothes clothes) {
    	Session s = factory.getCurrentSession();
    	String hql = "From Cart cart where 1=1";
    	if(null != customer && customer.getCustomerid()!=0) 
    		hql = hql + " and cart.customer.customerid like '%" + customer.getCustomerid() + "%'";
    	if(null != clothes && null!=clothes.getClothestype()) 
    		hql = hql + " and cart.clothes.clothestype like '%" + clothes.getClothestype() + "%'";
    	Query q = s.createQuery(hql);
    	List cartList = q.list();
    	return (ArrayList<Cart>) cartList;
    }
}
