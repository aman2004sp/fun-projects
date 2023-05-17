#include<stdio.h>
#include<stdlib.h>
#include<time.h>

 int
main ()
{
  
int number, guess, nguess = 1;
  
srand (time (0));
  
number = rand () % 100 + 1;
  
// printf("the number is %d\n",number);
    do
    {
      printf ("guess a number between 1 to 100:");
      
scanf ("%d", &guess);
      
 
if (guess < number)
	{
	  
printf ("enter a bigger number\n");
	
}
      
      else if (guess > number)
	{
	  
printf ("enter a smalller number\n");
	}
      
      else
	(printf ("you guessed it correct in  %d guesses\n", nguess));
      
nguess++;
    
 
 
}
  
while (number != guess);

}


 
 
 

