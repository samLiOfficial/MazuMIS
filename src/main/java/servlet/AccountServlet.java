package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Account;
import entity.Statistic;
import service.Service_Proc;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/AccountServlet")



public class AccountServlet extends HttpServlet {


	//Create a service_Proc object 
	Service_Proc service_Proc=new Service_Proc();
	//There will be a compile time error if you dont indicate that it will throw a error
	
	//service: takes in req and resp and do process based on those two parameters
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//Convention, you need to set character encoding to make sure it can handle different
		//Characters, like chinese chatracter
		req.setCharacterEncoding("utf-8");
		//Request is the 
		
		//Get the method
		String method = req.getParameter("method");  //When the AccountServlet is accessed from a JSP, it takes the value of the 'method' parameter passed to it."
		
		//Based on the method, do different steps 
		if(method.equals("add"))
		{
			add(req,resp);
		}else if(method.equals("delete")) {
			delete(req,resp);
		}else if(method.equals("update")) {
			update(req,resp);
		}else if(method.equals("list")) {
			list(req,resp);
		}else if(method.equals("summary")) {
			summary(req,resp);
		}else if(method.equals("list_sorted")) {
			show_Sorted(req,resp);
		}else if(method.equals("list_sorted_FirstTen")) {
			show_Sorted_FirstTen(req,resp);
		}else if(method.equals("getByid_For_Delete")) {
			getByid_For_Delete(req,resp);
		}else if(method.equals("show")) {
			show(req,resp);
		}
		else if(method.equals("getByid_For_Update")) {
			getByid_For_Update(req,resp);
		}
		else if(method.equals("listBydate")) {
			listBydate(req,resp);
		}
		else if(method.equals("listByname")) {
			listByname(req,resp);
		}
		else if(method.equals("show_after_update")) {
			show_after_update(req,resp);
		}
		else if(method.equals("list_expire_member")) {
			list_expire_member(req,resp);
		}
		
	}
	
	//We will see how the JSP file interact with this 
	
	//Pass in the req and resp and throw possible exceptions 
	private void show(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		
		//Set this first 
		req.setCharacterEncoding("utf-8");
		
		//Obtain the account 
		List<Account> accounts = service_Proc.list();
		
		//Set the attributes 
		req.setAttribute("accounts", accounts);
		//Sends the user to the show.jsp page, forward the req and resp
		//returns an object which can be used to send a request from a servlet to any other resource 
		//In this case, forward is used to forward the request and response objects to another resource 
		//(such as a JSP page or another servlet) on the server. The forwarded resource will then generate
		//the response to the client.
		
		//Just forward the req and resp to the show.jsp webpage 
		req.getRequestDispatcher("show.jsp").forward(req,resp);
	}
	
	private void summary(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		
		//Set this first 
		req.setCharacterEncoding("utf-8");
		
		//Obtain the account 
		Statistic summary = service_Proc.summary();
		
		req.setAttribute("statistic", summary);
		
		req.getRequestDispatcher("summary.jsp").forward(req, resp);
		
		
	}
	
	private void show_Sorted(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		
		//Set this first 
		req.setCharacterEncoding("utf-8");
		
		//Obtain the account 
		List<Account> accounts = service_Proc.list_Sorted();
		
		//Set the attributes 
		req.setAttribute("accounts", accounts);
		//Sends the user to the show.jsp page, forward the req and resp
		//returns an object which can be used to send a request from a servlet to any other resource 
		//In this case, forward is used to forward the request and response objects to another resource 
		//(such as a JSP page or another servlet) on the server. The forwarded resource will then generate
		//the response to the client.
		
		//Just forward the req and resp to the show.jsp webpage 
		req.getRequestDispatcher("show_Sorted.jsp").forward(req,resp);
	}
	
	private void show_Sorted_FirstTen(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		
		//Set this first 
		req.setCharacterEncoding("utf-8");
		
		//Obtain the account 
		List<Account> accounts = service_Proc.list_Sorted();
		
		//Set the attributes 
		req.setAttribute("accounts", accounts);
		//Sends the user to the show.jsp page, forward the req and resp
		//returns an object which can be used to send a request from a servlet to any other resource 
		//In this case, forward is used to forward the request and response objects to another resource 
		//(such as a JSP page or another servlet) on the server. The forwarded resource will then generate
		//the response to the client.
		
		//Just forward the req and resp to the show.jsp webpage 
		req.getRequestDispatcher("show_Sorted_FirstTen.jsp").forward(req,resp);
	}
	
	
	private void add(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		//create a new record--Donation
		
		//Set the encoding firsgt 
		req.setCharacterEncoding("utf-8");

		
		//use the req to form a account
		String id = req.getParameter("id");
		String a = req.getParameter("name");
		String b = req.getParameter("amount");
		String c = req.getParameter("date");
		String d=req.getParameter("type");
		String e=req.getParameter("phone");
		Account account=new Account(id,a,b,c,d,e);
		//Add the account and get the resut number Do something on the SQL data base 
		int k=service_Proc.add(account);
		if(k==2) { // add is successful and name already exist
			req.setAttribute("message", "Addition successful");//setAttribute Save the data from the form to the database and redirect to the add.jsp page.
			//Load the jsp webpage and forward the req and the response 
			req.getRequestDispatcher("add.jsp").forward(req,resp);//getRequestDispatcher Display a page on the website
		} 
		if(k==0)
		{		// add is not suceessful and name already exist
			req.setAttribute("message", "Repeat login failed");
			req.getRequestDispatcher("add.jsp").forward(req,resp);
		}
		if(k==1)
		{		//name does not exist
			req.setAttribute("message", "Database connection failed.");
			req.getRequestDispatcher("add.jsp").forward(req,resp);
		}
	}

	//
	private void list(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		//Query all records" -- Go to "Report" and display the data in "list.jspʾ
		
		//set the encoding standard
		req.setCharacterEncoding("utf-8");
		
		//load the ccount 
		List<Account> accounts = service_Proc.list();
		
		//Set the attribute 
		req.setAttribute("accounts", accounts);
		
		//Forward the things and load the web page 
		req.getRequestDispatcher("list.jsp").forward(req,resp);
	}

	private void listByname(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		//Displaying queried records - Maintain, showing the data on list.jsp.
		
		//set the encoding standard
		req.setCharacterEncoding("utf-8");
		
		//Get name 
		String name = req.getParameter("name");

		
		//load the ccount 
		List<Account> accounts = service_Proc.listByname(name);
		
		//Set the attribute 
		req.setAttribute("accounts", accounts);
		
		//Forward the things and load the web page 
		req.getRequestDispatcher("list.jsp").forward(req,resp);
	}

	

	private void listBydate(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		//Start preventing internal queries and records - Statistics data to list_stats.jsp
		
		///set the encoding standard
		req.setCharacterEncoding("utf-8");
		
		//Get the dates 
		String start_date = req.getParameter("start_date");
		String end_date = req.getParameter("end_date");
		
		//load the ccount 
		List<Account> accounts = service_Proc.listBydate(start_date,end_date);
		
		//Set the attribute 
		req.setAttribute("accounts", accounts);
		
		//Forward the things and load the web page 
		req.getRequestDispatcher("list_stats.jsp").forward(req,resp);
	}
	

	private void list_expire_member(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		//�г������Ѿ�����һ��� ƽ���� ��Ա - Member
		
		//Load the encoding standard
		req.setCharacterEncoding("utf-8");
		
		//Load the accounts 
		List<Account> accounts = service_Proc.list_expire_member();
		
		//Load the attributes
		req.setAttribute("accounts", accounts);
		
		//load the webpage with req and resp forwarded 
		req.getRequestDispatcher("list_expire_member.jsp").forward(req,resp);
	}


	//Same
	private void getByid_For_Update(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
		//ͨ��id���ҳ���¼�����ݸ�updateҳ��׼���޸�
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		Account account=service_Proc.getByid_For_Update(id);
		req.setAttribute("account", account);
		req.getRequestDispatcher("update.jsp").forward(req,resp);
	}
	
	//Same 
	private void update(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		// �޸ļ�¼
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String a = req.getParameter("name");
		String b = req.getParameter("amount");
		String c = req.getParameter("date");
		String d=req.getParameter("type");
		String e=req.getParameter("phone");
	
		Account account=new Account(id,a,b,c,d,e);
		int k=service_Proc.update(account);
		if(k==1) { //Update sucess
		req.setAttribute("message", "Modification succeeded");
		
		//TF is this 
		req.getRequestDispatcher("AccountServlet?method=show_after_update&id="+id).forward(req,resp);

		}  else {
			req.setAttribute("message", "Modification failed");
			req.getRequestDispatcher("show.jsp").forward(req,resp);
		}
	}

	//?
	private void show_after_update(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
		//Show the updated record details
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		Account account=service_Proc.getByid_For_Delete(id);
		if(account==null) {
			
			//Set a message attribute
			req.setAttribute("message", "Query not found, please select again");
			req.getRequestDispatcher("deleteByname.jsp").forward(req,resp);
		}else {
			req.setAttribute("account", account);
			req.getRequestDispatcher("show_after_update.jsp").forward(req,resp);
		}
	}

	private void getByid_For_Delete(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
		//ͨ��id���ҳ���¼�����ݸ�deleteҳ��׼����ɾ������
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		Account account=service_Proc.getByid_For_Delete(id);
		if(account==null) {
			req.setAttribute("message", "Query failed, please make a selection");
			req.getRequestDispatcher("deleteByname.jsp").forward(req,resp);
		}else {
			req.setAttribute("account", account);
			req.getRequestDispatcher("delete.jsp").forward(req,resp);
		}
	}
	
	
	private void delete(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		// ɾ����¼
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
        int k=service_Proc.delete(id);
        if(k==0) {
        	req.setAttribute("message", "Delete failed");
     		req.getRequestDispatcher("deleteByname.jsp").forward(req,resp);
        }
        if(k==1) {
        	req.setAttribute("message", "Delete successful");
     		req.getRequestDispatcher("index.jsp").forward(req,resp);
        }
       
	}
	
	
}
