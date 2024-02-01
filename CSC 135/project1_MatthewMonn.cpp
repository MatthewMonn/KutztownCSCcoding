/************************************************************/
/*   Author:            Matthew Monn                        */
/*   Major:             Computer Science                    */
/*   Creation Date:     September 22, 2022                  */
/*   Due Date:          September 29, 2022                  */
/*   Course:            CSC 135 010                         */
/*   Professor Name:    Dr. Zhang                           */
/*   Assignment:        #1                                  */
/*   Filename:          project1_MatthewMonn.cpp            */
/*   Purpose:           To Calculate the intial balance of  */
/*                      of a savings account and apply the  */
/*                      interest rate accumlation to it.    */
/************************************************************/
#include <iostream>
#include <iomanip>
#include <string>
#include <cmath>

using namespace std;

int main()
{
  double principal; //starting balance
  float Rate; //4.25% or 0.0425
  int monthCompound; //12 times in one year
  float Amount; 
  float Total;
  
  cout << "Welcome to Saving Account Balance Calculator" << endl;
  cout << "-------------------------------------------------------------------" << endl;
  cout << "Please enter the intial balance(Without the $ symbol): " <<endl;
  //principal is the starting value of money in the savings account. 
  cin >> principal;
  cout << "Please enter the interest rate: " << endl;
  // The interest rate will add a percentage of money earned in the account on top of the orginial put in. 
  cin >> Rate;
  cout << "Please enter the number of times the interest is compounded in a year: " << endl;
  // Once a month the interest is added to the principal resulting in 12 times a year because of 12 months. 
  cin >> monthCompound;
  Amount = principal * pow(1 + Rate/monthCompound,monthCompound);
  // This equation is the total amount of interest added to the principal at the end of the 12 month period. 
  Total =(Amount - principal);
  // Total amount of interest accumlated in 1 year. 
  cout << "Report" <<endl;
  cout << "-------------------------------------------------------------------" << endl;
  cout << setprecision(2) << fixed;
  cout << left;
  cout << setw(21) << "Interest Rate: " << Rate * 100 << "%" << endl;
  cout << setw(21) << "Times Compounded: " << monthCompound << endl;
  cout << setw(20) << "Principal: " << " $ " << principal << endl;
  cout << setw(20) << "Interest: " << " $ " << Total << endl;
  cout << setw(20) << "Amount in Savings: " << " $ " << Amount << endl;
  //equally setting the report together using equal spaces for optimal legibility. 
}
