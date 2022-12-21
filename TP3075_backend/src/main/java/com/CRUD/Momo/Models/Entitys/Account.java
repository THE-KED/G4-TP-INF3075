package com.CRUD.Momo.Models.Entitys;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.OneToOne;

import org.hibernate.annotations.DynamicUpdate;

import com.CRUD.Momo.Models.DAO.AccountData;

@Entity
@DynamicUpdate
public class Account {
	
	@javax.persistence.Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Id;
	
	@OneToOne(cascade = CascadeType.ALL)
	private Client Client;
	private String Pin;
	private LocalDate InitialDate;
	private float Balance;
	
	
	
	public Account(int id, Client client, String pin, LocalDate initialDate, float balance) {
		super();
		Id = id;
		this.Client = client;
		this.Pin = pin;
		this.InitialDate = initialDate;
		this.Balance = balance;
	}
	public Account() {
		super();
		// TODO Auto-generated constructor stub
		
		Pin = "0000";
		InitialDate = LocalDate.now();
	}
	
	
	@Override
	public String toString() {
		return "Account [Id=" + Id + ", Client=" + Client + ", Pin=" + Pin + ", InitialDate=" + InitialDate
				+ ", Balance=" + Balance + "]";
	}
	public Account (AccountData data) {
		super();
		Balance =data.getBalance();
		Client = new Client(data);
		Id = data.getId();
		if(data.getInitialDate()==null)
		InitialDate = LocalDate.now();
		else
		InitialDate = data.getInitialDate();
		Pin = data.getPin();
		
	}
	
	
	public Client getClient() {
		return Client;
	}
	public void setClient(Client client) {
		Client = client;
	}
	public String getPin() {
		return Pin;
	}
	public void setPin(String pin) {
		Pin = pin;
	}
	public LocalDate getInitialDate() {
		return InitialDate;
	}
	public void setInitialDate(LocalDate initialDate) {
		InitialDate = initialDate;
	}
	public float getBalance() {
		return Balance;
	}
	public void setBalance(float balance) {
		Balance = balance;
	}
	public Integer getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	
	
	public void depos(float balance) {
		
		this.Balance += balance;
		
	}
	
	public void retrait(float balance) {
		
		this.Balance -= balance;
		
	}
}
