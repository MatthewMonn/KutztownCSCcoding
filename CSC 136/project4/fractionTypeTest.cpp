#include <iostream>
#include <iomanip> 
#include "fractionType.h"
 
using namespace std; 

int main()
{
    cout << fixed;          
    cout << showpoint;      
    cout << setprecision(2);

    cout << "###Testing constructor###\n";   
    fractionType num1(20, 26);
    cout << "Num1 = " << num1 << endl;
    
    fractionType num2(-8, 10);      
    cout << "Num2 = " << num2 << endl;

    fractionType num3(5, 0);
    cout << "Num3 = " << num3 << endl;
    
    fractionType num4;
    cout << "Num4 = " << num4 << endl;

    
    cout << "\n###Testing Stream Extraction operator###\n";
    cout << "Enter the fraction in the form a / b: "; 
    cin >> num3;
    cout << "Num3 = " << num3 << endl;
    cout << endl;


    cout << "Enter the fraction in the form a / b: ";
    cin >> num4;
    cout << "Num4 = " << num4 << endl;
    cout << endl;
    
    cout << "\n###Testing + and ++ operators###\n";
    num3 = num1 + num2++; 

    cout << "Num2 = " << num2 << endl;
    cout << "Num3 = " << num3 << endl;

    cout << "\n###Testing * and -- operators###\n";
    num4 = num1 * --num2;
    cout << "Num2 = " << num2 << endl;
    cout << "Num4 = " << num4 << endl;
    

    return 0;	
}
