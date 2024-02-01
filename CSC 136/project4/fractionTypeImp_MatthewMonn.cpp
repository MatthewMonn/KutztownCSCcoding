#ifndef IMP_fraction
#define IMP_fraction

#include "fractionType.h"
#include <iostream>

fractionType::fractionType(int num, int den)
{
  numerator = num;
  denominator = den;
  
}

bool fractionType::operator ==(const fractionType& myFrac) const
{
  return (numerator * myFrac.denominator == myFrac.numerator * denominator);
}

bool fractionType::operator !=(const fractionType& myFrac) const
{
  return (numerator * myFrac.denominator != myFrac.numerator * denominator);
}

bool fractionType::operator >=(const fractionType& myFrac) const
{
  return (numerator * myFrac.denominator >= myFrac.numerator * denominator);
}

bool fractionType::operator <=(const fractionType& myFrac) const
{
  return ( numerator * myFrac.denominator <= myFrac.numerator * denominator); 
}

bool fractionType::operator >( const fractionType& myFrac) const
{
  return (numerator * myFrac.denominator > myFrac.numerator * denominator);
}

bool fractionType::operator <(const fractionType& myFrac) const
{
  return ( numerator * myFrac.denominator < myFrac.numerator * denominator);
}

ostream& operator<<(ostream& os, const fractionType& f)
{
  fractionType result = f;  
  int divisor = result.gcd();
  result.numerator /= divisor;
  result.denominator /= divisor;
  os << result.numerator << " / " << result.denominator;
  return os; 
}

istream& operator >>(istream& is,  fractionType& f)
{
  char a;
  is >> f.numerator;
  is >> a;
  is >> f.denominator;
  return is; 
}
fractionType fractionType::operator+(const fractionType& myFrac) const
{
  int num1 = numerator;
  int den1 = denominator;
  int num2 = myFrac.numerator;
  int den2 = myFrac.denominator;
  int newNum = num1 * den2 + num2 * den1;
  int newDen = den1 * den2; 
  return fractionType(newNum, newDen);
}
fractionType fractionType::operator-(const fractionType& myFrac) const
{
  int num1 = numerator;
  int den1 = denominator;
  int num2 = myFrac.numerator;
  int den2 = myFrac.denominator;
  int newNum = num1 * den2 - num2 * den1;
  int newDen = den1 * den2;
  return fractionType(newNum, newDen);
}
fractionType fractionType::operator*(const fractionType& myFrac) const
{ 
  int newNum = numerator * myFrac.numerator;
  int newDen = denominator * myFrac.denominator;
  return fractionType(newNum, newDen); 
}
fractionType fractionType::operator/(const fractionType& myFrac) const
{
  if (myFrac.denominator == 0)
    {
      return fractionType(numerator,denominator);
    }
  else if (myFrac.numerator == 0)
    {
      return fractionType(numerator, denominator);
    }
  else
    {
      fractionType result;
      result.numerator = numerator * myFrac.denominator;
      result.denominator = denominator * myFrac.numerator;
      return result;
    }
}
fractionType fractionType::operator ++()
{
  numerator += denominator; 
  return *this; 
}
fractionType fractionType::operator ++(int u)
{
  fractionType temp = *this;
  ++*this;
  return temp; 
}
fractionType fractionType::operator --()
{
  numerator -= denominator; 
  return *this; 
}
fractionType fractionType::operator--(int u)
{
  fractionType temp = *this;
  --*this;
  return temp; 
}
#endif
