class ToDo {
  String? id;
  String? text;
  bool isDone;

  ToDo({
    required this.id,
    required this.text,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', text: 'Casa - Tirar o lixo', isDone: true),
      ToDo(id: '02', text: 'Casa - Ir no supermercado'),
      ToDo(id: '03', text: 'Trabalho - Responder emails', isDone: true),
      ToDo(id: '04', text: 'Estudos - Aprender Flutter')
    ];
  }
}
