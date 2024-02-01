/*************************************************************/
/*   Author:            Matthew Monn                         */
/*   Major:             Computer Science                     */
/*   Creation Date:     April 1, 2023                        */
/*   Due Date:          April 3, 2023                        */
/*   Course:            CSC 136                              */
/*   Professor Name:    Dr. Zhang                            */
/*   Assignment:        #4                                   */
/*   Filename:          fractionType.h                       */
/*   Purpose:           Using the header file with the class */
/*                      fractionType. Program utilizes       */
/*                      operators to overload logical,       */
/*                      arithmetic, stream insertion and     */
/*                      extraction operators. Dealing with   */
/*                      fractions.                           */                     
/*************************************************************/

#ifndef H_fraction
#define H_fraction

#include <iostream>
#include <cmath>

using namespace std;

class fractionType
{
  
public:
  //Constructor
  fractionType(int num = 0, int den = 1);  
  bool operator ==(const fractionType& myFrac) const; // in order, equal to, not equal to, greater than or equal to, less than or equal to, greater than, and less than. 
  bool operator !=(const fractionType& myFrac) const;
  bool operator >=(const fractionType& myFrac) const;
  bool operator <=(const fractionType& myFrac) const;
  bool operator >( const fractionType& myFrac) const;
  bool operator <(const fractionType& myFrac) const; 
  friend ostream& operator<<(ostream&, const fractionType& f);// out stream first, and then in stream overloading. 
  friend istream& operator >>(istream&, fractionType& f);
  fractionType operator+(const fractionType& myFrac) const; //in order, addition, subtraction, multiplication, and divison. 
  fractionType operator-(const fractionType& myFrac) const;
  fractionType operator*(const fractionType& myFrac) const;
  fractionType operator/(const fractionType& myFrac) const;
  fractionType operator ++(); // in order, pre increment, post increment, pre decrement, and post decrement. 
  fractionType operator ++(int);
  fractionType operator --();
  fractionType operator --(int); 
  
  
  
private:
  int numerator;      //variable to store the numerator
  int denominator;    //variable to store the denominator
  
  
  //private method to compute and return the greatest
  //common divisor of the numerator and denominator
  int gcd() {
    
    //assign absolute values of numerator
    //and denominator into a and b
    int a = abs(numerator);
    int b = abs(denominator);
    
    //make sure a is greater than b
    if (a < b)
      {
	int temp = a;
	a = b;
	b = temp;
      }
    
    //use Euclid's algorithm to find and return
    //the greatest common divisor
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }
  
};

#endif
