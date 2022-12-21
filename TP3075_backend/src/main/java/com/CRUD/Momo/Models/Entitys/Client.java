package com.CRUD.Momo.Models.Entitys;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.hibernate.annotations.DynamicUpdate;

import com.CRUD.Momo.Models.DAO.AccountData;

@Entity
@DynamicUpdate
public class Client {
	
	@javax.persistence.Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Id;
	private String Numero;
	private String Nom;
	
	public Client() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Client(int id, String numero, String nom) {
		super();
		Id = id;
		Numero = numero;
		Nom = nom;
	}
	public Client(AccountData data) {
		super();
		Id = data.getIdClient();
		Numero = data.getNumero();
		Nom = data.getNom();
	}
	
	
	@Override
	public String toString() {
		return "Client [Id=" + Id + ", Numero=" + Numero + ", Nom=" + Nom + "]";
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
	public Integer getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	
	
	
}
