#define CATCH_CONFIG_MAIN  

#include <string>
#include "/export/home/public/zhang/catch.hpp"
#include "bookType.h"


TEST_CASE("test case 1") {

  bookType b1;

  string title = "Fuzzy Discrete Structures";
  string isbn = "3-7908-1335-4";
  string publisher = "Physica-Verlag";
  int year = 2000;
  double price = 89.0;
  int quantity = 1;
  int noOfAuthor = 4;
  string auth[4] = {"Malik, Davender", "Mordeson, John", "Turing, Alan", "Adam, Smith"};

  b1.setBookInfo(title, isbn, publisher, year, auth, price, quantity, noOfAuthor);

  REQUIRE(b1.isISBN("3-7908-1335-4") == true);
  REQUIRE(b1.isISBN("3-7908-1335-3") == false);

  REQUIRE(b1.isTitle("Fuzzy Discrete Structures") == true);
  REQUIRE(b1.isTitle("Fuzzy Discrete ") == false);
  
  REQUIRE(b1.isAuthor("Malik, Davender") == true);
  REQUIRE(b1.isAuthor("Mordeson, John") == true);
  REQUIRE(b1.isAuthor("Turing, Alan") == true);
  REQUIRE(b1.isAuthor("Adam, Smith") == true);
  REQUIRE(b1.isAuthor("Foo, Bar") == false);

  
  REQUIRE(b1.isInStock() == true);
  b1.makeSale();
  REQUIRE(b1.isInStock() == false);

}

TEST_CASE("test case 2") {

  bookType b1;

  string title = "Fuzzy Discrete Structures";
  string isbn = "3-7908-1335-4";
  string publisher = "Physica-Verlag";
  int year = 2000;
  double price = 89.0;
  int quantity = 1;
  int noOfAuthor = 1;
  string auth[4] = {"Malik, Davender"};

  b1.setBookInfo(title, isbn, publisher, year, auth, price, quantity, noOfAuthor);

  REQUIRE(b1.isISBN("3-7908-1335-4") == true);
  REQUIRE(b1.isISBN("3-7908-1335-3") == false);

  REQUIRE(b1.isTitle("Fuzzy Discrete Structures") == true);
  REQUIRE(b1.isTitle("Fuzzy Discrete ") == false);

  REQUIRE(b1.isAuthor("Malik, Davender") == true);
  REQUIRE(b1.isAuthor("Mordeson, John") == false);
  REQUIRE(b1.isAuthor("Turing, Alan") == false);
  REQUIRE(b1.isAuthor("Adam, Smith") == false);

}




TEST_CASE( "test case 3" ) {
  bookType b2;
  string t2;
  b2.setBookTitle("Fuzzy Discrete Structures");
  b2.getBookTitle(t2);
  REQUIRE( t2 == "Fuzzy Discrete Structures" );

  b2.setBookISBN("3-7908-1335-4");
  b2.getBookISBN(t2);
  REQUIRE(t2 == "3-7908-1335-4");

  b2.setBookPrice(89.5);
  REQUIRE(b2.getBookPrice()==89.5);
}
