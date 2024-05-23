import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
/** 
 * <b> Manages the main functionality and user interface for Project3, a cheesesteak fundraiser data manipulation program.
 * This class provides a command-line interface for users to load data from files, view aggregate and individual sales reports,
 * and quit the program. </b>
 * @author Matthew Monn
 * @author Prof. Langley
 * @version 6.0z Build 9000 Jan 3, 1970.
 */
 
public class Project3 {
	/** 
	* <b> creates an instance of the class CheeseSteakFundraiser for manipulation. </b>
	*/
	static CheesesteakFundraiser cf = new CheesesteakFundraiser();
	
	/** 
	* <b> Main function for Menu calling of data manipulation. </b>
	* @param args 						String[] args for if user enters file name before program is ran. 
	* @throws FileNotFoundException 	Checks for if file is valid. 
	*/
    public static void main(String[] args) throws FileNotFoundException {
        // Load data from file specified in program arguments if it exists
		if (args.length > 0) {
			File file = new File(args[0]);
			cf.loadDataFromFile(file);			
		}

        // CLI Loop
        Scanner in = new Scanner(System.in);
        while (true) {
            // Print options
            System.out.println("==================================================");
            System.out.println("*                    Main Menu                   *");
            System.out.println("==================================================");
			
			if (cf.hasData()) {
				System.out.println("* [L]oad a new file");
				System.out.println("* View [A]ggregate Report");
				System.out.println("* View [I]ndividual Report");
				System.out.println("* [Q]uit");
			} else {
				System.out.println("* [L]oad a new file");
				System.out.println("* [Q]uit");
			}
			
            System.out.println("==================================================");
			System.out.println("Make a selection: ");
			char selection = in.next().charAt(0);
			
			switch(selection) {
				case 'L': loadNewData(); break;
				case 'A': cf.viewAggregateReport(); break;
				case 'I': cf.viewIndividualReport(); break;
				case 'Q': return;
				default: System.out.println("Bad selection, try again.");
			}
			
        }
    }
 //{@link #loadDataFromFile(File file)}
    /**
     * <b> Prompts the user to enter the name of a file, then calls {public void loadDataFromFile(File file) throws FileNotFoundException {}} to load the data
     * into memory.</b>
     *
     * @throws FileNotFoundException			checks for if file is valid. 
     */
    private static void loadNewData() throws FileNotFoundException {
        System.out.println("DEBUG ! Loading new data...");
        // TODO Write the code to load new data.
		System.out.println("Please enter a new filename: ");
		Scanner userIn = new Scanner(System.in);
		String filename = userIn.nextLine();
		File fileIn = new File(filename);
		cf.loadDataFromFile(fileIn);
    }
	/** 
	* <b> calls a standard divider for output menu. </b>
	*/
    private static void hDiv() {
        System.out.println("--------------------------------------------------");
    }
}