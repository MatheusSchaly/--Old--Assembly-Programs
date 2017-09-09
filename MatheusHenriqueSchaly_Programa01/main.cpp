// Disciplina: Arquitetura e Organização de Computadores
// Atividade: Avaliação 01 – Programação em C++
// Programa 01
// Grupo: - Matheus Henrique Schaly

#include <iostream>

using namespace std;

int main()
{
    int vetor1[8], vetor2[8];
    int numElementos;
    while (true) {
        cout << "Entre com o tamanho dos vetores (max. = 8):\n";
        cin >> numElementos;
        if (numElementos > 0 && numElementos < 9) {
            break;
        }
        cout << "Valor invalido.\n";
    }
    for (int i = 0; i < numElementos; i++) {
        cout << "Vetor1[" << i << "] = ";
        cin >> vetor1[i];
    }
    for (int i = 0; i < numElementos; i++) {
        cout << "Vetor2[" << i << "] = ";
        cin >> vetor2[i];
    }
    int aux;
    for (int i = 0; i < numElementos; i++) {
        aux = vetor1[i];
        vetor1[i] = vetor2[i];
        vetor2[i] = aux;
    }
    for (int i = 0; i < numElementos; i++) {
        cout << "Vetor1[" << i << "] = " << vetor1[i] << endl;
    }
    for (int i = 0; i < numElementos; i++) {
        cout << "Vetor2[" << i << "] = " << vetor2[i] << endl;
    }
}
