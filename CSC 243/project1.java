/**************************************************************/
/*   Author:            Matthew Monn                          */
/*   Creation Date:     February 4, 2024                      */
/*   Due Date:          February 9, 2024                      */
/*   Course:            CSC 243                               */
/*   Professor Name:    Professor Langley                     */
/*   Assignment:        #1                                    */
/*   Filename:          Project1.java                         */
/*   Purpose:           To input conditions by program        */
/*                      arguments and console input to        */
/*                      calculate sales for a cheesesteak     */ 
/*                      fundraiser. Involves club member name */
/*                      small, large, combo vouchers sold.    */
/*                      Total sale and Marks's sandwhich shop */
/*                      sales calulated in program.           */  
/**************************************************************/

import java.util.Scanner;

public class Project1 {
    
    public static void main(String[] args) {
	if (args.length > 0) {
		
	    printArgsOutput(args); 
	} 
	else {
		
	    UserInput(); 
	}
    }
    
    public static float calculateTotal(int smalls, int larges, int combos) {
		
        return (7.5f * smalls) + (10.5f * larges) + (11.5f * combos);
    }
    
    public static void printArgsOutput(String[] args) {
	
	System.out.println("Club Member: " + args[0]);
        System.out.println("Small Vouchers Sold: " + args[1]);
	System.out.println("Large Vouchers Sold: " + args[2]);
        System.out.println("Combo Vouchers Sold: " + args[3]);
	
	int small = Integer.valueOf(args[1]);
	int large = Integer.valueOf(args[2]);
	int combo = Integer.valueOf(args[3]);
	
	float argsT = calculateTotal(small, large, combo);
	
	System.out.println("Total Voucher Sales: $ " + String.format("%.2f", argsT));
	
	float FundsArg = argsT * 0.20f; 
	float MarksArg = argsT * 0.80f;
	
	System.out.println("Funds Raised for Club: $ " + String.format("%.2f", FundsArg));
	System.out.println("Amount to Pay Mark's: $ " + String.format("%.2f", MarksArg));
    }
    
    public static void UserInput() { 
	
	System.out.print("Club Member: "); 
	Scanner ScanCM = new Scanner (System.in); 
	String CM = ScanCM.nextLine(); 
	
	System.out.print("Small Vouchers Sold: ");
	Scanner ScanSmall = new Scanner (System.in); 
	int SmallV = ScanSmall.nextInt(); 
	
	System.out.print("Large Vouchers Sold: ");
	Scanner ScanLarge = new Scanner (System.in); 
	int LargeV = ScanLarge.nextInt(); 
	
	System.out.print("Combo Vouchers Sold: "); 
	Scanner ScanCombo = new Scanner (System.in); 
	int ComboV = ScanCombo.nextInt(); 
	
	float totals = calculateTotal(SmallV,LargeV,ComboV);  
	
	float FundsRaised = totals * 0.20f; 
	float MarksPay = totals * 0.80f;
	
	printUserOutput(totals, FundsRaised, MarksPay); 
    }
    
    public static void printUserOutput(float T, float FR, float MP) {
		
	System.out.println("Total Voucher Sales: $ " + String.format("%.2f", T));
	System.out.println("Funds Raised for Club: $ " + String.format("%.2f", FR));
	System.out.println("Amount to Pay Mark's: $ " + String.format("%.2f", MP));
    }
}