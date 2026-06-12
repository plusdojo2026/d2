package dto;

/**
 * お知らせテーブルのデータ保持用DTOクラス
 */
public class Info {
    private String date_info;
    private String title_info;
    private String message_info;

    // --- ゲッターとセッター ---
    public String getDate_info() { return date_info; }
    public void setDate_info(String date_info) { this.date_info = date_info; }

    public String getTitle_info() { return title_info; }
    public void setTitle_info(String title_info) { this.title_info = title_info; }

    public String getMessage_info() { return message_info; }
    public void setMessage_info(String message_info) { this.message_info = message_info; }
}