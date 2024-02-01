/************************************************************/
/*   Author:            Matthew Monn                        */
/*   Major:             Computer Science                    */
/*   Creation Date:     October 25, 2022                    */
/*   Due Date:          November 1, 2022                    */
/*   Course:            CSC 135 010                         */
/*   Professor Name:    Dr. Zhang                           */
/*   Assignment:        #3                                  */
/*   Filename:          project3_MatthewMonn.cpp            */
/*   Purpose:           To calculate the number of items    */
/*                      sold in a pawn shop, calculating the*/
/*                      gross and net profit.               */
/************************************************************/



#include <iostream>
#include <iomanip>
#include <string>
#include <cmath>

using namespace std;

int main()
{
  int itemSold, i; // itemSold determines how many times the for loop will rerun. i is the counter. 
  double sellingP, costOrig, grossP, Tax, overH, netP; 
  string  name; //if not fine, it will run the while loop. 
  
  cout << setprecision(2) << fixed;
  cout << "Enter the name of the item" << endl;
  cin >> name;
  
  while (name != "fine") //if string doesnt equal fine. 
    {
      grossP = 0; //when loop reruns, this resets the gross profit, so previous gross isn't added to the new gross protfit. 
      
      cout << "Enter the number of items sold: " << endl;
      cin >> itemSold;
      for ( i = 1; i <= itemSold; i++) // If i is less than or equal to itemSold, it will rerun. 
	{
	  cout << "Enter the selling price" << endl;
	  cin >> sellingP;
	  cout << " Enter the cost" << endl;
	  cin >> costOrig;
	  grossP += sellingP - costOrig;
	}
      
      Tax = grossP * 0.06;
      overH = grossP * 0.10;
      netP = grossP - (overH + Tax); // netP is the difference between grossP and the addition of the overhead and the Tax as stated in directions. 
      cout << setw(20) << left << "Name: "<< name << endl; // output statements from the results of the loops and math. 
      cout << setw(20) << left << "Gross profit: " << "$" << grossP << endl;
      cout << setw(20) << left << "Tax: " << "$" << Tax <<  endl;
      cout << setw(20) << left << "Net profit: " <<  "$" << netP << endl;
      cout << "Enter the name of the item" << endl; //Still in while loop, ending with the name asking leads to either fine and ending the loop or going to the top of while loop and rerunning. 
      cin >> name;
    }
  
  if  (name == "fine") //if the statement = fine from asking for the name, it outprints " Bye. ". 
    {
      cout << "Bye." << endl;
    } 
}
