package service;

import java.util.List;

import dao.Dao;
import entity.Account;
import entity.Statistic;


public class Service_Proc {
	Dao dao=new Dao();

	public List<Account> show(String name) {
		return dao.show(name);
	}
	

	
	//return sucessful
	public int update(Account account) {
		int f=0;
		if(dao.update(account)) {
			f=1;
		}
		return f;
	}

	//Return successful 
	 public int delete(String id) {
	    	int f=0;
	    	if(dao.delete(id)) {
	    		f=1;
	    	}
	    	return f;
	    }

	 //Add scucess ful
	public int add(Account account) {
		int f=0; // not success 
		if(!dao.nameExist(account.getName())) { //if name not exist, then return 1
			f=1;
			if(dao.add(account))
				{
				f=2; // if add is successful, then return 2
				}
		}
		else
		{
			dao.add(account);
		}
		return f;	
	}


	public Account getByid_For_Delete(String id) {
		return dao.getByid_For_Delete(id);
	}

	
	//List
	public List<Account> list() {
		// TODO �Զ����ɵķ������
		return dao.list();
	}
	
	public List<Account> list_Sorted() {
		// TODO �Զ����ɵķ������
		return dao.list_Sorted();
	}
	
	public Statistic summary() {
		return dao.summary();
	}

	//Plug
	public Account getByid_For_Update(String id) {
		// TODO �Զ����ɵķ������
		return dao.getByid_For_Update(id);
	}

	//Plug 
	public List<Account> listBydate(String start_date, String end_date) {
		return dao.listBydate(start_date,end_date);
	}

	//Plug 
	public List<Account> listByname(String name) {
		return dao.listByname(name);
	}

	
	//Plug
	public List<Account> list_expire_member() {
		// TODO �Զ����ɵķ������
		return dao.list_expire_member();
	}

	
}
