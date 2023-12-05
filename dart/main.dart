void main() async{
  // 1 - Introdução a Variaveis
  print('- AULA 1: Introdução a Variaveis-');
  String variavel_nome  = "Lyan";
  int valor_variavel  = 21;
  bool verdadeiro = true;
  List<String>  lista_de_palavras = ["Lyan", "Araujo"];

  print('${lista_de_palavras[0]} ${lista_de_palavras[1]} está tentando aprender Dart');

  // 2 - Introdução null-safety
  print('\n- AULA 2: null-safety -');
  // String nome;   <--- Falhou por causa do 'null-safety' ou seja, não é permitido variaveis sem valor atribuido (nulo)

  String? nome; // "?" permite que a variavel seja criada nula
  nome  = "Lyan"; // foi atribuido o valor e, por isso, o código não deu erro
  print(nome!); // "!" impede que a variavel recebida seja nula

  late String sobrenome; // "late" define que depois da variavel recebe um valor ele nunca mais pode ser null
  sobrenome = "Araujo";
  print(sobrenome);

  // 3 - IF e SWITCH
  print('\n- AULA 3: IF e SWITCH -');
  bool seguir_em_frente = false;

  if(bool == true) {
    print('vá para a esquerda');
  } else {
    print('vá para a direita');
  }

  int valor_int = 2;

  switch(valor_int) {
    case 0:
      print('ZERO');
      break;
    
    case 1:
      print('UM');
      break;

    default:
      print('UM VALOR ESTRANHO FOI INSERDO');
      break;
  }

  // 4 - Estruturas de Repetição
  print('\n- AULA 4: Estruturas de Repetição -');
  print('\nfor…loop');
  for(int i = 1; i <= 10; i++) {
    print(i * 2);
  }

  print('\nwhile…loop');
  int while_int = 0;
  while(while_int <= 10) {
    print(while_int);
    while_int++;
  }

  print('\ndo…while');
  int doWhile_int = 0;
  do {
    print(doWhile_int);
    doWhile_int++;
  } while(doWhile_int <= 10);

  // 5 - Metodos e Classes
  print('\n- AULA 5: Metodos e Classes -');

  Celular meu_celular = Celular("Rose", 4, 0.500, 5.7);
  Celular seu_celular = Celular("Preto", 6, 0.800, 5.7);

  print(meu_celular.toString());
  print(seu_celular.toString());

  print(meu_celular.valorDoCelular(999.99));

  // 6 - Orientação a Objetos
  print('\n- AULA 6: Orientação a Objetos -');

  Carro mercedes  = Carro('Mercedes');
  Carro gol  = Carro('gol');

  mercedes.setValor(5000);
  print(mercedes.valorDoCarro);

  // 7 - Herança, Polimorfismo e Abstração  
  print('\n- AULA 7: Herança, Polimorfismo e Abstração -');
  // O DART NÃO TEM INTERFACE

  Filho filho = Filho();
  filho.falar();

  Pagamento pagamento = PagarComBoleto();
  pagamento.pagar();

  pagamento = PagarComPix();
  pagamento.pagar();

  // 8 - Future, Async e Await
  print('\n- AULA 8: Future, Async e Await -');
  String m_nome = 'Lyan';
  Future<String> cepFuture  = getCepByName("Rua JK");
  late String cep;

  // cepFuture.then((result) => cep = result);
  cep = await cepFuture;
  print(cep);

  // DIA 1 DE ESTUDOS CONCLUIDO
}


Future<String> getCepByName(String name) {  //"Future" para quando não pudermos garantir que nosso valor virá logo em seguinda após a requisição.
                                            // Podemos recuperar o valor retornado assim que o valor for definido
  //simulando requisição

  return Future.value('90398409328');
}

abstract class Pagamento {
  void pagar();
}

class PagarComBoleto implements Pagamento {
  void pagar() {
    print('Pagando com boleto');
  }
}

class PagarComPix implements Pagamento {
  void pagar() {
    print('Pagando com Pix');
  }
}

class Mae {
  String falar() {
    return "girias";
  }
}

class Filho extends Mae {
  
}

abstract class Pessoa {
  String comunicar();

}

class PessoaET implements Pessoa {
  String comunicar() {
    return 'Olá Mundo!';
  }
}

class PessoaNaoET implements Pessoa {
  String comunicar() {
    return 'Bom Dia!';
  }
}

class Celular {
  final String cor; // 'final' passa a responsabilidade de atribuir valores para o contrutor
  final int qtd_pros;
  final double tamanho;
  final double peso;


  Celular(this.cor, this.qtd_pros, this.peso, this.tamanho);

  String toString() {
    return "cor $cor, qtd_pros $qtd_pros, peso $peso, tamanho $tamanho"; // "$" se refere ao valor do objeto
  }

  double valorDoCelular(double valor) {
    return valor * qtd_pros;
  }
}

class Carro {
  final String modelo;
  String _segredo   = 'Muito Dinheiro'; //variaveis privadas devem começar com '_'
  int _valor = 1000;

  int get valorDoCarro  => _valor; 

  void setValor(new_value)  => _valor = new_value;

  Carro(this.modelo);
}