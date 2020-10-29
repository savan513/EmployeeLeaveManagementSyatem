package com.dao;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;


import com.bean.SalaryDetails;
public class SalaryDetailsDao {
	public static int Save_Salary(SalaryDetails Se)
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(SalaryDetails.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction tx=ss.beginTransaction();
		ss.save(Se);
		tx.commit();
		
		return 1;
	}
	
	public static List<SalaryDetails> ShowMySalary(int E_id)
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(SalaryDetails.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		List<SalaryDetails> sd;
		Transaction tx=ss.beginTransaction();
		Query q=ss.createQuery("from SalaryDetails where E_Id =: eid");
		q.setParameter("eid",E_id);
		sd=q.getResultList();
		tx.commit();
		
		return sd;
	}
}
