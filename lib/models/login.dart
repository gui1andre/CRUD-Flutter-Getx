class Login {
  String? nome;
  String? senha;

  Login({this.nome, this.senha});

  Login.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['senha'] = senha;
    return data;
  }
}