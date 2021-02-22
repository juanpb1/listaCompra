import 'dart:io';

List<dynamic> listaCompra = [];
List<double> total = [];

comandos() {
  bool stop = true;

  while (stop) {
    screen();
    var comando = stdin.readLineSync();
    if (comando == 'a') {
      addItem();
    } else if (comando == 'p') {
      imprimirLista();
    } else if (comando == 'r') {
      removerItem();
    } else if (comando == 's') {
      stop = false;
      print('==== PROGAMA ENCERRADO ====');
    } else {
      print('\x1B[2J\x1B[0;0H');
      print('ERRO! COMANDO INVÁLIDO!');
    }
  }
}

screen() {
  print('==== LISTA DE COMPRA ====');
  print('==== COMANDOS');
  print('a - adicionar item');
  print('p - Mostrar a lista de compra');
  print('r - Remover item da lista');
  print('S - Sair do progama');
  print('==========================');
  print('Digite o comando');
}

addItem() {
  List<dynamic> lista = [];
  print('\x1B[2J\x1B[0;0H');
  print('==================');
  print('ITEM');
  String item = stdin.readLineSync();
  print('==================');
  print('PREÇO');
  double preco = double.parse(stdin.readLineSync());
  total.add(preco);

  lista.add(item);
  lista.add(preco);

  listaCompra.add(lista);
}

imprimirLista() {
  print('\x1B[2J\x1B[0;0H');
  for (int pos = 0; pos < listaCompra.length; pos++) {
    print('ITEM ${pos} / PREÇO');
    print(listaCompra[pos]);
    if (pos % 2 == 0) {
      print('\n');
    }
  }
  print('==============');
  print('TOTAL DA COMPRA: ');
  print(totalCompra());
  print('=================');
}

removerItem() {
  imprimirLista();
  print('QUAL ITEM DESEJAR REMOVER?');
  int remover = int.parse(stdin.readLineSync());

  listaCompra.removeAt(remover);
  print('ITEM REMOVIDO');

  List<dynamic> apenasNum = listaCompra[remover];
  double valorSubtrair = double.tryParse(apenasNum[1]);
  totalCompra(valorSubtrair: valorSubtrair);
}

totalCompra({double valorSubtrair}) {
  double soma;

  for (int i = 0; i < total.length; i++) {
    soma += total[i];
  }

  return soma;
}
