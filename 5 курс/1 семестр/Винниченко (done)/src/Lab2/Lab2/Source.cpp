#include "iostream"
#include "windows.h"
using namespace std;

void calc()
{
	int a, n, i, P;
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	cout << "\t����������� ������ 2, ������ 7.\n\t��������: ������ �. �.\n\n\n";
	cout << "������ �������� N: ";
	P = 1;
	cin >> n;
	cout << "������ �������� A: ";
	cin >> a;

	for (i = 1; i <= n; i++)
	{
		P = P*(a + i - 1);
		//cout <<"a:" <<a<<" i:"<< i<<"\n";
		//P = P + a*(a + i - 1);
	}
	cout << "\n\n���������: " << P << "\n";
	system("pause");
}

void main()
{
	calc();
}

