#include <stdio.h>

int main(void) {
	int i = 1, sum =0;
	while(i <= 1000) {
		sum = sum + i;
		i++;
	}
	printf("sum�� %d�Դϴ�\n", sum);
	return 0;
} 
