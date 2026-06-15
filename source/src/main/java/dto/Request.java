package dto;

import java.io.Serializable;

public class Request implements Serializable {
	private int id_reservation;
	private int id_chara;
	private String category;
	private String thisdate;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String date;
	private String time;
	private String tell;
	private String mailaddress;
	private String address;
	private String memo;
	private String image;
	private String payment_method;
	private int total_amount;
	private int costst;
	private int cost1;
	private int cost2;
	private int cost3;
	private int cost4;
	
	public Request() {
		this.id_reservation = 0;
		this.id_chara = 0;
		this.category = "";
		this.thisdate = "";
		this.option1 = "";
		this.option2 = "";
		this.option3 = "";
		this.option4 = "";
		this.date = "";
		this.time = "";
		this.tell = "";
		this.mailaddress = "";
		this.address = "";
		this.memo = "";
		this.image = "";
		this.payment_method = "";
		this.total_amount = 0;
		this.costst = 0;
		this.cost1 = 0;
		this.cost2 = 0;
		this.cost3 = 0;
		this.cost4 = 0;
	}
	
	//追加とか?(網羅してあるやつ)
	public Request(int id_reservation, int id_chara, String category, String thisdate,
			String option1, String option2, String option3, String option4, String date,
			String time, String tell, String mailaddress, String address, String memo,
			String image, String payment_method, int total_amount) {
		this.id_reservation = id_reservation;
		this.id_chara = id_chara;
		this.category = category;
		this.thisdate = thisdate;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.date = date;
		this.time = time;
		this.tell = tell;
		this.mailaddress = mailaddress;
		this.address = address;
		this.memo = memo;
		this.image = image;
		this.payment_method = payment_method;
		this.total_amount = total_amount;
	}
	
	//予約成功、通知用
	public Request(String thisdate, String date, String category, String option1, String option2,
			String option3, String option4, int total_amount, String payment_method) {
		this.thisdate = thisdate;
		this.date = date;
		this.category = category;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.total_amount = total_amount;
		this.payment_method = payment_method;
	}
	
	//料金精算用
	public Request(String option1, String option2, String option3, String option4, int total_amount) {
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.total_amount = total_amount;
	}
	
	//オプションのコスト用
	public Request(String option1, String option2, String option3, String option4, int costst, int cost1, int cost2, int cost3, int cost4, int total_amount) {
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.costst = costst;
		this.cost1 = cost1;
		this.cost2 = cost2;
		this.cost3 = cost3;
		this.cost4 = cost4;
		this.total_amount = total_amount;
	}
	
	public Request(String payment_method, int total_amount){
		this.total_amount = total_amount;
		this.payment_method = payment_method;
	}
	
	   public Request(String category, String date, String time, String option1,
			   String option2, String option3, String option4, String tell,
			   String mailaddress, String address, String memo,String image) {
		   this.category = category;
		   this.date = date;
		   this.time = time;
		   this.option1 = option1;
		   this.option2 = option2;
		   this.option3 = option3;
		   this.option4 = option4;
			this.tell = tell;
			this.mailaddress = mailaddress;
			this.address = address;
			this.memo = memo;
			this.image = image;
	   }
	
	

	public int getId_reservation() {
		return id_reservation;
	}

	public void setId_reservation(int id_reservation) {
		this.id_reservation = id_reservation;
	}

	public int getId_chara() {
		return id_chara;
	}

	public void setId_chara(int id_chara) {
		this.id_chara = id_chara;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getThisdate() {
		return thisdate;
	}

	public void setThisdate(String thisdate) {
		this.thisdate = thisdate;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public String getMailaddress() {
		return mailaddress;
	}

	public void setMailaddress(String mailaddress) {
		this.mailaddress = mailaddress;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public int getTotal_amount() {
		return total_amount;
	}
	
	public int getCostst() {
		return costst;
	}

	public void setCostst(int costst) {
		this.costst = costst;
	}

	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	
	 public int getCost1() {
		return cost1;
	}

	public void setCost1(int cost1) {
		this.cost1 = cost1;
	}

	public int getCost2() {
		return cost2;
	}

	public void setCost2(int cost2) {
		this.cost2 = cost2;
	}

	public int getCost3() {
		return cost3;
	}

	public void setCost3(int cost3) {
		this.cost3 = cost3;
	}

	public int getCost4() {
		return cost4;
	}

	public void setCost4(int cost4) {
		this.cost4 = cost4;
	}

	// ここをデバッグのために追加
    @Override
    public String toString() {
        return "Request{" +
                "thisdate='" + thisdate + '\'' +
                ", date='" + date + '\'' +
                ", category='" + category + '\'' +
                ", option1='" + option1 + '\'' +
                ", option2='" + option2 + '\'' +
                ", option3='" + option3 + '\'' +
                ", option4='" + option4 + '\'' +
                ", total_amount=" + total_amount +
                ", payment_method='" + payment_method + '\'' +
                '}';
    }
	
}