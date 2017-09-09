// Disciplina: Arquitetura e Organização de Computadores
// Atividade: Avaliação 01 – Programação em C++
// Programa 01
// Grupo: - Matheus Henrique Schaly

#include <iostream>

using namespace std;

int main()
{
    int vector1[8], vector2[8];
    int numElementos;
    while (true) {
        cout << "Enter with array's size (max. = 8):\n";
        cin >> numElementos;
        if (numElementos > 0 && numElementos < 9) {
            break;
        }
        cout << "Invalid value.\n";
    }
    for (int i = 0; i < numElementos; i++) {
        cout << "Vector1[" << i << "] = ";
        cin >> vector1[i];
    }
    for (int i = 0; i < numElementos; i++) {
        cout << "Vector2[" << i << "] = ";
        cin >> vector2[i];
    }
    int temp;
    for (int i = 0; i < numElementos; i++) {
        temp = vector1[i];
        vector1[i] = vector2[i];
        vector2[i] = temp;
    }
    cout << "\n";
    for (int i = 0; i < numElementos; i++) {
        cout << "Vetor1[" << i << "] = " << vector1[i] << "\n";
    }
    for (int i = 0; i < numElementos; i++) {
        cout << "Vetor2[" << i << "] = " << vector2[i] << "\n";
    }
}
