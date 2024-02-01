  
#include <iostream>                                 //Line 1

#include "classAssignmentOverload.h"                //Line 2

using namespace std;                                //Line 3
  
int main()                                          //Line 4
{                                                   //Line 5
    cAssignmentOprOverload intList1(10);            //Line 6
    cAssignmentOprOverload intList2;                //Line 7
    cAssignmentOprOverload intList3;                //Line 8

    int number;                                     //Line 9

    cout << "Line 10: Enter 5 integers: ";          //Line 10

    for (int i = 0; i < 5; i++)                     //Line 11
    {                                               //Line 12
        cin >> number;                              //Line 13
        intList1.insertEnd(number);                 //Line 14
    }                                               //Line 15

    cout << endl;                                   //Line 16
    cout << "Line 17: intList1: ";                  //Line 17
    intList1.print();                               //Line 18

    intList3 = intList2 = intList1;                 //Line 19

    cout << "Line 20: intList2: ";                  //Line 20
    intList2.print();                               //Line 21

    intList2.destroyList();                         //Line 22

    cout << endl;                                   //Line 23
    cout << "Line 24: intList2: ";                  //Line 24
    intList2.print();                               //Line 25

    cout << "Line 26: After destroying intList2, "
         << "intList1: ";                           //Line 26
    intList1.print();                               //Line 27

    cout << "Line 28: After destroying intList2, "
         << "intList3: ";                           //Line 28
    intList3.print();                               //Line 29
    cout << endl;                                   //Line 30

    return 0;                                       //Line 31
}                                                   //Line 32

