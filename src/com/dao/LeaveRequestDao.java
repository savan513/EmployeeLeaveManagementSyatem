package com.dao;

import java.util.List;

import org.hibernate.query.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.bean.Employee;
import com.bean.LeaveRequest;

public class LeaveRequestDao {
	public static int Apply(LeaveRequest lr)
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(LeaveRequest.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction tx=ss.beginTransaction();
		ss.save(lr);
		tx.commit();
		return 1;
	}
	public static  List <LeaveRequest> ShowData(int id)
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(LeaveRequest.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction tx=ss.beginTransaction();
		Query q=ss.createQuery("from LeaveRequest where E_id =:id");
		q.setParameter("id", id);
		List <LeaveRequest> lr=q.getResultList();
		
		
		return lr;
	}
	public static  Long CountLeave(int id,String Type)
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(LeaveRequest.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction tx=ss.beginTransaction();
		Query q=ss.createQuery("select count(Status) from LeaveRequest where E_id =: id and Type =: Type and Status = 2");
		q.setParameter("id", id);
		q.setParameter("Type", Type);
		Long count = (Long)q.uniqueResult();
		
		
		return count;
	}
	
	public static  List <LeaveRequest> ShowAllData()
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(LeaveRequest.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction tx=ss.beginTransaction();
		Query q=ss.createQuery("from LeaveRequest where Status =:no");
		q.setParameter("no","0");
		List <LeaveRequest> lr=q.getResultList();
		
		
		return lr;
	}
	public static int Approve(int id)
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(LeaveRequest.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction tx=ss.beginTransaction();
		Query q=ss.createQuery("from LeaveRequest where No =:id");
		q.setParameter("id", id);
		LeaveRequest Le=(LeaveRequest)q.uniqueResult();
		Le.setStatus("2");
		tx.commit();
		return 1;
	}
	public static int Cancel(int id)
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(LeaveRequest.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction tx=ss.beginTransaction();
		Query q=ss.createQuery("from LeaveRequest where No =:id");
		q.setParameter("id", id);
		LeaveRequest Le=(LeaveRequest)q.uniqueResult();
		Le.setStatus("1");
		tx.commit();
		return 1;
	}
	public static int deleteReq(int id)
	{
		Configuration con=new Configuration().configure().addAnnotatedClass(LeaveRequest.class);
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction tx=ss.beginTransaction();
	
		LeaveRequest Lr=new LeaveRequest();
		Lr.setNo(id);
		ss.delete(Lr);
		tx.commit();
		return 1;
		
	}
}
