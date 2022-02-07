package carts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import orders.orderDTO;

public class CartDAO {
	
	//key:상품번호, value : 주문객체
		private Hashtable<String, orderDTO> hCart =
				new Hashtable<String, orderDTO>();
    
  //Cart Add : 기존에 장바구니 있는 사람이 있을경우, 없을 경우를 로직으로 구현
  	public void addCart(orderDTO order) {
  		String productNo = order.getoProductNo();
  		int a = 11111;
  		int quantity = order.getoQuantity();
  		if(quantity>0) {
  			if(hCart.containsKey(productNo)) {//기존에 장바구니에 상품이 있는 경우
  				//장바구니에 기존 주문 객체를 가져옴
  				orderDTO temp = hCart.get(productNo);
  				//기존에 수량과 새로운 주문에 수량을 더한다.
  				quantity +=temp.getoQuantity();
  				order.setoQuantity(quantity);
  				//수량이 증가된 객체를 장바구니 저장
  				hCart.put(productNo, order);
  				System.out.println("+++++++++++++" + productNo);
  			}else {//기존에 장바구니에 상품이 없는 경우
  				hCart.put(productNo, order);
  				System.out.println("------------------------" + productNo);
  				System.out.println("해쉬테이블"+hCart.isEmpty());
  			}
  		}
  	}
  
  //Cart Update
  	public void updateCart(orderDTO order) {
  		//int -> Integer : AutoBoxing
  		hCart.put(order.getoProductNo(), order);
  	}
  	
  	//Cart Delete
  	public void deleteCart(orderDTO order) {
  		//상품번호로 hCart에 객체를 찾아서 제거
  		hCart.remove(order.getoProductNo());
  	}
  	
  	//Cart List
  	public Hashtable<String, orderDTO> getCartList(){
  		return hCart;
  	}
    
   
  	
}
