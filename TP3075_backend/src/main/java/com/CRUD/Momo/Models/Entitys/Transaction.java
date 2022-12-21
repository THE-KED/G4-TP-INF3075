package com.CRUD.Momo.Models.Entitys;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@DynamicUpdate
public class Transaction {

	@javax.persistence.Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Id;
	
	private String Description;
	private LocalDate Date;
	private float Montant;
	
	@ManyToOne
	private Account Envoyeur ;
	
	@ManyToOne
	private Account Receptionneur;
	
	private boolean Type;	//le type de transaction : false pour le retrait et true pour le depos
	
	public Transaction() {
		super();
		Date = LocalDate.now();
		// TODO Auto-generated constructor stub
	}

	public Transaction(int id, String description, LocalDate date, float montant, Account envoyeur,
			Account receptionneur, boolean type) {
		super();
		Id = id;
		Description = description;
		Date = date;
		Montant = montant;
		Envoyeur = envoyeur;
		Receptionneur = receptionneur;
		Type = type;
	}

	public Integer getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public LocalDate getDate() {
		return Date;
	}

	public void setDate(LocalDate date) {
		Date = date;
	}

	public float getMontant() {
		return Montant;
	}

	public void setMontant(float montant) {
		Montant = montant;
	}

	public Account getEnvoyeur() {
		return Envoyeur;
	}

	public void setEnvoyeur(Account envoyeur) {
		Envoyeur = envoyeur;
	}

	public Account getReceptionneur() {
		return Receptionneur;
	}

	public void setReceptionneur(Account receptionneur) {
		Receptionneur = receptionneur;
	}

	public boolean isType() {
		return Type;
	}

	public void setType(boolean type) {
		Type = type;
	}
	
	
}
