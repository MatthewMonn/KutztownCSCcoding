#include <iostream>
#include <stdexcept>
#include <vector>
#include <stack>
#include "Token.h"
#include "expression.cpp"

using namespace std;

//function prototypes
void printPostfix(vector<Token> tokens);


int main(int argc, char **argv) {

  bool debug = false; //debugging flag
  bool test = false;  //testing flag, suppress output
  int choice;
  
  //check to see if -g and -t are set
  if (argc == 2 && string(argv[1]) == "-g")
    debug = true;
  else if (argc == 2 && string(argv[1]) == "-t")
    test = true;
  
  //print menu
  if (!test)
    {
      cout << "1. Evaluate Postfix\n";
      cout << "2. Convert Infix to Postfix\n";
      cout << "3. Evaluate Infix\n";
    
      cout << endl;
      cout << "Enter your choice [1-3]: ";
    }

  //read user choice
  cin >> choice;
  cin.get(); //get rid of the \n character

  
  if (choice == 1)
    {
      //evaluate postfix expression 
      string expression;
      if (!test)
	cout << "Enter postfix expression: ";
      getline(cin, expression);
      vector<Token> tokens = tokenize(expression);

      //if debug is true, print out the token sequence
      if (debug)
	{
	  cout << endl;
	  for (int i = 0; i < tokens.size(); i++) {
	    cout << tokens[i];
	  }
	}
      
      //calling evaluatePostfix() function
      cout << "Result: " << evaluatePostfix(tokens) << endl;
    }
  
  else if (choice == 2)
    {
      //convert postfix to infix
      string expression;
      if (!test)
	cout << "Enter infix expression: ";
      getline(cin, expression);
      vector<Token> tokens = tokenize(expression);

      //if debug is true, print out the token sequence      
      if (debug)
	{
          cout << endl;
          for (int i = 0; i < tokens.size(); i++) {
            cout << tokens[i];
          }
        }

      //calling infixToPostfix() function
      vector<Token> postfix = infixToPostfix(tokens);
      cout << "Postfix: ";

      //print the postfix vector
      printPostfix(postfix);
      cout << endl;
    }
  else if (choice == 3)
    {
      //evaluate postfix
      string expression;
      if (!test)
	cout << "Enter infix expression: ";
      getline(cin, expression);
      vector<Token> tokens = tokenize(expression);

      //if debug is true, print out the token sequence
      if (debug)
        {
          cout << endl;
          for (int i = 0; i < tokens.size(); i++) {
            cout << tokens[i];
          }
        }

      //calling both functions
      cout << "Result: " << evaluatePostfix(infixToPostfix(tokens)) << endl;

    }
}


//print the vector that contains the postfix expression
void printPostfix(vector<Token> tokens)
{
      for (int i=0; i < tokens.size(); i++)
        {
          if (tokens[i].tag == OPERATOR)
            {
              if (tokens[i].o == ADD)
                cout << "+ ";
              else if (tokens[i].o == SUBTRACT)
                cout << "- ";
              else if (tokens[i].o == MULTIPLY)
                cout << "* ";
              else if (tokens[i].o == DIVIDE)
                cout << "/ ";
            }
          else if (tokens[i].tag == OPERAND)
            cout << tokens[i].d << " ";
          else
            cout << "error ";
        }

}
			


