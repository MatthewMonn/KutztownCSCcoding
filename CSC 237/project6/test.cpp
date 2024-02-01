#include <iostream>
#include <iomanip>
#include "QuadraticProbing.h"
#include <string>
using namespace std;

// Simple main
int main( )
{
  HashTable<int> table1; //create an int hash table
  HashTable<string> table2; //create a string hash table
  cout << left;
  
  //insert 50 integers to table1
  cout << "Insert 50 integers into Table 1\n";
  for(int i = 1000; i <= 1050; i++ )
        table1.insert( i );

  //try searching for values in table1

  cout << setw(25) << "Contains 1025:" <<  boolalpha << table1.contains(1025) << endl;
  cout << setw(25) << "Contains 1055:" <<  boolalpha << table1.contains(1055) << endl;

  cout << endl << endl;
  
  //insert some strings to table2
  cout << "Insert \"hello\" and \"world\" into table 2\n";
  table2.insert("hello");
  table2.insert("world");

  //try searching for values in table2
  cout << setw(25) << "Contains \"hello\":" <<  boolalpha << table2.contains("hello") << endl;
  cout << setw(25) << "Contains \"World\":" <<  boolalpha << table2.contains("World") << endl;

   cout << endl << endl;
  //remove a value from table2
  cout << "Delete \"hello\" from table 2\n";
  table2.remove("hello");
  cout << setw(25) << "Contains \"hello\":" <<  boolalpha << table2.contains("hello") << endl;

  return 0;
}
