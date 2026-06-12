package dto;

public class ReservationDTO {

    private String job;            // JobSelect
    private String date;           // OptionSelect
    private String time;           // OptionSelect
    private String optionsText;    // OptionSelect（カンマ区切り）

    private String phone;          // MustInfo
    private String email;          // MustInfo
    private String destination;    // MustInfo
    private String note;           // MustInfo
    private String imageFile;      // MustInfo

    public ReservationDTO() {}

    public ReservationDTO(
            String job,
            String date,
            String time,
            String optionsText,
            String phone,
            String email,
            String destination,
            String note,
            String imageFile
    ) {
        this.job = job;
        this.date = date;
        this.time = time;
        this.optionsText = optionsText;
        this.phone = phone;
        this.email = email;
        this.destination = destination;
        this.note = note;
        this.imageFile = imageFile;
    }

    // --- Getter / Setter ---

    public String getJob() { return job; }
    public void setJob(String job) { this.job = job; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }

    public String getOptionsText() { return optionsText; }
    public void setOptionsText(String optionsText) { this.optionsText = optionsText; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }

    public String getImageFile() { return imageFile; }
    public void setImageFile(String imageFile) { this.imageFile = imageFile; }
}
