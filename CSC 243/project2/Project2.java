/**************************************************************/
/*   Author:            Matthew Monn                          */
/*   Creation Date:     February 26, 2024                     */
/*   Due Date:          March 1, 2024                         */
/*   Course:            CSC 243                               */
/*   Professor Name:    Professor Langley                     */
/*   Assignment:        #2                                    */
/*   Filename:          Project2.java                         */
/*   Purpose:           Expands on previous project, uses     */
/*                      2D array to store and create reports  */
/*                      that are formatted well. These are    */ 
/*                      accessible through a menu that is     */
/*                      created. Options decided by Characters*/
/*                      inputted.                             */  
/**************************************************************/ 

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.io.FileNotFoundException;

public class Project2 {
    
    private static final int MAX_ROWS = 20;
    private static String[][] array = new String[4][MAX_ROWS]; //2D array to store information from file. 
    private static File FileCheck;
    private static int smallT; 
    private static int largeT; 
    private static int comboT;
    private static float Total;
    private static float FundsT;
    private static float MarksT; 
    private static float maxEarnings; 
    private static String highestEarner; 
    private static float totalEarnings;
    private static boolean whileCheck = true; //boolean to check the while loops.
    private static float average; 
    public static void main(String[] args) throws FileNotFoundException {
        // TODO Load data from file specified in program arguments if it exists
        // CLI Loop
	if (args.length > 0) { //checks if args are entered, inputs them into 2D array. 
	    File fileA = new File(args[0]);
	    loadDataFromFile(fileA);
	    argsEntered(args); //function for main menu, large scale one. 
	}
	else { //if no args are present, smaller menu shown to load file. 
	    while (whileCheck) {
		System.out.println("==================================================");
		System.out.println("*                    Main Menu                   *");
		System.out.println("==================================================");
		System.out.println("* Type in the corresponding letter for options   *");
		System.out.println("* L: Load New File.                              *");
		System.out.println("* Q: Quit                                        *");
		hDiv();
		System.out.print("Please make a selection: ");
		Scanner charSel = new Scanner (System.in);
		String selectionChar = charSel.next();
		switch (selectionChar) { //switch statement to determine if L or Q entered. 
		case "L":
		    loadNewData(); //loads file in for manipulation.  
		    if (FileCheck.exists()) { //checkss if file exists to jump to full menu.
			argsEntered(args);
		    }
		    else {
			System.out.println("File not found."); //error check.
		    }
		    break;
		    
		case "Q": //exits program if "Q" entered.
		    hDiv();
		    return;
		    
		default: 
		    hDiv(); //error check for wrong input.
		    System.out.println("Selection not recognized. Try again. . .");
		}
	    }
	}
    }
    
    public static void argsEntered(String[] args) throws FileNotFoundException { 
	//function made to shorten main, contains full menu and switch statement for manipulation.
	while (whileCheck) {
            System.out.println("==================================================");
            System.out.println("*                    Main Menu                   *");
            System.out.println("==================================================");
	    System.out.println("* Type in the corresponding letter for options   *");
	    System.out.println("* L: Load New File.                              *");
	    System.out.println("* I: View Individual Sales.                      *");
	    System.out.println("* A: View Aggregate Report.                      *");
	    System.out.println("* Q: Quit                                        *");
	    System.out.println("==================================================");
	    System.out.print("Please make a selection: ");
            // TODO Implement user selection
	    
	    Scanner charS = new Scanner (System.in);
	    String switchChar = charS.next();
	    
	    switch (switchChar) { //switch statement on user input.
	    case "L":
		loadNewData(); //reloads file.
		if (!FileCheck.exists()) { //error checking. 
		    System.out.println("File does not Exist."); 
		} 
		break;
		
	    case "I":
		viewIndividualReport(); //calls function for individual report.
		
		break;
		
	    case "A":
		viewAggregateReport(); //calls function for aggregate report. 
		break;
		
	    case "Q": //exits. 
		hDiv(); 
		whileCheck = false;
		break;
		
	    default: 
		hDiv(); //error checking for wrong input. 
		System.out.println("Selection not recognized. Try again. . ."); 
		
	    }	
	}			
    }
    
    
    /**
     * <b>This method calculates the values shared between the Aggregate and Individual Sales Reports.</b>
     */
    private static void calcSharedValues() {
        //System.out.println("DEBUG ! Calculate shared values");
        // TODO Implement caldSharedValues()
	smallT = 0; //each reset back to zero so previous calls don't add on. 
	largeT = 0; 
	comboT = 0;
	totalEarnings = 0;
	maxEarnings = 0;
	Total = 0;
	FundsT = 0;
	MarksT = 0; 
	average = 0;
	int count = 0;
        for (int i = 0; array[1][i] != null; i++) //traverses the array 
	    {
		
		smallT += Integer.parseInt(array[1][i]); //total number for smalls sold.
		largeT += Integer.parseInt(array[2][i]); //total number for larges sold.
		comboT += Integer.parseInt(array[3][i]); //total number for combos sold.
		
		totalEarnings = (7.5f * smallT) + (10.5f * largeT) + (11.5f * comboT); //total for calculating highest earner.
		if (totalEarnings > maxEarnings) {
		    maxEarnings = totalEarnings;
		    highestEarner = array[0][i]; //stores name of highest earner for report
		}
		count++; //count add by 1 each time for a new member for average per memeber in report.
	    }
	
	Total = (7.5f * smallT) + (10.5f * largeT) + (11.5f * comboT); //Full total of sales. 
	FundsT = Total * 0.20f; //Club tax. 
	MarksT = Total * 0.80f; //Mark's tax.
	average = Total / count; //average for report calculated by total made by total number of members.
    }
    
