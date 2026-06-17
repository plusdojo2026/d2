package dto;

import java.io.Serializable;

public class Finish implements Serializable{
    private int id_chara;
    private String date_finish;
    private String time_finish;
    private String category;
    private String image;
    
    public Finish(){
        this.id_chara = 0;
        this.date_finish = "";
        this.time_finish = "";
        this.category = "";
        this.image = "";
    }
    
    //requestからの変換用
    public Finish(int id_chara, String date_finish, String time_finish, String category) {
    	this.id_chara = id_chara;
    	this.date_finish = date_finish;
    	this.time_finish = time_finish;
    	this.category = category;
    }
    //通知用
    public Finish(String date_finish, String category) {
    	this.date_finish = date_finish;
    	this.category = category;
    }

    public int getId_chara(){
        return id_chara;
    }

    public void setId_chara(int id_chara){
        this.id_chara = id_chara;
    }

    public String getDate_finish(){
        return date_finish;
    }

    public void setDate_finish(String date_finish){
        this.date_finish = date_finish;
    }
    public String getTime_finish(){
        return time_finish;
    }

    public void setTime_finish(String time_finish){
        this.time_finish = time_finish;
    }
    public String getCategory(){
        return category;
    }

    public void setCategory(String category){
        this.category = category;
    }

    public String getImage(){
        return image;
    }

    public void setImage(String image){
        this.image = image;
    }

}