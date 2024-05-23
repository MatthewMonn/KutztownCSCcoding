**The Abstract Data Type Stack**
* Operations on a stack  
	– Last-in, First-out (LIFO)
	![[Pasted image 20231030103330.png]]

**Developing an ADT During the Design of a Solution**
* Consider typing a line of text on a keyboard  
	– Use of backspace key to make corrections  
	– You type  
	![[Pasted image 20231030103409.png]]
	
	– Corrected input will be  
	![[Pasted image 20231030103422.png]]
* Must decide how to store the input line.
![[Pasted image 20231030103447.png]]  
* Initial draft of solution.  
* Two required operations  
	‒ Add new item to ADT  
	‒ Remove item added most recently
![[Pasted image 20231030103532.png]]
* Read and correct algorithm.  
* Third operation required  
	‒ See whether ADT is empty

**Specifications for the ADT Stack**
![[Pasted image 20231030103605.png]]

* Axioms for multiplication
	![[Pasted image 20231030103631.png]]

* Axioms for ADT stack
	![[Pasted image 20231030103657.png]]
![[Pasted image 20231030103705.png]]
![[Pasted image 20231030103712.png]]

**Checking for Balanced Braces**
* Example of curly braces in C++ language  
	– Balanced  
	![[Pasted image 20231030103926.png]]
	– Not balanced  
	![[Pasted image 20231030103940.png]]
* Requirements for balanced braces  
	– For each }, must match an already encountered {  
	– At end of string, must have matched each {
![[Pasted image 20231030104004.png]]
![[Pasted image 20231030104012.png]]
![[Pasted image 20231030104018.png]]
![[Pasted image 20231030104038.png]]
**Recognizing Strings in a Language**
* Given a definition of a language L  
	– Special palindromes  
	– Special middle character $  
	– Example  
* ABC$CBA is a member of L  
* AB$AB is not a member of L
* Use a stack  
	– Traverse first half of string  
	– Push each character onto stack  
	– Reach $, undo, pop character, match or not
![[Pasted image 20231030104146.png]]
![[Pasted image 20231030104155.png]]

**Palindrome without $**
* How to recognize a palindrome without the special character?
**Using Stacks with Algebraic Expressions**
* Strategy  
	– Develop algorithm to evaluate postfix  
	– Develop algorithm to transform infix to postfix  
* These give us capability to evaluate infix expressions  
	– This strategy easier than directly evaluating infix  expression

**Evaluating Postfix Expressions**
* Infix expression 2 * (3 + 4)  
* Equivalent postfix 2 3 4 + *  
* Assumptions  
	– Given string is correct postfix  
	– No unary, no exponentiation operators  
	– Operands are single lowercase letters, integers
![[Pasted image 20231030104342.png]]
![[Pasted image 20231030104356.png]]

**Infix to Postfix**  
* Important facts  
	– Operands always stay in same order with respect to one another.  
	– Operator will move only “to the right” with respect to the operands;  
	– All parentheses are removed.
![[Pasted image 20231030104605.png]]
* Determining where to place operators in postfix expression  
	– Parentheses  
	– Operator precedence  
	– Left-to-right association  
* Note difficulty  
	– Infix expression not always fully parenthesized  
	– Precedence and left-to-right association also affect results
![[Pasted image 20231030131333.png]]
![[Pasted image 20231030131344.png]]
![[Pasted image 20231030131353.png]]
![[Pasted image 20231030131402.png]]

**Exhaustive search using Recursion**
![[Pasted image 20231030131420.png]]
![[Pasted image 20231030131431.png]]

* Possible outcomes  
	1. Reach destination  city  
	2. Reach a dead end  
	3. Go around in circles  
* Use a stack to backtrack
![[Pasted image 20231030131523.png]]
**Using Stack to Search a Flight Map**
* Origin city at bottom  
* Current visited city at top  
* When to backtrack  
	– No flights out of current city  
	– All flight out of current city already visited

**Stack Simulation**
![[Pasted image 20231030131633.png]]
![[Pasted image 20231030131643.png]]
![[Pasted image 20231030131649.png]]

**Depth First Search (backtrack)**
* Traverse graph with DFS  
* DFS Using recursion
	![[Pasted image 20231030131738.png]]
	![[Pasted image 20231030131744.png]]
![[Pasted image 20231030131754.png]]

**Next Lecture**
[[Lecture 9 Implementation of ADT Stack]]
