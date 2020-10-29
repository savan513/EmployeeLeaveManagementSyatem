package com.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class LeaveRequest {
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
int No;
public int getNo() {
	return No;
}
public void setNo(int no) {
	No = no;
}
public int getE_id() {
	return E_id;
}
public void setE_id(int e_id) {
	E_id = e_id;
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
public String getFrom_Date() {
	return From_Date;
}
public void setFrom_Date(String from_Date) {
	From_Date = from_Date;
}
public String getTo_Date() {
	return To_Date;
}
public void setTo_Date(String to_Date) {
	To_Date = to_Date;
}
public String getType() {
	return Type;
}
public void setType(String type) {
	Type = type;
}
public String getReason() {
	return Reason;
}
public void setReason(String reason) {
	Reason = reason;
}
int E_id;
String F_Name;
String L_Name;
String From_Date;
String To_Date;
String Type;
String Reason;
String Status;
public String getStatus() {
	return Status;
}
public void setStatus(String status) {
	Status = status;
}
public LeaveRequest() {}

}
