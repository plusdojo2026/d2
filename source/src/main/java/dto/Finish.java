package dto;

import java.io.Serializable;

public class Finish implements Serializable{
    private int id_chara;
    private String date_finish;
    private String title_finish;
    private String message_finish;
    private String image;
    
    public Finish(){
        this.id_chara = 0;
        this.date_finish = "";
        this.title_finish = "";
        this.message_finish = "";
        this.image = "";
    }

    public int id_chara(){
        return id_chara;
    }

    public void id_chara(int id_chara){
        this.id_chara = id_chara;
    }

    public String date_finish(){
        return date_finish;
    }

    public void date_finish(String date_finish){
        this.date_finish = date_finish;
    }
    public String title_finish(){
        return title_finish;
    }

    public void title_finish(String title_finish){
        this.title_finish = title_finish;
    }
    public String message_finish(){
        return message_finish;
    }

    public void message_finish(String message_finish){
        this.message_finish = message_finish;
    }

    public String image(){
        return image;
    }

    public void image(String image){
        this.image = image;
    }

}