package com.bean;
import javax.persistence.Column;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
public class Employee {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int Id;
	String F_Name;
	String L_Name;
	String Gender;
	String Mobile_NO;
	String Email;
	String PassWord;
	public Employee()
	{}
	public Employee(int id, String name, String lname,String email, String mb,String g,String Pass) {
		super();
		this.Id=id;
		this.F_Name = name;
		this.L_Name = lname;
		this.Email = email;
		this.Gender =g;
		this.PassWord=Pass;
		this.Mobile_NO=mb;
		
		
	}
	public String getPass() {
		return PassWord;
	}
	public void setPass(String pass) {
		PassWord = pass;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getF_Name() {
		return F_Name;
	}
	public void setF_Name(String f_Name) {
		F_Name = f_Name;
	}
	public String getL_Name() {
		return L_Name;
	}
	public void setL_Name(String l_Name) {
		L_Name = l_Name;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getMobile_NO() {
		return Mobile_NO;
	}
	public void setMobile_NO(String mobile_NO) {
		Mobile_NO = mobile_NO;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
}
