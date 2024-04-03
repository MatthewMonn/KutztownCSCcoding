/**
 * <b> Represents a member's sales information including small, large, and combo sales,
 * as well as total sales, club fundraising total, and tax allocation.
 * This class encapsulates sales data for a member including their name,
 * quantities of small, large, and combo sales, total sales amount,
 * club fundraising total, and tax allocation based on the sales. </b>
 *
 * @author Matthew Monn
 * @author Prof. Langley
 * @version 6.0z Build 9000 Jan 3, 1970.
 */
 
public class MemberSale {
	/** Holds name for each member. */
    private String name;
	/** Holds small sale for each member. */
    private int smalls;
	/** Holds large sale for each member. */
    private int larges;
	/** Holds combo sale for each member. */
    private int combos;
    /** Holds total sale for each member. */
    private float total;
	/** Holds club sale for each member. */
    private float club;
	/** Holds tax for marks of each member. */
    private float marks;

   
	/** Constructor for MemberSale(). */
    public MemberSale() {};
	
	/** Constructor for MemberSale().
	 * 
	 * @param name			String name for MemberSale to hold. 
	 * @param smalls		int smalls for MemberSale to hold.
	 * @param larges		int larges for MemberSale to hold.
	 * @param combos        int combos for MemberSale to hold.
	 */
    public MemberSale(String name, int smalls, int larges, int combos) {
        this.name = name;
		this.smalls = smalls;
        this.larges = larges;
        this.combos = combos;
        
        calculateSales();
    }
    /** 
	* returns String name value 
	* @return   		name for current member. 
	*/
    public String getName() { return this.name; }
	/** 
	* returns int smalls value 
	* @return   		small sales for current member. 
	*/
    public int getSmalls()  { return this.smalls; }
	/** 
	* returns int larges value 
	* @return  		 	large sales for current member. 
	*/
    public int getLarges()  { return this.larges; }
	/** 
	* returns int combos value 
	* @return   		combo sales for current member. 
	*/
    public int getCombos()  { return this.combos; }
    
	/** 
	* returns float total value 
	* @return   		total sales for current member. 
	*/
    public float getTotal() { return this.total; }
	/** 
	* returns float club value 
	* @return   		club total of fundraising for current member. 
	*/
    public float getClub()  { return this.club; }
	/** 
	* returns float marks value 
	* @return   		tax for marks of current member. 
	*/
    public float getMarks() { return this.marks; }
	
	/** 
	* Sets current member name to MemberSale() name.  
	* @param name 			String name for current member. 
	*/
	public void setName(String name)  { this.name = name; }
	/** 
	* sets current member small sales to MemberSale() small sales. 
	* @param smalls 		int smalls for current member small sales. 
	*/
    public void setSmalls(int smalls) { this.smalls = smalls; }
	/** 
	* sets current member large sales to MemberSale() small sales. 
	* @param larges 		int lages for current member large sales.
	*/
    public void setLarges(int larges) { this.larges = larges; }
	/** 
	* sets current member combo sales to MemberSale() combo sales. 
	* @param combos 		int combos for current member combo sales. 
	*/
    public void setCombos(int combos) { this.combos = combos; }
    
	/** 
	* sets the MemberSale() total, club, and marks values to correct values of each iterated member. 
	*/
    public void calculateSales() {
        this.total = (7.5f * smalls) + (10.5f * combos) + (11.5f * larges);
        this.club = this.total * .2f;
        this.marks = this.total * .8f;
    }
    
}