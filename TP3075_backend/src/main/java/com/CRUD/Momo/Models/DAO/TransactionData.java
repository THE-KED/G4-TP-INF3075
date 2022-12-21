package com.CRUD.Momo.Models.DAO;

import java.time.LocalDate;

import com.CRUD.Momo.Models.Entitys.Transaction;

public class TransactionData {

	
	private int Id;
	
	private String Description;
	private LocalDate Date;
	private float Montant;
	private boolean Type;	
	private String Numenvoyeur;
	private String NameSend;
	private String NameRec;
	private float Solde;
	private String NumReceptionneur;
	
	
	public TransactionData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TransactionData(Transaction T) {
		super();
		Id = T.getId();
		Description = T.getDescription();
		Date = T.getDate();
		Montant = T.getMontant();
		Type = T.isType();
		Solde = T.getEnvoyeur().getBalance();
		NameSend = T.getEnvoyeur().getClient().getNom();
		NameRec = T.getReceptionneur().getClient().getNom();
		Numenvoyeur = T.getEnvoyeur().getClient().getNumero();
		NumReceptionneur = T.getReceptionneur().getClient().getNumero();
	}
	
	
	

	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getNameSend() {
		return NameSend;
	}
	public void setNameSend(String nameSend) {
		NameSend = nameSend;
	}
	public String getNameRec() {
		return NameRec;
	}
	public void setNameRec(String nameRec) {
		NameRec = nameRec;
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
	public float getSolde() {
		return Solde;
	}
	public void setSolde(float solde) {
		Solde = solde;
	}
	
	
	public boolean isType() {
		return Type;
	}
	public void setType(boolean type) {
		Type = type;
	}
	public String getNumenvoyeur() {
		return Numenvoyeur;
	}
	public void setNumenvoyeur(String numenvoyeur) {
		Numenvoyeur = numenvoyeur;
	}
	public String getNumReceptionneur() {
		return NumReceptionneur;
	}
	public void setNumReceptionneur(String numReceptionneur) {
		NumReceptionneur = numReceptionneur;
	}
	
}
