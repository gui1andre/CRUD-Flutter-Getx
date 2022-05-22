import 'package:get/get.dart';
import '../models/pessoa.dart';

class PessoasControler extends GetxController {
  List pessoas = <Pessoa>[].obs;

  void adicionarPessoa(Pessoa novaPessoa) {
    pessoas.add(novaPessoa);
  }

  void removerPessoa(int index) {
    pessoas.removeAt(index);
  }

  void atulizarPessoa(int index, Pessoa atualizarPessoa){
      atualizarPessoa.name = pessoas[index].name;
      atualizarPessoa.email = pessoas[index].email;


  }
}
