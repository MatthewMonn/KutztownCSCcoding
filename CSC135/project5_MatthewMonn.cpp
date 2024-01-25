/************************************************************/
/*   Author:            Matthew Monn                        */
/*   Major:             Computer Science                    */
/*   Creation Date:     November 21, 2022                   */
/*   Due Date:          December 1, 2022                    */
/*   Course:            CSC 135 010                         */
/*   Professor Name:    Dr. Zhang                           */
/*   Assignment:        #5                                  */
/*   Filename:          project5_MatthewMonn.cpp            */
/*   Purpose:           To calculate and outprint the       */
/*                      average rating, average reviews,    */
/*                      number of movies made in the US,    */
/*                      moviw with highest rating, and movie*/
/*                      with the most reviews. The data is  */
/*                      stored and pulled from a .csv file. */
/************************************************************/



#include <iostream>
#include <iomanip>
#include <string>
#include <cmath>
#include <fstream> 
using namespace std;

int main()
{
  ifstream fp; 
  string title, director, country, earning, rating, reviews, line; 
  float ratingTotal, reviewTotal, h_earning = 0, earningTotal, h_reviews = 0;     
  float sum = 0, sum2 = 0, sum3 = 0;  
  int counter = 0, pcounter = 0, jcounter = 0, kcounter = 0, reviewAver, totalUS;
  string h_title = "",  h_title2 = ""; 
  cout << setprecision(2) << fixed;
  fp.open("movie.csv"); //opens the file

  if(!fp) // if file doesn't open, it will show error. 
    {
      cout << "Error opening file" << endl;
      return 0;
    }
  getline(fp,line); //clears the first line declaring what each word stands for between the commas. 
  while (getline(fp, title, ',')) //while the movie title/ first word is there, it will pull all the other info from the file per comma, per line. 
    {
      getline(fp, director, ',');
      getline(fp, country, ',');
      getline(fp, earning, ',');
      getline(fp, rating, ',');
      getline(fp, reviews);

      ratingTotal = stof(rating); //finds the total rating from each line by adding each rating together and storing in ratingTotal varaible. 
      sum += ratingTotal;
      counter ++;
      
      reviewTotal = stof(reviews); // finds the total reviews by adding each line together. 
      sum2 += reviewTotal;
      pcounter ++;

      if (country == "United States") //using if statement and counter for every time United States is read into the while loop. 
	{
	  jcounter ++; 
	}
   
      if (stof(earning) > h_earning) // to find the highest rating, it inputs a new earning each line and sets it equal to h_earning variable if earning is greater. 
	{
	  h_earning = stof(earning); 
	  h_title = title; //to find the highest title with the highest earning for output. 
	} 
      if (stof(reviews) > h_reviews) //same as the if statement above, just with highest reviews. 
	{
	  h_reviews = stof(reviews);
	  h_title2 = title; 
	}
    }
  reviewAver = sum2 / pcounter; // to find the average number of reviews, it takes pcounter which is total amount of movies and sum2 which is the total amount of reviews from earlier equation and divides them for average.  
  
  cout << setw(45) << left << "The average rating: " << sum/counter << endl;
  cout << setw(45) << left << "The average number of reviews: " << reviewAver << endl;
  cout << setw(45) << left << "The number of movies made from the US: " << jcounter << endl;
  cout << setw(45) << left << "The movie with highest earning: " << h_title << endl;
  cout << setw(45) << left << "The movie with most reviews: " << h_title2 << endl;
  
  fp.close(); //closes the file 
}
