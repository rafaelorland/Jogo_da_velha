import 'dart:io';

void main() {
  menu();
}

var board = [
  [0, 0, 0],
  [0, 0, 0],
  [0, 0, 0]
];


void menu() {
  int continuar = 1;
  while (continuar == 1) {
    print('Digite "1" para jogar:\nDigite "0" para sair ');
    String? input = stdin.readLineSync();

    if (input == "1") {
      game(0);
      board = [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
      ];
    }
    if (input == "0") {
      continuar = 2;
    } else {
      print('Você digitou errado!!');
    }
  }
}

void game(condicao) {
  int a = condicao;
  int jogada = 0;

  while (a == 0) {
    exibe();
    print('Linha: ');
    int? linha = int.parse(stdin.readLineSync()!);

    print('Coluna: ');
    int? coluna = int.parse(stdin.readLineSync()!);

    //Adicionando a jogada no board -1 é Bola e 1 é X.
    if (board[linha - 1][coluna - 1] == 0) {
      if ((jogada % 2 + 1) == 1) {
        //Adicionando O "X"
        board[linha - 1][coluna - 1] = 1;
      } else {
        //Adicionando O "O"
        board[linha - 1][coluna - 1] = -1;
      }
    } else {
      print('Não esta vazio!!');
      jogada -= 1;
    }

    if (winner() == 1) {
      print('O jogador ${jogada % 2 + 1} Ganhou!!!');
      a = 1;
    }

    jogada += 1;
  }
}

int winner() {
  //Verificando as linhas para o winner
  for (int row = 0; row < 3; row++) {
    int somando_linhas = board[row][0] + board[row][1] + board[row][2];
    if (somando_linhas == 3) {
      return 1;
    }
    if (somando_linhas == -3) {
      return 1;
    }
  }
  //Verificando as colunas para o winner
  for (int conllum = 0; conllum < 3; conllum++) {
    int somando_colunas =
        board[0][conllum] + board[1][conllum] + board[2][conllum];
    if (somando_colunas == 3) {
      return 1;
    }
    if (somando_colunas == -3) {
      return 1;
    }
  }

  //Verificando as veticais para o winner
  int somadavertical1 =  board[0][0] + board[1][1] + board[2][2];
  int somadavertical2 =  board[2][0] + board[1][1] + board[0][2];
  if(somadavertical1 == 3 || somadavertical1 == -3 || somadavertical2 == 3 || somadavertical2 == -3) {
    return 1;
  }

  return 0;
}

void exibe() {
  print(
      "${board[0][0]}|${board[0][1]}|${board[0][2]}\n${board[1][0]}|${board[1][1]}|${board[1][2]}\n${board[2][0]}|${board[2][1]}|${board[2][2]}");
}

