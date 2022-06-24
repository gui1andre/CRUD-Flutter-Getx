import 'dart:io';

class Pessoa {
  String name;
  String email;
  File? foto;
  String datanascimento;
  String cep;
  String estado;
  String cidade;

  Pessoa({required this.name, required this.email, this.foto, required this.datanascimento, required this.cep, required this.estado, required this.cidade});


@override
  String toString() {
  
    return 'Pessoa: $name, $email, $datanascimento, $cep, $estado, $cidade';
  }
}
