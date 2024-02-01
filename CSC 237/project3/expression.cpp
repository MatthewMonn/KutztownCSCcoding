/**************************************************************/
/*   Author:            Matthew Monn                          */
/*   Creation Date:     October 12, 2023                      */
/*   Due Date:          October 18, 2023                      */
/*   Course:            CSC 237                               */
/*   Professor Name:    Dr. Zhang                             */
/*   Assignment:        #3                                    */
/*   Filename:          expression.cpp                        */
/*   Purpose:           To implement the token.h file with    */
/*                      the two functions provided. Converts  */
/*                      the infix to postfix and to           */
/*                      evaluate postfix expressions.         */ 
/**************************************************************/

#include <iostream>
#include <stack>
#include <vector>
#include "Token.h"

using namespace std;

double evaluatePostfix(vector<Token> tokens);
vector<Token> infixToPostfix(vector<Token> tokens);

double evaluatePostfix(vector<Token> tokens) 
{
  stack<double> Stacks; // stack of double used to implement. 
  for (int i = 0; i < tokens.size(); i++) //iterates through the vector. 
    {
      if (tokens[i].tag == OPERAND) 
	Stacks.push(tokens[i].d); //pushes in the the numeric value into the stack if OPERAND.
      else if (tokens[i].tag == OPERATOR)
	{
	  double o2 = Stacks.top(); //takes the top value of the stack and stores in o2. 
	  Stacks.pop();
	  double o1 = Stacks.top(); //after pop, takes the next value in stack into o1. 
	  Stacks.pop();
	  
	  if (tokens[i].o == ADD) //runs through the cases of operators in a nested loop.
	    Stacks.push(o1 + o2); 
	  else if (tokens[i].o == SUBTRACT) 
	    Stacks.push(o1 - o2);
	  else if (tokens[i].o == MULTIPLY)
	    Stacks.push(o1 * o2);
	  else if (tokens[i].o == DIVIDE)
	    Stacks.push(o1 / o2); //stores each into stack if case runs. 
	  
        }
    }
  if (Stacks.size() == 1) 
    {
      return Stacks.top(); //final result will be at the top of the stack.
    } 
  return 0;
}

vector<Token> infixToPostfix(vector<Token> tokens) 
{
  vector<Token> result;
  stack<Token> Stacks;
  
  for (int i = 0; i < tokens.size(); i++) //iterates through the vector size.  
    {
      if (tokens[i].tag == OPERAND) //case for OPERAND
	result.push_back(tokens[i]); //push_back if the token tag is OPERAND.
      else if (tokens[i].tag == OPERATOR) //case for OPERATOR.
        {
	  while (!Stacks.empty() && Stacks.top().tag == OPERATOR && Precedence_o(Stacks.top().o) >= Precedence_o(tokens[i].o)) 
            { //checks for all cases of OPERATOR using the precedence function to evaluate the rules of infix to postfix correctly. 
	      result.push_back(Stacks.top()); //stores result into vector 
	      Stacks.pop(); 
            }
	  Stacks.push(tokens[i]); //pushes another token in for evaluation. 
        } 
      else if (tokens[i].tag == LPAREN) //case for left parenthesis.
        {
	  Stacks.push(tokens[i]); //pushes into the stack.
        } 
      else if (tokens[i].tag == RPAREN) //case for right parenthesis.
        {
	  while (!Stacks.empty() && Stacks.top().tag != LPAREN) //checks if it's not empty and top doesn't contain LPAREN.
            {
	      result.push_back(Stacks.top()); //push_back values into vector. 
	      Stacks.pop();
            }
	  if (!Stacks.empty())
	    Stacks.pop();  // Pop the LPAREN.
        }
    }
  while (!Stacks.empty()) //fully empties the stack after all evaluation.
    {
      result.push_back(Stacks.top());
      Stacks.pop();
    }
  return result; //returns the vector for output.
}

int Precedence_o(Operator a) 
{
  if (a == MULTIPLY || a == DIVIDE)
    return 3;  // Higher precedence for MULTIPLY and DIVIDE.
  else if (a == ADD || a == SUBTRACT)
    return 2; //lower precedence for ADD and SUBTRACT.
  return 0;  // Default precedence for unknown operators
}

