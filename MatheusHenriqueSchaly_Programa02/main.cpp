// Disciplina: Arquitetura e Organização de Computadores
// Atividade: Avaliação 01 – Programação em C++
// Programa 02
// Grupo: - Matheus Henrique Schaly

#include <iostream>
#include <algorithm>

using namespace std;

int main()
{
    int record[16][32], student, myClass, presence;

    for (int i = 0; i < 16; i++) {
        for (int j = 0; j < 32; j++) {
            record[i][j] = 1;
        }
    }

    while (true) {
        do {
            cout << "Enter class' number (0 to 15): ";
            cin >> myClass;
        } while (myClass < 0 || myClass > 15);
        do {
            cout << "Enter student's number (0 to 31): ";
            cin >> student;
        } while (student < 0 || student > 31);
        do {
            cout << "Enter register's type (presence = 1; absence = 0): ";
            cin >> presence;
        } while (presence < 0 || presence > 1);
        record[myClass][student] = presence;
    }

}
