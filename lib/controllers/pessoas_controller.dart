import 'package:get/get.dart';

import '../models/pessoa.dart';

class PessoasControler extends GetxController{
  List pessoas = <Pessoa>[].obs;


  void adicionarPessoa(Pessoa novaPessoa) {
    this.pessoas.add(novaPessoa);
    update();
  }

  void removerPessoa(int id)
  {
    this.pessoas.removeAt(id);
    update();
  }
}