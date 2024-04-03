import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.ArrayList;
/** 
 * <b> Manages data and operations related to a cheesesteak fundraiser event,
 * including loading member sales data, calculating shared values,
 * and generating aggregate and individual sales reports.
 * This class encapsulates functionality for managing sales data,
 * calculating totals, and generating reports for a cheesesteak fundraiser event. </b>
 * 
 * @author Matthew Monn
 * @author Prof. Langley
 * @version 6.0z Build 9000 Jan 3, 1970.
 */
 
public class CheesesteakFundraiser {
	/** Price for small. */
	public static final float SMALL_PRICE = 7.50f;
	/** Price for large. */
	public static final float LARGE_PRICE = 10.50f;
	/** Price for combo. */
	public static final float COMBO_PRICE = 11.50f;
	/** Tax for Mark's.  */
	public static final float MARKS_SHARE = .8f;
	/** Tax for the return of club. */
	public static final float CLUBS_SHARE = .2f;
	/** Each specific member is stored in members. */
	private ArrayList<MemberSale> members;
	
	/** Holds total for small sales. */
	private int smallsTotal;
	/** Holds total for large sales. */
	private int largesTotal;
	/** Holds total for combo sales. */
	private int combosTotal;
	/** Holds total for all sales. */
	private float totalTotal;
	/** Holds total for profit of club. */
	private float totalClub;
	/** Holds total for tax of Marks. */
	private float totalMarks;
	/** Holds true or false if data is present. */
	private boolean hasData;
	/** 
	* <b> returns the boolean hasData value. </b>
	* @return A boolean value. 
 	*/
	public boolean hasData() {
		return this.hasData;
	}
	/** 
	* <b> CheesesteakFundraiser Constructor that sets ArrayList to members for calling. </b> 
	*/
	public CheesesteakFundraiser() {
		members = new ArrayList<MemberSale>();
	}
	
	 /**
     * <b> This method calculates the values shared between the Aggregate and Individual Sales Reports. </b>
     */
    public void calcSharedValues() {
        System.out.println("DEBUG ! Calculate shared values");
		
		for (MemberSale currMem : members) {
			smallsTotal += currMem.getSmalls();
			largesTotal += currMem.getLarges();
			combosTotal += currMem.getCombos();
		}
		
		totalTotal = (SMALL_PRICE * smallsTotal) + (LARGE_PRICE * largesTotal) + (COMBO_PRICE * combosTotal);
		totalClub = CLUBS_SHARE * totalTotal;
		totalMarks = MARKS_SHARE * totalTotal;
    }
	
	/**
     * <b> Calculates value(s) specific to the Aggregate Sales report and prints the results to the screen. </b>
     */
    public void viewAggregateReport() {
        System.out.println("DEBUG ! Viewing Aggregate Sales Report...");

		float highestEarned = 0;
		String highestEarner = "";
		int numMembers = 0;
		
		for (MemberSale currMem : members) {
			if (currMem.getName() != null) {
				float earned = (SMALL_PRICE * currMem.getSmalls()) + (LARGE_PRICE * currMem.getLarges()) + (COMBO_PRICE * currMem.getCombos());
				if (earned > highestEarned) {
					highestEarned = earned;
					highestEarner = currMem.getName();
				}
			}
		}
		
		numMembers = members.size();
		
		System.out.println("Summary       | Count | $ Amount |");
		System.out.println("----------------------------------");
		String format = "%-13s | %5d | %8.2f |\n";
		System.out.printf(format, "Smalls Sold", smallsTotal, smallsTotal * SMALL_PRICE);
		System.out.printf(format, "Larges Sold", largesTotal, largesTotal * LARGE_PRICE);
		System.out.printf(format, "Combos Sold", combosTotal, combosTotal * COMBO_PRICE);
		System.out.println("----------------------------------");
		format = "%-22s $ %7.2f |\n";
		System.out.printf(format, "Total Voucher Sales", totalTotal);
		System.out.printf(format, "Funds Raised for Club", totalClub);
		System.out.printf(format, "Amount to Pay Mark's", totalMarks);
		System.out.println("----------------------------------");
		System.out.printf(format, "Average per Member", totalTotal/numMembers);
		System.out.println("----------------------------------");
		System.out.println("*         Highest Earner         *");
		format = "* %-30s *\n";
		System.out.printf(format, highestEarner);
		System.out.println("*================================*");
    }
	
	 /**
     * <b> Prints the Individual Sales Report to the screen. </b>
     */
    public void viewIndividualReport() {
        System.out.println("DEBUG ! Viewing Individual Report...");

		String name = "";
		int smalls = 0, larges = 0, combos = 0;
		float total = 0, club = 0, marks = 0;

		System.out.println("Club Member         | Smalls | Larges | Combos | Total ($) |  Club ($) | Mark's ($) |");
        System.out.println("----------------------------------------------------------------------------------- |");
        String format = "%-19s | %6d | %6d | %6d | %9.2f | %9.2f | %10.2f |\n";
		
		for (MemberSale currMem : members) {
			name = currMem.getName();
			if (name != null) {
				smalls = currMem.getSmalls();
				larges = currMem.getLarges();
				combos = currMem.getCombos();
				
				total = (SMALL_PRICE * smalls) + (LARGE_PRICE * larges) + (COMBO_PRICE * combos);
				club = 0.2f * total;
				marks = MARKS_SHARE * total;
				
				System.out.printf(format, name, smalls, larges, combos, total, club, marks);
			}
		}
		
        System.out.println("----------------------------------------------------------------------------------- |");
        System.out.printf(format,"Total", smallsTotal, largesTotal, combosTotal, totalTotal,totalClub, totalMarks);
    }
	
	 /**
     * <b> Loads data from {@code file} into global array(s). </b>
     *
     * @param file 							File inputted by the user.
     * @throws FileNotFoundException		Error checker for if file is invalid.
     */
    public void loadDataFromFile(File file) throws FileNotFoundException {
        System.out.println("DEBUG ! Loading data from " + file.getName() + "...");

        if (file.exists()) {
			clear();
            Scanner fScanner = new Scanner(file);
			int memberCount = 0;
            while (fScanner.hasNextLine()) {
                //System.out.println(fScanner.nextLine());
				String line = fScanner.nextLine();
				String[] parts = line.split(" ");
				
				MemberSale member = new MemberSale(
					parts[0], 
					Integer.parseInt(parts[1]), 
					Integer.parseInt(parts[2]), 
					Integer.parseInt(parts[3]));
				
				members.add(member);
				memberCount++;
            }
			hasData = true;
			calcSharedValues();
        }
    }
	 /**
     * <b> function sets all values to default/zero. </b>
     */
	private void clear() {
		members.clear();
		smallsTotal = 0;
		largesTotal = 0;
		combosTotal = 0;
		totalTotal = 0;
		totalClub = 0;
		totalMarks = 0;
		hasData = false;
	}
	
}