   
//This program shows how to use the class template listType.

#include <iostream>                                 //Line 1
                    
#include "myString.h"                               //Line 2
#include "listType.h"                               //Line 3
  
using namespace std;                                //Line 4

int main()                                          //Line 5
{                                                   //Line 6
    listType<int> intList(100);                     //Line 7
    listType<newString> stringList;                 //Line 8

    int index;                                      //Line 9
    int number;                                     //Line 10

    cout << "List 11: Processing the integer list"
         << endl;                                   //Line 11
    cout << "List 12: Enter 5 integers: ";          //Line 12
                                 
    for (index = 0; index < 5; index++)             //Line 13
    {                                               //Line 14
        cin >> number;                              //Line 15
        intList.insertAt(number, index);            //Line 16
    }                                               //Line 17

    cout << endl;                                   //Line 18
    cout << "List 19: intList: ";                   //Line 19
    intList.print();                                //Line 20
    cout << endl;                                   //Line 21

       //Sort intList
    intList.sort();                                 //Line 22

    cout << "Line 23: After sorting, intList: ";    //Line 23
    intList.print();                                //Line 24
    cout << endl;                                   //Line 25

    newString str;                                  //Line 26

    cout << "Line 27: Processing the string list"
         << endl;                                   //Line 27

    cout << "Line 28: Enter 5 strings: ";           //Line 28

    for (index = 0; index < 5; index++)             //Line 29
    {                                               //Line 30
        cin >> str;                                 //Line 31
        stringList.insertAt(str, index);            //Line 32
    }                                               //Line 33

    cout << endl;                                   //Line 34
    cout << "Line 35: stringList: ";                //Line 35
    stringList.print();                             //Line 36
    cout << endl;                                   //Line 37

      //Sort stringList
    stringList.sort();                              //Line 38

    cout << "Line 39: After sorting, stringList: "; //Line 39
    stringList.print();                             //Line 40
    cout << endl;                                   //Line 41
    
    int intListSize;                                //Line 42

    cout << "Line 43: Enter the size of the integer "
         << "list: ";                               //Line 43
    cin >> intListSize;                             //Line 44
    cout << endl;                                   //Line 45
   
    listType<int> intList2(intListSize);            //Line 46

    cout << "Line 47: Processing the integer list"
         << endl;                                   //Line 47
    cout << "Line 48: Enter " << intListSize
         << " integers: ";                          //Line 48

    for (index = 0; index < intListSize; index++)   //Line 49
    {                                               //Line 50
        cin >> number;                              //Line 51
        intList2.insertAt(number, index);           //Line 52
    }                                               //Line 53

    cout << endl;                                   //Line 54

    cout << "Line 55: intList2: ";                  //Line 55
    intList2.print();                               //Line 56
    cout << endl;                                   //Line 57
 
      //Sort intList2
    intList2.sort();                                //Line 58

    cout << "Line 59: After sorting, intList2: ";   //Line 59
    intList2.print();                               //Line 60
    cout << endl;                                   //Line 61

    cout << "Line 62: Length of intList2: "
         << intList2.getLength() << endl;           //Line 62
    cout << "Line 63: Maximum size of intList2: "
         << intList2.getMaxSize() << endl;          //Line 63

    return 0;                                       //Line 64
}                                                   //Line 65
