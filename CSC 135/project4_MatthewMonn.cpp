/************************************************************/
/*   Author:            Matthew Monn                        */
/*   Major:             Computer Science                    */
/*   Creation Date:     November 8, 2022                    */
/*   Due Date:          November 17, 2022                   */
/*   Course:            CSC 135 010                         */
/*   Professor Name:    Dr. Zhang                           */
/*   Assignment:        #4                                  */
/*   Filename:          project4_MatthewMonn.cpp            */
/*   Purpose:           To calculate the inflation of two   */
/*                      successive years and whether        */
/*                      inflation is decreasing or          */
/*                      increasing using functions.         */
/************************************************************/



#include <iostream>
#include <iomanip>
#include <string>
#include <cmath>

using namespace std;
void getPrices (double &current, double &priceOneYAgo, double &priceTwoYAgo); //all prototypes for the 3 functions. 
double  calculateInflation (double yearOne, double yearTwo);
void printResult (double infCurrentY, double infOneYAgo); 
int main()
{
  cout << setprecision(2)<<fixed; 
  double current, priceOneYAgo, priceTwoYAgo, infCurrentY, infOneYAgo;
  double yearOne, yearTwo;
  getPrices(current, priceOneYAgo, priceTwoYAgo); //inputting calculations of price of item from current year to two years ago. 
  infCurrentY =  calculateInflation(current, priceOneYAgo); // outputs result and stores result in infCurrentY for the current year of inflation from current and one year ago prices. 
  infOneYAgo =  calculateInflation(priceOneYAgo, priceTwoYAgo); // outputs and stores result in infOneYAgo for the inflation from one year ago and two year ago prices. 
  printResult(infCurrentY,infOneYAgo); //takes the result inflations and outprints to the user. 
  
}




/**************************************************************/
/*   Function name:       getPrices                           */
/*   Description:         Asks for input of current inflation,*/
/*                        inflation of one year ago, and      */ 
/*                        inflation of two years ago on price */
/*                        of item.                            */
/*   Parameters:          double current: current price of    */
/*                        item- input                         */
/*                        double priceOneYAgo: price of item  */
/*                        one year ago- input                 */
/*                        double priceTwoYAgo: price of item  */
/*                        two years ago- input                */
/*   Return Value:        none, void function.                */
/**************************************************************/


void getPrices (double &current, double &priceOneYAgo, double &priceTwoYAgo) //using reference variables for data to be pulled out and back into int main. 
{
  cout << "Enter the current price of the item: ";
  cin >> current;
  cout << "Enter the price of the item one year ago: ";
  cin >> priceOneYAgo;
  cout << "Enter the price of the item two years ago: ";
  cin >> priceTwoYAgo; 
}

/********************************************************************/
/*   Function name:       calculateInflation                        */
/*   Description:         using set equation from directions,       */
/*                        it finds the inflation of the current     */
/*                        year and the year previous to it.         */
/*   Parameters:          double yearOne: variable for the year     */
/*                        that is newer/closer to present day- input*/
/*                        double yearTwo: variable for the year that*/
/*                        is older than yearOne-input               */
/*   Return Value:        double- inflation for the year that is    */
/*                        being inputted.                           */
/********************************************************************/

double  calculateInflation (double yearOne, double yearTwo) // Ran twice in int main to find the current and previous year inflation price.  
{ 
  yearOne = (yearOne - yearTwo)/yearTwo; //set equation in directions.  
  return yearOne;   
}

/********************************************************************/
/*   Function name:       printResult                               */
/*   Description:         Takes results from calculateInflation and */
/*                        outprints the current and past year of    */
/*                        inflation. Determines if inflation is     */
/*                        increasing or not.                        */ 
/*   Parameters:          double infCurrentY: current or newer year */
/*                        resulting price of inflation.             */
/*                        double infOneYAgo: older year resulting   */
/*                        price of inflation.                       */ 
/*   Return Value:        none, void function.                      */
/********************************************************************/

void printResult (double infCurrentY, double infOneYAgo) //printing of outputs for inflation. 
{
  if (infCurrentY > infOneYAgo) //if current year is greater than previous, higher price means inflation is increasing. 
    {
      cout << "Current year inflation: " << infCurrentY << endl;
      cout << "Inflation one year ago: " << infOneYAgo << endl;
      cout << "Inflation is increasing " << endl; 
    }
  else //if not higher, vice versa and the result is inflation is not increasing. 
    {
      cout << "Current year inflation: " << infCurrentY << endl;
      cout << "Inflation one year ago: " << infOneYAgo<< endl;
      cout << "Inflation is not increasing " << endl; 
    }
}
