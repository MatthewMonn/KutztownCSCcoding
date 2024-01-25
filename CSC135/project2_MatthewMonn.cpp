/************************************************************/
/*   Author:            Matthew Monn                        */
/*   Major:             Computer Science                    */
/*   Creation Date:     October 13, 2022                    */
/*   Due Date:          October 20, 2022                    */
/*   Course:            CSC 135 010                         */
/*   Professor Name:    Dr. Zhang                           */
/*   Assignment:        #2                                  */
/*   Filename:          project2_MatthewMonn.cpp            */
/*   Purpose:           To print out bills for a city water */
/*                      company and for whenever its for    */
/*                      home, commercial, or industrial use.*/
/************************************************************/

#include <iostream>
#include <iomanip>
#include <string>
#include <cmath>

using namespace std;

int main()
{
  int accountNumber; //main account number.
  char serviceCode; //commercial, home, or industrial.
  int gallons;  // how many gallons were used.
  float newGallons; // /the newamount due, how much its gonna cost for how much gallons were used in one category. 
  cout << "Enter the account number: " << endl;
  cin >> accountNumber;
  cout << "Enter the service code" << endl;
  cin >> serviceCode;
  cout << "Enter the amount of water used (in gallons): " << endl;
  cin >> gallons;
  cout << setprecision(2) <<fixed;
  switch(serviceCode)
    {
    case 'h': //home use 
      if (gallons <= 100) // less than or equal to 100 gallons. 
	{
	  cout << "Water Bill Calculator" << endl;
	  cout << "====================================================" << endl;
	  cout << "Account number: " << setw(20) << accountNumber << endl;
	  cout << "Service: " << setw(25) << "Home" << endl;
	  cout << "Gallons of water used: " << setw(9) << gallons << endl;
	  cout << "Amount due: "  << setw(24) << "$10.00" <<  endl; // Any gallons under or equal to 100 gallons is always $10.00 in Home use.   
	} 
      else if (gallons >= 101 && gallons <= 200) // greater than or equal to 101 gallons through less than or equal to 200 gallons. 
        {
	  newGallons = 10 + (( gallons - 100) * 0.05); 
	  cout << "Water Bill Calculator" << endl;
	  cout << "====================================================" << endl;
	  cout << "Account number: "<<  setw(20) << accountNumber << endl;
	  cout << "Service: " << setw(25) << "Home" << endl;
	  cout << "Gallons of water used: " << setw(10) << gallons << endl;
	  cout << "Amount due: " << setw(19) << "$" << newGallons << endl; //between 101 and 200 gallons or equal to new amount after applying the $0.05 to each gallon and incorporating the orginial $10.00. 
	}
      else
	{
	  if (gallons >= 201) //any gallons greater than or equal to 201. 
	    {
	      newGallons = 10 + (0.05 * 100) + ((gallons - 200) * 0.02); 
	      cout << "Water Bill Calculator" << endl;
	      cout << "====================================================" << endl;
	      cout << "Account number: "<<  setw(20) << accountNumber << endl;
	      cout << "Service: " << setw(25) << "Home" << endl;
	      cout << "Gallons of water used: " << setw(10) << gallons << endl;
	      cout << "Amount due: " <<	setw(19) << "$" << newGallons << endl; //applying the factors of the last equations and the $0.02 per gallons for >=201 = new amount. 
	    }
	}
      break;
    case 'c': //commerical use
      if (gallons <= 1000)// less than or equal to 1000 gallons. 
	{
	  cout << "Water Bill Calculator" << endl;
          cout << "====================================================" << endl;
          cout << "Account number: "<<  setw(19) << accountNumber << endl;
          cout << "Service: " << setw(24) << "Commercial" << endl;
          cout << "Gallons of water used: " << setw(9) << gallons << endl;
          cout << "Amount due: " << setw(24) <<"$500.00" << endl; //anything less than or equal to 1000 gallons always equals $500.00 in the new amount. 
	}
      else if (gallons >= 1001 && gallons <= 2500) // gallons are greater than or equal to 1001 and gallons are less than or equal to 2500 gallons. 
	{
	  newGallons = 500 + (( gallons - 1000) * 0.08);
	  cout << "Water Bill Calculator" << endl;
	  cout << "====================================================" << endl;
	  cout << "Account number: "<<  setw(20) << accountNumber << endl;
	  cout << "Service: " << setw(25) << "Commercial" << endl;
	  cout << "Gallons of water used: " << setw(11) << gallons << endl;
	  cout << "Amount due: " << setw(19) << "$" << newGallons << endl; //applying the original $500.00 and taking from the orginial 1000 gallons, this equals the new sum after applying the $0.08 to each.
	}
      else 
	{
	  if ( gallons >= 2501) // gallons greater than or equal to 2501 gallons. 
	    newGallons = 500 + (0.08 * 1500) + (( gallons - 2500) * 0.06);  
	  cout << "Water Bill Calculator" << endl;
	  cout << "====================================================" << endl;
	  cout << "Account number: "<<  setw(20) << accountNumber << endl;
	  cout << "Service: " << setw(25) << "Commercial" << endl;
	  cout << "Gallons of water used: " << setw(11) << gallons << endl;
	  cout << "Amount due: " << setw(19) << "$" << newGallons << endl; //applying the same factors of last equation, adding the factor of $0.06 to each gallon equals the new amount. 
	}
      break;
    case 'i': //industrial use. 
      if (gallons <= 5000) // less than or equal to 5000 gallons 
	{
	  cout << "Water Bill Calculator" << endl;
          cout << "====================================================" << endl;
          cout << "Account number: "<<  setw(20) << accountNumber << endl;
          cout << "Service: " << setw(25) << "Industrial" << endl;
          cout << "Gallons of water used: " << setw(11) << gallons << endl;
          cout << "Amount due: " << setw(26) <<"$1500.00" << endl; //anything under or equalling 5000 gallons is $1500.00
	}
      else
	{
	  if (gallons >= 5001) // gallons greater than or equal to 5001. 
	    {  
	      newGallons = 1500 + (( gallons - 5000) * 0.07);
	      cout << "Water Bill Calculator" << endl;
	      cout << "====================================================" << endl;
	      cout << "Account number: "<<  setw(20) << accountNumber << endl;
	      cout << "Service: " << setw(25) << "Industrial" << endl;
	      cout << "Gallons of water used: " << setw(11) << gallons << endl;
	      cout << "Amount due: " << setw(19) << "$" << newGallons << endl; //applying the orginial 5000 gallons and 1500 dollars than adding the factor of $0.07 each equals the new amount. 
	    }
	}
      break;
    default:
      cout << "Error, enter the right service code." << endl; //default is used if none of the services provided are entered, i.e. h,c,i. 
    }
  
  
}
