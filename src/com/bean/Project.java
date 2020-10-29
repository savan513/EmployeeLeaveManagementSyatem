package com.bean;
import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
public class Project {
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
int id;
int E_id;
String Title;
String Technology;
String Description;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getE_id() {
	return E_id;
}
public void setE_id(int e_id) {
	E_id = e_id;
}
public String getTitle() {
	return Title;
}
public void setTitle(String title) {
	Title = title;
}
public String getTechnology() {
	return Technology;
}
public void setTechnology(String technology) {
	Technology = technology;
}
public String getDescription() {
	return Description;
}
public void setDescription(String description) {
	Description = description;
}

}
