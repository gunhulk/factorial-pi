#include <stdio.h> 
extern int factorial(int n);
int factorial_inefficient(int n){
	int counter = n;
	int result = 1;
	while (counter > 1){
		result = result * counter;
		counter--;
	}
	return result;
}

int main(){
	short e = 0;
	e = factorial(5);
	int i = factorial_inefficient(5);
	printf("Efficient: %d\n", e);
	printf("Inefficient: %d\n", i);
	return factorial(5);	
}
