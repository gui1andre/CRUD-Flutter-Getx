import 'package:crud/models/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/textformfields.dart';
import '../controllers/pessoas_controller.dart';

class CadastrarPessoa extends StatelessWidget {
  const CadastrarPessoa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pessoasCtrl = Get.find<PessoasControler>();
    TextEditingController nome = TextEditingController();
    TextEditingController email = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text('Cadastrar'),
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
                    _pessoasCtrl.adicionarPessoa(Pessoa(nome.text, email.text, null));
                    Get.back();
                  },
                  child: const Text('Cadastrar')),
            )
          ],
        ),
      ),
    );
  }
}
