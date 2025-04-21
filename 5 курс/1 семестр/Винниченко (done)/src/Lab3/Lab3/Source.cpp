#include <iostream>
#include "windows.h"
#include <string>

using namespace std;


void main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);

	cout << "\tЛабораторна робота 3, Варіант 7(1).\n\tРозробив: Іванов С. Ю.\n\n\n";
	cout << "Введіть строку латинських букв, створених генератором: ";
	string str;
	getline(cin, str);
	for (int i = 0; i < str.size(); ++i)
		for (int j = str.size() - 1; j > i; --j)
			if (str[j - 1] > str[j])
			{
				char temp = str[j];
				str[j] = str[j - 1];
				str[j - 1] = temp;
			}
	cout << "\nВідсортована строка: " << str << endl;
	system("pause");
}
