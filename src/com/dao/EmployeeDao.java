package com.dao;

import java.io.InputStream;


import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.bean.Employee;
import com.bean.LeaveRequest;



public class EmployeeDao {
	public static int Register(Employee e)
	{
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Employee.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction tx=ss.beginTransaction();
		ss.save(e);
		tx.commit();
		return 1;
	}
	
	public static int Edit(Employee e)
	{
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Employee.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction tx=ss.beginTransaction();
		ss.update(e);
		tx.commit();
		return 1;
	}
	public static int login(String e,String p)
	{
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Employee.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction tx=ss.beginTransaction();
		Query q = ss.createQuery("from Employee where Email = :email and PassWord =:pass");
		q.setParameter("email", e);
		q.setParameter("pass", p);
		Employee E=(Employee)q.uniqueResult();
		if(E == null)
		{
			return 0;
		}
		return E.getId();
	}
	public static Employee checkit(int id)
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(Employee.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction tx=ss.beginTransaction();
		Query q = ss.createQuery("from Employee where Id =:id");
		q.setParameter("id", id);
		
		Employee E=(Employee)q.uniqueResult();
		
		return E;
	}
	public static List<Employee> fetchemp()
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(Employee.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction tx=ss.beginTransaction();
		Query q=ss.createQuery("from Employee");
	
		List <Employee> le=q.getResultList();
		
		
		return le;
	}
}
