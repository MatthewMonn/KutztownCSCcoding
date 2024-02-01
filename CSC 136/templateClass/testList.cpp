   
#include <iostream>
                    
#include "listType.h"
  
using namespace std; 

int main()           
{                    
    listType<int> intList(100);

    int index;                 

    //insert five integers
    intList.insertAt(10, 0);
    intList.insertAt(-5, 1);
    intList.insertAt(20, 2);
    intList.insertAt(13, 3);
    intList.insertAt(-8, 4);
                               
    cout << endl;              

    intList.print();
    
        
    cout << "Search for 20: \n";
    index = intList.search(20);
    if (index != -1)
      cout << "It is at position " << index << endl;
    else
      cout << "It is not in the list.\n";

    cout << "Remove the second item.\n";
    intList.removeAt(2);
    cout << "After removal: ";
    intList.print();
    

    //do the same testing for array type

    listType<string> strList(100);


    //insert five strings
    strList.insertAt("hello", 0);
    strList.insertAt("welcome", 1);
    strList.insertAt("csc136", 2);
    strList.insertAt("kutztown", 3);
    strList.insertAt("computer", 4);

    cout << endl;

    strList.print();

    
    cout << "Search for csc136: \n";
    index = strList.search("csc136");
    if (index != -1)
      cout << "It is at position " << index << endl;
    else
      cout << "It is not in the list.\n";

    cout << "Remove the second item.\n";
    strList.removeAt(2);
    cout << "After removal: ";
    strList.print();
    


    return 0;
}            