    /**
     * <b>Calculates value(s) specific to the Aggregate Sales report and prints the results to the screen.</b>
     */
    private static void viewAggregateReport() {
        //System.out.println("DEBUG ! Viewing Aggregate Sales Report...");
	
	calcSharedValues(); //calls function for shared total values. 
	
	/* 
	 * explanation of table format:
	 * System.out.printf(): allows for printed formatting,
	 *                      essentially for easy manipulation.
	 * %5d: %: Indicates that what follows is a format specifier
	 *      5: Specifies the minimum width of the output. If 
	 *         less is entered, left side has spaces added.
	 *      d: Indicates that the argument to be formatted is an integer. 
	 * %7.2f: 
	 *      .2: Specifies the precision, which is the number of digits 
	 *          to be displayed after the decimal point.
	 *      f: indicates that the argument to be formatted is a floating-point 
	 * 		  number.
	 * %-30s: 
	 *      -: Specifies the flag for left-justification. Without this flag, 
	 *         strings are right-justified by default.
	 *      s: Indicates that the argument to be formatted is a string.
	 */
	
	//table for formatting the Aggregated Report and printing.
	System.out.println("Summary      | Count | $ Amount  |"); 
        System.out.println("----------------------------------");
	System.out.printf("Smalls Sold  | %5d | $ %7.2f |\n", smallT,(7.5f * smallT));
        System.out.printf("Larges Sold  | %5d | $ %7.2f |\n", largeT, (10.5f * largeT));
        System.out.printf("Combos Sold  | %5d | $ %7.2f |\n", comboT, (11.5f * comboT));
        System.out.println("----------------------------------");
        System.out.printf("Total Voucher Sales    $ %7.2f |\n", Total);
        System.out.printf("Funds Raised for Club  $ %7.2f |\n", FundsT);
        System.out.printf("Amount to Pay Mark's   $ %7.2f |\n", MarksT);
        System.out.println("----------------------------------");
        System.out.printf("Average per Member     $%7.2f  |\n", average);
        System.out.println("----------------------------------");
        System.out.println("*        Highest Earner          *");
        System.out.printf("* %-30s * \n",highestEarner);
        System.out.println("*================================*");
	
	
    }
    
    /**
     * <b>Prints the Individual Sales Report to the screen.</b>
     */
    private static void viewIndividualReport() {
	// System.out.println("DEBUG ! Viewing Individual Report...");
	
	//start piece of table.
	System.out.println("Club Member         | Smalls | Larges | Combos | Total ($) |  Club ($) | Mark's ($)"); 
	System.out.println("----------------------------------------------------------------------------------- |");
	calcSharedValues();
    // Iterate through the array and print each member's data
	for (int i = 0; i < MAX_ROWS; i++) { 
	    if (array[0][i] != null) { // Check if the row is not empty
		String name = array[0][i]; //stores the name. 
		int smalls = Integer.parseInt(array[1][i]); //takes each member's small,large,and combo sales for report.
		int larges = Integer.parseInt(array[2][i]);
		int combos = Integer.parseInt(array[3][i]);
		float sales = (7.5f * smalls) + (10.5f * larges) + (11.5f * combos); //total sales per member.
		float clubTax = sales * 0.20f; //club tax per member.
		float marksTax = sales * 0.80f; //mark's tax per member.
		// Print member's data
		System.out.printf("%-20s| %6d | %6d | %6d | %9.2f | %9.2f | %10.2f |%n", //formatting table correctly for each number.
				  name, smalls, larges, combos, sales, clubTax, marksTax);
	    }
	}
	//end piece of table, formatted using printf.
	System.out.println("----------------------------------------------------------------------------------- |");
	System.out.printf("Total               | %6d | %6d | %6d | %9.2f | %9.2f | %10.2f |%n",
			  smallT, largeT, comboT, Total, FundsT, MarksT);
	System.out.println("-----------------------------------------------------------------------------------");
    }
    
    /**
     * <b> Prompts the user to enter the name of a file, then calls {@link #loadDataFromFile(File)} to load the data
     * into memory.</b>
     *
     * @throws FileNotFoundException
     */
    private static void loadNewData() throws FileNotFoundException {
	// System.out.println("DEBUG ! Loading new data...");
	
	Scanner scanner = new Scanner(System.in); //reads in file as variable for manipulation.
	System.out.println("Please specify the file to load:");
	String filename = scanner.nextLine();
	File file = new File(filename);
	FileCheck = file;
	if (!file.exists()) {
	    return;
	}
	loadDataFromFile(file); //with file loaded, load file data into array.
    }
    
    /**
     * Loads data from {@code file} into global array(s).
     *
     * @param file
     * @throws FileNotFoundException
     */
    private static void loadDataFromFile(File file) throws FileNotFoundException {
        System.out.println("DEBUG ! Loading data from " + file.getName() + "...");
        
	try (Scanner scanner = new Scanner(file)) { //stores scanner containing the file for manipulation.
	    int row = 0;
	    while (scanner.hasNextLine() && row < MAX_ROWS) { //checking to see if there is another line and rows exist.
		String line = scanner.nextLine().trim(); // Trims the line.
		if (!line.isEmpty()) { //if the line isn't at the end/empty.
		    String[] values = line.split("\\s+"); //splits the line at the whitespace, whitespace is denoted as "\\s+". 
		    if (values.length == 4) { //checking for coloumns.
			for (int col = 0; col < 4; col++) { //stores the value per column in each specifc row.
			    array[col][row] = values[col];
			}
			row++; //goes into next row for storage into 2D array.
		    } else {
			System.err.println("Invalid data format in file: " + line); //error checking of file.
		    }
		}
	    }
	}
    }
    
    private static void hDiv() { //function for declared divider.
        System.out.println("--------------------------------------------------");
    }
}
