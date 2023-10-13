//Data Access Object

package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


import entity.Account;
import entity.Statistic;
import util.Database;


public class Dao {
	public boolean nameExist(String name) {
		
		boolean result =false;
		
		String sql="select name from account where name='"+name+"'";
		Connection conn = Database.conn();
		Statement state = null;
		ResultSet rs = null;
		
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			while (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.close(rs, state, conn);
		}
		
		//If result set finds a row with this name, return true, if not return false
	
	
		return result;
	}

	//The boolean variables indicate if the operation is sucessful
	public boolean add(Account account) {
		//��ӣ�����SQL��:insert into account(name,amount,date,type,phone) values('stephen','158.00','2023-01-10','���','6136666168')

		//Account is a table
		//This insert a entry into the table
		//name,amount,date,type,phone are all column names
		//values are all entries for the insertion
		String sql = "insert into account(name,amount,date,type,phone) values('" +account.getName() + "','" + account.getAmount() + "','" + account.getDate() + "','" +account.getType() +"','" + account.getPhone() + "')";//���
		Connection conn = Database.conn(); // create a new connection
		Statement state = null;
		//f indicate result
		boolean result = false;
		int a=0;
		try {
			state = conn.createStatement();
			//A represent that amount of rows being affected 
			a=state.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//close all created statment, connection, result set
			Database.close(state, conn);
		}
		if (a > 0) {
			result = true;
		}
		return result;
	}

	
	public boolean delete(String id) {
		//sample: delete from account where id = '13'
		
		
		boolean result =false;
		
		//This line of code is creating a SQL query string to delete a row from a
		//database table called "account" based on the "id" value passed as a parameter. 
		String sql = "delete from account where id ='" + id + "'";

		Connection conn = Database.conn();
		Statement state = null;
		int a=0;
		
		//The drill, catching exception
		try {
			state = conn.createStatement();
			a=state.executeUpdate(sql);
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			Database.close(state, conn);
		}
		if(a>0) {
			result =true;
		}
		return result;
	}
	
	
	//I think it passes in a account w/ the same id but all other things different
	public boolean update(Account account) {
		// Sample ,sql����: update account set name='Michael', amount='88.33', date='2019-05-25',type='ƽ����',phone='4165185678' where id='17'
		
		String sql = "update account set name='" + account.getName() + "', amount='" + account.getAmount() + "', date='" + account.getDate()+"',type='" + account.getType()+"',phone='" + account.getPhone()+"' where id='"+account.getId()+"'";

		//Drill
		Connection conn = Database.conn();
		Statement state = null;
		boolean result = false;
		int a = 0;

		//Drill
		try {
			state = conn.createStatement();
			a = state.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.close(state, conn);
		}
	
		//Drill
		if (a > 0) {
			result = true;
		}
		return result;
		
	}
	
