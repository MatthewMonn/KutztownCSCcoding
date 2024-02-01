#include <iostream>
#include <iomanip>
#include <string>
#include <cmath>
using namespace std;

/*
int main()
{
  int alpha[8];

  for(int i = 0; i < 4; i++)
    {
      alpha[i] = i * (i + 1);
      if ( i % 2 == 0)
	alpha[4 + i] = alpha[i] + i;
      else if (i % 3 == 0)
	alpha [4 + i] = alpha[i] - i;
      else if (i > 0)
	alpha [4 + i] = alpha[i] - alpha[i - 1];
    }
  for (int i = 0; i < 8; i++)
    cout << alpha[i] << " ";
  cout<< endl; 
}
*/
int main()
{  
  int mystery(int num1, int num2)
  {
    if (num1 > 0)
      {
	for (int i = 1; i <= num1; i++)
	  num2 = num2 * i;
	return num2;
      }
    else if (num2 > 0)
      {
	for (int i = 0; i <= num2; i++)
	  num1 = num1 + i;
	return num1;
      }
    return 0;
    cout << mystery(4,-5) << endl; 
  }
