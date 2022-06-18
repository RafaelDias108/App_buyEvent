class Event {
  int id;
  String imageUrl;
  String nome;
  String descricao;
  String data;
  String hora;
  int ingressos;

  Event({
    required this.id,
    required this.imageUrl,
    required this.nome,
    required this.descricao,
    required this.data,
    required this.hora,
    required this.ingressos,
  });
}

var event = [
  Event(
    nome: "Show na rua",
    imageUrl: 'assets/images/show.jpg',
    descricao: "Este é show de música que vai acontecer na rua.",
    data: "24/07/2022",
    hora: "20:00",
    ingressos: 3,
    id: 1,
  ),
  Event(
    nome: "Drift Race",
    imageUrl: 'assets/images/corrida_carro.jpg',
    descricao:
        "Corrida de alta velocidade com carros esportivos e atrações de drift.",
    data: "25/06/2022",
    hora: "09:00",
    ingressos: 3,
    id: 2,
  ),
  Event(
    nome: "Palestra Flutter",
    imageUrl: 'assets/images/palestra.jpg',
    descricao:
        "Uma Palestra/curso de flutter organizado para aprendizagem e capacitação dos desenvolvedores flutter.",
    data: "23/06/2022",
    hora: "20:30",
    ingressos: 3,
    id: 3,
  ),
];
