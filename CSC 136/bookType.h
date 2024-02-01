#include <string>
using namespace std; 
 
class bookType 
{
public:
  //set the values, auth[] is an author array, noAuthors is the number
  //of authors
  void setBookInfo(string title, string ISBN, string Publisher, \
		   int PublishYear, string auth[], double cost, \
		   int copies,int noAuthors);

  //set title to s
  void setBookTitle(string s);

  //set ISBN to s
  void setBookISBN(string s);

  //set price to cost
  void setBookPrice(double cost);

  //set quantity to noOfCopies
  void setCopiesInStock(int noOfCopies);

  //print the object information
  void printInfo() const;

  //return true if s is equal to ISBN
  bool isISBN(string s) const;

  //return true if s is equal to title
  bool isTitle(string s) const;

  //return true if s is one of the authors
  bool isAuthor(string s) const;

  //assign book title to s
  void getBookTitle(string& s) const;

  //assign ISBN to s
  void getBookISBN(string& s) const;

  //return book price
  double getBookPrice() const;

  //return true if quantity is > 0
  bool isInStock() const;

  //made a sale, decrease quantity by 1
  void makeSale();

  //print book price 
  void printBookPrice() const;

  //print book title
  void printbookTitle() const;

  //print title and ISBN
  void printbookTitleAndISBN() const;

  //print quantity
  void showQuantityInStock() const;

  //add addBooks to quantity
  void updateQuantity(int addBooks);

  //default constructor, set everything to default values
  bookType();

private:
    string bookTitle;
    string bookISBN;
    string bookPublisher;

    int bookPublishYear;
    string authors[4];

    double price;
    int quantity;

    int noOfAuthors;
};
