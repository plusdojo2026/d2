package dto;

import java.io.Serializable;

public class Cost implements Serializable {
    private int OptionCost;
    private String OptionName;
    
    public Cost(){
        this.OptionCost = 0;
        this.OptionName = "";
    }
    
    public int OptionCost() {
		return OptionCost;
	}

	public void  OptionCost(int  OptionCost) {
		this. OptionCost =  OptionCost;
	}

	public String OptionName() {
		return OptionName;
	}

	public void OptionName(String OptionName) {
		this.OptionName = OptionName;
	}
}