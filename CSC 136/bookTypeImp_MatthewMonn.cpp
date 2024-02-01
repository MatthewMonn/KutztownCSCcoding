#include <string>
#include <iostream>
#include "bookType.h"

using namespace std;

bookType::bookType()
{
  bookTitle = "";
  bookISBN = "";
  bookPublisher = "";
  bookPublishYear = 0;
  price = 0;
  quantity = 0;
  noOfAuthors = 0;
  for (int i = 0; i < 4; i++)
    {
      authors[i] = " ";
    }
}
void bookType::setBookInfo(string title, string ISBN, string Publisher, int PublishYear, string auth[], double cost, int copies, int noAuthors)
{
  bookTitle = title;
  bookISBN = ISBN; 
  bookPublisher = Publisher;
  bookPublishYear = PublishYear;
   price = cost;
  quantity = copies;
  noOfAuthors = noAuthors;
  for (int i = 0; i < noOfAuthors; i++)
    {
      authors[i] = auth[i];
    }
}
void bookType::setBookTitle(string s)
{
  bookTitle = s; 
  
}

void bookType::setBookISBN(string s)
{
  bookISBN = s; 
}
void bookType::setBookPrice(double cost)
{
  price = cost;   
}

void bookType::setCopiesInStock(int noOfCopies)
{
  quantity = noOfCopies;   
}

void bookType:: printInfo() const
{
  cout << "Title: " << bookTitle << endl;
  cout << "ISBN: " << bookISBN << endl;
  cout << "Publisher: " << bookPublisher << endl;
  cout << "Year of Publication: " << bookPublishYear << endl;
  cout << "Number of Authors: " << noOfAuthors << endl;
  cout << "Authors: "; 
  for (int i = 0; i < noOfAuthors; i++)
    {
      cout << authors[i] << "; "; 
    }
  cout << endl << "Price: " << price << endl;
  cout << "Quantities in stock: " << quantity << endl;
  
}
bool bookType::isISBN(string s) const
{
  if (s == bookISBN)
    return true;
  else
    return false; 
}

bool bookType::isTitle(string s) const
{
  if (s == bookTitle)
    return true;
  else
    return false; 
}

bool bookType::isAuthor(string s) const
{
  for (int i = 0; i < noOfAuthors; i++)
    {
      if (s == authors[i])
	return true; 
    }
  return false; 
}
void bookType:: getBookTitle(string& s) const
{
  s = bookTitle; 
}

void bookType::getBookISBN(string& s) const
{
  s = bookISBN; 
}
double bookType::getBookPrice() const
{
  return price; 
}

bool bookType::isInStock() const
{
  if (quantity > 0)
    return true;
  else
    return false; 
}

void bookType::makeSale()
{
  quantity = quantity - 1;
}
void bookType::printBookPrice() const
{
  cout << "Price: " << getBookPrice() << endl; 
}
void bookType::printbookTitle() const
{
  cout << "Title: " << bookTitle << endl;
}

void bookType::printbookTitleAndISBN() const
{
   
  cout << "Title: " << bookTitle << "; ";
  cout << "ISBN: " <<  bookISBN << endl;
}
void bookType::showQuantityInStock() const
{
  cout << "Quantities in stock: " << quantity << endl; 
}

void bookType::updateQuantity(int addBooks)
{
  quantity += addBooks; 
}
