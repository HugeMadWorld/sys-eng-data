#include "iostream"
#include "windows.h"
using namespace std;

void calc()
{
	int a, n, i, P;
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	cout << "\tЛабораторна робота 2, Варіант 7.\n\tРозробив: Іванов С. Ю.\n\n\n";
	cout << "Введіть значення N: ";
	P = 1;
	cin >> n;
	cout << "Введіть значення A: ";
	cin >> a;

	for (i = 1; i <= n; i++)
	{
		P = P*(a + i - 1);
		//cout <<"a:" <<a<<" i:"<< i<<"\n";
		//P = P + a*(a + i - 1);
	}
	cout << "\n\nРезультат: " << P << "\n";
	system("pause");
}

void main()
{
	calc();
}