	public Statistic summary() {
	    String sql = "SELECT COUNT(DISTINCT name) as total_people, SUM(amount) as total_money FROM account";
	    Connection conn = Database.conn();
	    Statement state = null;
	    ResultSet rs = null;

	    Statistic result_pair = new Statistic();

	    try {
	        state = conn.createStatement();
	        rs = state.executeQuery(sql);

	        if (rs.next()) {
	            result_pair.setAmount_Donor(Integer.toString(rs.getInt("total_people")));
	            result_pair.setAmount_Money(Double.toString(rs.getDouble("total_money")));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        Database.close(rs, state, conn);
	    }

	    return result_pair;
	}

	
	//More like returnList, not show
	public List<Account> show(String name) {
		// �г�����
		String sql = "select * from account";
		Connection conn = Database.conn();
		Statement state = null;
		ResultSet rs = null;
		
		//Create a list account list 
		List<Account> list = new ArrayList<>();
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			//bean is like tem account fr
			Account bean = null;
			while (rs.next()) {
				
				//Get different thing in strings 
				String i = rs.getString("id");
				String a = rs.getString("name");
				String b = rs.getString("amount");
				String c= rs.getString("date");
				String d= rs.getString("type");
				String e= rs.getString("phone");
				
				if (d.equals("Reoccuring Payment Every Month")) {
					// Parse the date string into a LocalDate object
			        LocalDate donationDate = LocalDate.parse(c, DateTimeFormatter.ISO_DATE);
			        
			        // Calculate the number of months between the donation date and today
			        Period period = Period.between(donationDate, LocalDate.now());
			        int months = (int) period.toTotalMonths();
			        
			        // Calculate the donation amount based on the number of months
			        double amount = months * Double.parseDouble(b);
			        
			        // Convert the donation amount to a string
			        b = String.valueOf(amount);
					
				}
				
				
				 bean = new Account(i,a,b,c,d,e);
				 list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.close(rs, state, conn);
		}
		
		return list;
	}
	


	
	//TF the list account is the same as the show
	public List<Account> list() {
		//�г�account�����м�¼
		String sql = "select * from account";
		List<Account> list = new ArrayList<>();
		Connection conn = Database.conn();
		Statement state = null;
		ResultSet rs = null;

		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			Account bean = null;
			while (rs.next()) {
				String i = rs.getString("id");
				String a = rs.getString("name");
				String b = rs.getString("amount");
				String c = rs.getString("date");
				String d = rs.getString("type");
				String e= rs.getString("phone");
				
				if (d.equals("Reoccuring Payment Every Month")) {
					// Parse the date string into a LocalDate object
			        LocalDate donationDate = LocalDate.parse(c, DateTimeFormatter.ISO_DATE);
			        
			        // Calculate the number of months between the donation date and today
			        Period period = Period.between(donationDate, LocalDate.now());
			        int months = (int) period.toTotalMonths();
			        
			        // Calculate the donation amount based on the number of months
			        double amount = months * Double.parseDouble(b);
			        
			        // Convert the donation amount to a string
			        b = String.valueOf(amount);
					
				}
				
				bean = new Account(i,a,b,c,d,e);
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.close(rs, state, conn);
		}
		
		return list;
	}
	
	
	public List<Account> list_Sorted() {
		//�г�account�����м�¼
		String sql = "SELECT * FROM account ORDER BY amount DESC";
		List<Account> list = new ArrayList<>();
		Connection conn = Database.conn();
		Statement state = null;
		ResultSet rs = null;

		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			Account bean = null;
			while (rs.next()) {
				String i = rs.getString("id");
				String a = rs.getString("name");
				String b = rs.getString("amount");
				String c = rs.getString("date");
				String d = rs.getString("type");
				String e= rs.getString("phone");
				
				if (d.equals("Reoccuring Payment Every Month")) {
					// Parse the date string into a LocalDate object
			        LocalDate donationDate = LocalDate.parse(c, DateTimeFormatter.ISO_DATE);
			        
			        // Calculate the number of months between the donation date and today
			        Period period = Period.between(donationDate, LocalDate.now());
			        int months = (int) period.toTotalMonths();
			        
			        // Calculate the donation amount based on the number of months
			        double amount = months * Double.parseDouble(b);
			        
			        // Convert the donation amount to a string
			        b = String.valueOf(amount);
					
				}
				
				bean = new Account(i,a,b,c,d,e);
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.close(rs, state, conn);
		}
		
		return list;
	}
	
	

	//More like list by time interval
	public List<Account> listBydate(String start_date, String end_date) {
		//ѡ��ʼֹ���������м�¼ -- Statistics, ������ʵ����ϵõ���sql��������:
		//select id, name, amount,date,type,phone from account where date between '2019-01-10' and '2023-01-10'group by id 
		//UNION SELECT '','TOTAL',SUM(AMOUNT),'CAD$','','' FROM account where date between '2019-01-10' and '2023-01-10'order by date
		
		//Is it just select those things that 
		String sql = "select id, name, amount,date,type,phone from account where date between '"+ start_date + "' and '"+ end_date + "'"+"group by id \r\n" + 
				"UNION SELECT '','TOTAL',SUM(AMOUNT),'CAD$','','' FROM account where date between '"+ start_date + "' and '"+ end_date + "'" +"order by date";
		List<Account> list = new ArrayList<>();

		Connection conn = Database.conn();
		Statement state = null;
		ResultSet rs = null;

		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			Account bean = null;
			while (rs.next()) {
				
				String i = rs.getString("id");
				String a = rs.getString("name");
				String b = rs.getString("amount");
				String c = rs.getString("date");
				String d = rs.getString("type");
				String e= rs.getString("phone");
				
				if (d.equals("Reoccuring Payment Every Month")) {
					// Parse the date string into a LocalDate object
			        LocalDate donationDate = LocalDate.parse(c, DateTimeFormatter.ISO_DATE);
			        
			        // Calculate the number of months between the donation date and today
			        Period period = Period.between(donationDate, LocalDate.now());
			        int months = (int) period.toTotalMonths();
			        
			        // Calculate the donation amount based on the number of months
			        double amount = months * Double.parseDouble(b);
			        
			        // Convert the donation amount to a string
			        b = String.valueOf(amount);
					
				}
				
				bean = new Account(i,a,b,c,d,e);
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.close(rs, state, conn);
		}
		
		return list;
	}
	
	
	//More like search by name or get by name
	public List<Account> listByname(String name) {
		//�����ֲ�ѯ�ؼ�¼
		String sql = "select * from account where ";
		if (name != "") {
			sql += "name = '" + name + "'";
		}
		
		List<Account> list = new ArrayList<>();
		Connection conn = Database.conn();
		Statement state = null;
		ResultSet rs = null;

		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			Account bean = null;
			while (rs.next()) {
				
				String i = rs.getString("id");
				String a = rs.getString("name");
				String b = rs.getString("amount");
				String c = rs.getString("date");
				String d = rs.getString("type");
				String e= rs.getString("phone");
				bean = new Account(i,a,b,c,d,e);
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.close(rs, state, conn);
		}
		
		return list;
	}
	
	//Require id must be unique or there will be a error
	public Account getByid_For_Delete(String id) {
		//ͨ��id�õ�, SQL��:select * from account where id = '13'

		//form the command
		String sql = "select * from account where ";
		if (id != "") {
			sql += "id = '" + id + "'";
		}
		Connection conn = Database.conn();
		Statement state = null;
		ResultSet rs = null;
		Account account = null;
		
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			//in here everytime in the loop, the result rs will have a different row
			while (rs.next()) {
				String i = rs.getString("id");
				String a=rs.getString("name");
				String b = rs.getString("amount");
				String c=rs.getString("date");
				String d=rs.getString("type");
				String e= rs.getString("phone");
				
				if (d.equals("Reoccuring Payment Every Month")) {
					// Parse the date string into a LocalDate object
			        LocalDate donationDate = LocalDate.parse(c, DateTimeFormatter.ISO_DATE);
			        
			        // Calculate the number of months between the donation date and today
			        Period period = Period.between(donationDate, LocalDate.now());
			        int months = (int) period.toTotalMonths();
			        
			        // Calculate the donation amount based on the number of months
			        double amount = months * Double.parseDouble(b);
			        
			        // Convert the donation amount to a string
			        b = String.valueOf(amount);
					
				}
				
				account = new Account(i,a,b,c,d,e);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Database.close(rs, state, conn);
		}
		
		return account;
	}
	
	
	//Get by ID
	//Redundant 
	public Account getByid_For_Update(String id) {
		//��id��ѯ�ؼ�¼
		String sql = "select * from account where ";
		if (id != "") {
			sql += "id = '" + id + "'";
		}
		Connection conn = Database.conn();
		Statement state = null;
		ResultSet rs = null;
		Account account = null;
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			while (rs.next()) {

				String i = rs.getString("id");
				String a=rs.getString("name");
				String b = rs.getString("amount");
				String c=rs.getString("date");
				String d=rs.getString("type");
				String e= rs.getString("phone");
				
				if (d.equals("Reoccuring Payment Every Month")) {
					// Parse the date string into a LocalDate object
			        LocalDate donationDate = LocalDate.parse(c, DateTimeFormatter.ISO_DATE);
			        
			        // Calculate the number of months between the donation date and today
			        Period period = Period.between(donationDate, LocalDate.now());
			        int months = (int) period.toTotalMonths();
			        
			        // Calculate the donation amount based on the number of months
			        double amount = months * Double.parseDouble(b);
			        
			        // Convert the donation amount to a string
			        b = String.valueOf(amount);
					
				}
				
				account = new Account(i,a,b,c,d,e);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Database.close(rs, state, conn);
		}
		
		return account;
	}
	
	public List<Account> list_expire_member() {
		//��س���һ���ƽ���Ʒѻ�Ա--Member, ������ʵ����ϵõ���sql��������:
		//select * from account where DATE_SUB(CURDATE(), INTERVAL 365 DAY) > date(date) and DATE_SUB(CURDATE(), INTERVAL 730 DAY) < date(date) and type ='ƽ����'
		
		String sql = "SELECT * FROM mazudatabase.account " +
	             "WHERE type = 'Holy Light' " +
	             "AND date < DATE_SUB(CURDATE(), INTERVAL 365 DAY)";
		
		List<Account> list = new ArrayList<>();
		Connection conn = Database.conn();
		Statement state = null;
		ResultSet rs = null;

		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			Account bean = null;
			while (rs.next()) {
				
				String i = rs.getString("id");
				String a = rs.getString("name");
				String b = rs.getString("amount");
				String c = rs.getString("date");
				String d = rs.getString("type");
				String e= rs.getString("phone");
				
				if (d.equals("Reoccuring Payment Every Month")) {
					// Parse the date string into a LocalDate object
			        LocalDate donationDate = LocalDate.parse(c, DateTimeFormatter.ISO_DATE);
			        
			        // Calculate the number of months between the donation date and today
			        Period period = Period.between(donationDate, LocalDate.now());
			        int months = (int) period.toTotalMonths();
			        
			        // Calculate the donation amount based on the number of months
			        double amount = months * Double.parseDouble(b);
			        
			        // Convert the donation amount to a string
			        b = String.valueOf(amount);
					
				}
				
				bean = new Account(i,a,b,c,d,e);
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.close(rs, state, conn);
		}
		
		return list;
	}
	
}
