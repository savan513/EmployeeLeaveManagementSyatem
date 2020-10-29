package com.bean;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class SalaryDetails {
 @Id
 @GeneratedValue(strategy=GenerationType.IDENTITY)
 int Id;
 int E_Id;
 int Urgent_Leaves;
 int Normal_Leaves;
 double Actual_Salary;
 double Total_Salary;
public int getId() {
	return Id;
}
public void setId(int id) {
	Id = id;
}
public int getE_Id() {
	return E_Id;
}
public void setE_Id(int e_Id) {
	E_Id = e_Id;
}
public int getUrgent_Leaves() {
	return Urgent_Leaves;
}
public void setUrgent_Leaves(int urgent_Leaves) {
	Urgent_Leaves = urgent_Leaves;
}
public int getNormal_Leaves() {
	return Normal_Leaves;
}
public void setNormal_Leaves(int normal_Leaves) {
	Normal_Leaves = normal_Leaves;
}
public double getActual_Salary() {
	return Actual_Salary;
}
public void setActual_Salary(double actual_Salary) {
	Actual_Salary = actual_Salary;
}
public double getTotal_Salary() {
	return Total_Salary;
}
public void setTotal_Salary(double total_Salary) {
	Total_Salary = total_Salary;
}
 
}
