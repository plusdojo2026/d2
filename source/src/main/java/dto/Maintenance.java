package dto;

/**
 * メンテナンステーブルのデータ保持用DTOクラス
 */
public class Maintenance {
    private String date_maintenance;
    private String title_maintenance;
    private String message_maintenance;

    // --- ゲッターとセッター ---
    public String getDate_maintenance() { return date_maintenance; }
    public void setDate_maintenance(String date_maintenance) { this.date_maintenance = date_maintenance; }

    public String getTitle_maintenance() { return title_maintenance; }
    public void setTitle_maintenance(String title_maintenance) { this.title_maintenance = title_maintenance; }

    public String getMessage_maintenance() { return message_maintenance; }
    public void setMessage_maintenance(String message_maintenance) { this.message_maintenance = message_maintenance; }
}