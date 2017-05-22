package com.clothes.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.clothes.dao.CustomerDao;
import com.clothes.dao.ClothesDao;
import com.clothes.dao.OrderDao;
import com.clothes.model.Customer;
import com.clothes.model.Clothes;
import com.clothes.model.Order;

@Controller @Scope("prototype")
public class OrderAction {
	/*业务层对象*/
	@Resource OrderDao orderDao;
    @Resource CustomerDao customerDao;
    @Resource ClothesDao clothesDao;
    
    private Order order;
    private List<Order> orderList;
    private Customer customer;
    private Clothes clothes;
	private Integer clothesnum;
    
    public Integer getClothesnum() {
		return clothesnum;
	}
	public void setClothesnum(Integer clothesnum) {
		this.clothesnum = clothesnum;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
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
	
    
	/*添加订单*/
	public String addOrder() throws Exception{
		customer = customerDao.queryCustomerInfo(customer.getName()).get(0);
		Order ord =new Order();
		
		ord.setCustomer(customer);
		ord.setClothes(clothes);
		ord.setClothesnum(clothesnum);
		ord.setTotal(clothesDao.GetClothesById(clothes.getClothesid()).getUnitprice()*clothesnum);
		orderDao.AddOrder(ord);
		return "order_message";
		
	}
	
	/*显示所有order*/
    public String showOrder() {
    	
        //将系统设定为用户名不重复，因此在系统中查询到第一个该名称用户即可
    	System.out.println(customer.getName());
        Customer cus= customerDao.queryCustomerInfo(customer.getName()).get(0);
        //注意不需要clothes的查询条件时，下面语句的写法，直接将clothes的条件置为null
        orderList = orderDao.QueryOrderInfo(cus,null);

        return "show_view";
    }

    /*显示某一Order的详细信息*/
    public String showDetail() {
    	System.out.print(order.getOrderid());
    	order = orderDao.GetOrderById(order.getOrderid());
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
    
    /*删除Order*/
    /*public String deleteOrder() throws Exception {
    	orderDao.DeleteOrder(food.getFoodid());
        return "delete_message";
    }*/
    
    /*查询Order*/
    public String queryOrders() throws Exception {
    	orderList = orderDao.QueryOrderInfo(customer,clothes);
        return "show_view";
    }
    

}
