/************************************************************/
/*   Author:            Matthew Monn                         */
/*   Major:             Computer Science                     */
/*   Creation Date:     December 1, 2022                     */
/*   Due Date:          December 8, 2022                     */
/*   Course:            CSC 135 010                          */
/*   Professor Name:    Dr. Zhang                            */
/*   Assignment:        #6                                   */
/*   Filename:          project6_MatthewMonn.cpp             */
/*   Purpose:           To use two char arrays that implement*/ 
/*                      the encryption and decryption process*/
/*                      of the Caesar Cipher.                */
/*                                                           */
/*                                                           */
/*                                                           */
/*************************************************************/

#include <iostream>
#include <iomanip>
#include <string>
#include <cmath>
using namespace std;

void encrypt(char plaintext[], char ciphertext[], int key, int size); //function prototypes. 
void decrypt(char plaintext[], char ciphertext[], int key, int size);

int main()
{
  char plaintext[100]; //both the plain and cipher text arrays are size 100. 
  char ciphertext[100];
  char letter; 
  int num = 0, size = 0, key = 0;
  
  
  cout << "Enter your choice (1: Encryption 2: Decryption): "; 
  cin >> num; //user inputs 1 or 2 to set up the process of encrypt or decrypt. 
  
  if ( num == 1) //encrypt, plain text. 
    {
      cout << "Enter plain text: ";
    }
  else if (num == 2) //decrypt, cipher text. 
    {
      cout << "Enter cipher text: ";
    }
  else
    {
      cout << "Enter a valid number. " << endl; //misclick a 3 for example, and it outprints an error. 
    }
  
  cin.ignore(); //ignores the amount of characters you specify when you call it, up to the char you specify as a breakpoint.
  if (num == 1) //encrypt. 
    {
      for (int i = 0; i < 100; i++) 
	{
	  cin.get(letter); //pulls each letter into the array, each char at a time up to 100 spaces. 
	  plaintext[i] = letter; 
	  size++; //counter for array size. 
	  if ( letter == '\n')
	    break; //ends input if the user hit enter or return. 
	  else
	    continue;  
	}
    }
  else
    {
      for (int i = 0; i < 100; i++) //decrypt 
	{
	  cin.get(letter); //same process as above but for decrypt, enters in ciphertext array instead of plaintext. 
	  ciphertext[i] = letter;
	  size++;
	  
	  if ( letter == '\n')
	    break;
	  else
	    continue;
	}
    }
  cout << "Enter key [1-25]: "; //dictates how many spaces the casear cipher will take from the letters. 
  cin >> key;
  cout << endl; 
  
  if (num == 1) //encrypt goes to encrypt function. 
    {
      encrypt(plaintext, ciphertext, key, size);
    }
  else if (num == 2) //decrypt goes to decrypt function. 
    {
      decrypt( plaintext, ciphertext, key, size);
    }
  else
    cout << "Enter a valid number." << endl; //error message if 1 or 2 isnt entered.    
}

/********************************************************************/
/*   Function name:       encrypt                                   */
/*   Description:         takes in the plaintext array and encrypts */
/*                        it to the ciphertext array through the    */
/*                        equation provided, using the ascii table. */
/*                        outprints the ciphertext of encryption.   */
/*   Parameters:          char plaintext[]: array for encryption or */
/*                        english sentence. char ciphertext[]:      */
/*                        decrypt array for outprint. int key:      */
/*                        determines how many spaces between the    */
/*                        characters. int size: counter for size of */
/*                        the array.                                */
/*   Return Value:        none, void function.                      */
/********************************************************************/

void encrypt(char plaintext[], char ciphertext[], int key, int size) 
{
  for (int i = 0; i < size; i++) 
    {
      if (plaintext[i] == ' ') // if blank space is read, still is inputted. 
	{
	  ciphertext[i] = plaintext[i];
	}
      else if (plaintext[i] == '\n')
	{
	  ciphertext[i] = plaintext[i]; //enters the return in cipher as its counted still. 
	  break; 
	}
      else
	{
	  ciphertext[i] = ((plaintext[i] - 97 + key) % 26) + 65; //equation for encryption from changing to letters to ascii table association with key to space correctly. 
	}
    }
  cout << "Ciphertext: ";
  for (int h = 0; h < size; h++)
    {
      cout << ciphertext[h]; //outprints the encrption of the sentence entered in plaintext to ciphertext array. 
    }  
}

/********************************************************************/
/*   Function name:       decrypt                                   */
/*   Description:         takes in the ciphertext array for decrypt */
/*                        process and stores in plaintext array     */
/*                        after equation is applied using ascii     */
/*                        table to  characters. outprints the       */
/*                        decryption of the encryption.             */ 
/*   Parameters:          char plaintext[]: array for encryption or */
/*                        english sentence. char ciphertext[]:      */
/*                        decrypt array for outprint. int key:      */
/*                        determines how many spaces between the    */
/*                        characters. int size: counter for size of */
/*                        the array.                                */
/*   Return Value:        none, void function.                      */
/********************************************************************/


void decrypt(char plaintext[], char ciphertext[], int key, int size)
{
  for (int i = 0; i < size; i++)
    { 
      if (ciphertext[i] == ' ')
        {
          plaintext[i] = ciphertext[i]; // blank space still inputted for decryption. 
        }
      else if (ciphertext[i] == '\n')
        {
          plaintext[i] = ciphertext[i]; //return still entered in the array as counted as char. 
	  break; 
        }
      else
        {
          plaintext[i] = ((ciphertext[i] - 65 - key + 26) % 26) + 97; //equation to change the encryption to actual english sentence, switching from char to ascii to char. 
        }
    }
  cout << "Ciphertext: ";
  for (int k = 0; k < size; k++)
    {
      cout << plaintext[k]; //outprints the decrypted message by each char. 
    } 
}

