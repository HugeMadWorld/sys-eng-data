#include "iostream"
#include "windows.h"
using namespace std;
double R1, R2, R3, R4, R5;
bool K;
int N, topology;

void main()
{
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	cout << "\tЛабораторна робота 4, Варіант 7.\n\tРозробив: Іванов С. Ю.\n\n\n";
	cout << "Введіть топологію ланцюга: послідовна або паралельна (1/0 відповідно)";
	cin >> topology;
	cout << "Введіть кількість резисторів: ";
	cin >> N;
	while (true) {
		if ((N == 1) || (N == 3) || (N == 5)) break;
		else if ((N < 1) || (N > 5)) {
			cout << "Кількість резисторів повинна бути більше 0 та не більше 5\n";
			cout << "Введіть кількість резисторів: ";
			cin >> N;
		}
		else {
			cout << "Кількість резисторів повинна бути непарною\n";
			cout << "Введіть кількість резисторів: ";
			cin >> N;
		}
	}
	cout << "Значення R1: ";
	cin >> R1;
	cout << "Значення R2: ";
	cin >> R2;
	cout << "Значення R3: ";
	cin >> R3;
	cout << "Значення R4: ";
	cin >> R4;
	cout << "Значення R5: ";
	cin >> R5;
	cout << "Ключ замкнутий або разімкнений (1/0 відповідно): ";
	cin >> K;
	if (K == true) {
		cout << "\nРезультат: ";
		cout << (1 / R1 + 1 / R2) + (1 / R3 + 1 / R4 + 1 / R5) << " Ом\n\n";
	}
	else {
		cout << "\nРезультат: ";
		cout << 1 / R1 + (1 / R3 + 1 / R4 + 1 / R5) << " Ом\n\n";
	}
	system("pause");
}