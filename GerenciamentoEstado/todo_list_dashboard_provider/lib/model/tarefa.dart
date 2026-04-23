class Tarefa {
  // atributos
  String titulo; //atributi o titulo a tarefa
  bool concluida; //atribuir o status da Tarefa
  DateTime criadaEm; // atribui a data da tarefa

  //construtor
  //required = é obrigatório
  Tarefa({required this.titulo, this.concluida = false, DateTime? criadaEm}): criadaEm = criadaEm ?? DateTime.now();
  // se ao criar não existir (??) uma carimbo de data e hora é criado um 
}