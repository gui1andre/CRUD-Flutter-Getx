import 'package:crud/models/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/textformfields.dart';
import '../controllers/pessoas_controller.dart';

class AtualizarPessoa extends StatelessWidget {
  const AtualizarPessoa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> data = Get.arguments;
    Pessoa pessoaAtualizar = data[0];
    int indexPessoa = data[1];
    final formKey = GlobalKey<FormState>();
    final _pessoasCtrl = Get.find<PessoasControler>();
    TextEditingController nome =
        TextEditingController(text: pessoaAtualizar.name);
    TextEditingController email =
        TextEditingController(text: pessoaAtualizar.email);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text('Atualizar'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormFieldCadastro(
                      controller: nome,
                      menssagemErro: 'Nome obrigatório.',
                      nomeCampo: 'Nome',
                      textInputType: TextInputType.text,
                    ),
                    TextFormFieldCadastro(
                      controller: email,
                      menssagemErro: 'E-mail obrigatório.',
                      nomeCampo: 'E-mail',
                      textInputType: TextInputType.emailAddress,
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: ElevatedButton(
                  onPressed: () {
                    final isValidForm = formKey.currentState!.validate();
                    if (isValidForm) {
                      _pessoasCtrl.atulizarPessoa(
                          indexPessoa, Pessoa(nome.text, email.text));
                      Get.back();
                    }
                  },
                  child: const Text('Atualizar')),
            )
          ],
        ),
      ),
    );
  }
}
