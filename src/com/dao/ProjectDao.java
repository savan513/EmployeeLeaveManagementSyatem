package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.bean.*;

public class ProjectDao {
	public static int EnterProject(Project p)
	{
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Project.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction tx=ss.beginTransaction();
		ss.save(p);
		tx.commit();
		return 1;
	}
}
