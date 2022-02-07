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
	
	//key:��ǰ��ȣ, value : �ֹ���ü
		private Hashtable<String, orderDTO> hCart =
				new Hashtable<String, orderDTO>();
    
  //Cart Add : ������ ��ٱ��� �ִ� ����� �������, ���� ��츦 �������� ����
  	public void addCart(orderDTO order) {
  		String productNo = order.getoProductNo();
  		int a = 11111;
  		int quantity = order.getoQuantity();
  		if(quantity>0) {
  			if(hCart.containsKey(productNo)) {//������ ��ٱ��Ͽ� ��ǰ�� �ִ� ���
  				//��ٱ��Ͽ� ���� �ֹ� ��ü�� ������
  				orderDTO temp = hCart.get(productNo);
  				//������ ������ ���ο� �ֹ��� ������ ���Ѵ�.
  				quantity +=temp.getoQuantity();
  				order.setoQuantity(quantity);
  				//������ ������ ��ü�� ��ٱ��� ����
  				hCart.put(productNo, order);
  				System.out.println("+++++++++++++" + productNo);
  			}else {//������ ��ٱ��Ͽ� ��ǰ�� ���� ���
  				hCart.put(productNo, order);
  				System.out.println("------------------------" + productNo);
  				System.out.println("�ؽ����̺�"+hCart.isEmpty());
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
  		//��ǰ��ȣ�� hCart�� ��ü�� ã�Ƽ� ����
  		hCart.remove(order.getoProductNo());
  	}
  	
  	//Cart List
  	public Hashtable<String, orderDTO> getCartList(){
  		return hCart;
  	}
    
   
  	
}
