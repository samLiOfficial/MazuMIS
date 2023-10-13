//��classΪ��Ӧ�����ݿ����account�����ݽṹ�ʹ������

package entity;

public class Account {

	//Declare attributes
	private String id;
	private String name;
	private String amount;
    private String type;
    private String date;
    private String phone;

    //Getter and Setter
    public String getId() {
    	return id;
    }
    
    //Setter and getter
    public void setName(String name) {
    	this.name=name;
    }
    public String getName() {
    	return name;
    }
    public void setAmount(String b) {
    	amount=b;
    }
    public String getAmount() {
    	return amount;
    }
    public void setDate(String c) {
    	date=c;
    }
    public String getDate() {
    	return date;
    }
    public void setType(String d) {
    	type=d;
    }
    public String getType() {
    	return type;
    }
    public void setPohone(String e) {
    	phone=e;
    }
    public String getPhone() {
    	return phone;
    }
    
    //Default Constructor
    public Account() {
    }
    
    //Null Constructor
    public Account(String i,String a,String b,String c,String d,String e) {
    	id=i;
    	name=a;
    	amount=b;
    	date=c;
    	type=d;
    	phone=e;
    }
}

