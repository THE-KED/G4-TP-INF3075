package com.CRUD.Momo.Models.DAO;

import java.time.LocalDate;

import com.CRUD.Momo.Models.Entitys.Account;

public class AccountData {

	private Integer Id;
	private Integer IdClient;
	
	private String Numero;
	private String Nom;
	
	private String Pin;
	private LocalDate InitialDate;
	private float Balance;
	
	
	public AccountData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AccountData(Account account) {
		Id = account.getId();
		try {
			IdClient = account.getClient().getId();
			Numero = account.getClient().getNumero();
			Nom = account.getClient().getNom();
		} catch (NullPointerException e) {
			// TODO: handle exception
			IdClient = null;
			Numero = null;
			Nom = null;
		}

		Pin = account.getPin();
		InitialDate = account.getInitialDate();
		Balance = account.getBalance();
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public String toString() {
		return "AccountData [Id=" + Id + ", IdClient=" + IdClient + ", Numero=" + Numero + ", Nom=" + Nom + ", Pin="
				+ Pin + ", InitialDate=" + InitialDate + ", Balance=" + Balance + "]";
	}

	public Integer getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public Integer getIdClient() {
		return IdClient;
	}
	public void setIdClient(int idClient) {
		IdClient = idClient;
	}
	public String getNumero() {
		return Numero;
	}
	public void setNumero(String numero) {
		Numero = numero;
	}
	public String getNom() {
		return Nom;
	}
	public void setNom(String nom) {
		Nom = nom;
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
		
	
}
