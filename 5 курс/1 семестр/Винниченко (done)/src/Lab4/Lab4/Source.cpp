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
	cout << "\t����������� ������ 4, ������ 7.\n\t��������: ������ �. �.\n\n\n";
	cout << "������ �������� �������: ��������� ��� ���������� (1/0 ��������)";
	cin >> topology;
	cout << "������ ������� ���������: ";
	cin >> N;
	while (true) {
		if ((N == 1) || (N == 3) || (N == 5)) break;
		else if ((N < 1) || (N > 5)) {
			cout << "ʳ������ ��������� ������� ���� ����� 0 �� �� ����� 5\n";
			cout << "������ ������� ���������: ";
			cin >> N;
		}
		else {
			cout << "ʳ������ ��������� ������� ���� ��������\n";
			cout << "������ ������� ���������: ";
			cin >> N;
		}
	}
	cout << "�������� R1: ";
	cin >> R1;
	cout << "�������� R2: ";
	cin >> R2;
	cout << "�������� R3: ";
	cin >> R3;
	cout << "�������� R4: ";
	cin >> R4;
	cout << "�������� R5: ";
	cin >> R5;
	cout << "���� ��������� ��� ���������� (1/0 ��������): ";
	cin >> K;
	if (K == true) {
		cout << "\n���������: ";
		cout << (1 / R1 + 1 / R2) + (1 / R3 + 1 / R4 + 1 / R5) << " ��\n\n";
	}
	else {
		cout << "\n���������: ";
		cout << 1 / R1 + (1 / R3 + 1 / R4 + 1 / R5) << " ��\n\n";
	}
	system("pause");
}