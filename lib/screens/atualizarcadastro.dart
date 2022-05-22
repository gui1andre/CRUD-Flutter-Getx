import 'package:crud/models/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pessoas_controller.dart';

class AtualizarPessoa extends StatelessWidget {
  const AtualizarPessoa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> data = Get.arguments;
    Pessoa pessoaAtualizar = data[0];
    final _pessoasCtrl = Get.find<PessoasControler>();
    TextEditingController nome =
        TextEditingController(text: pessoaAtualizar.name);
    TextEditingController email =
        TextEditingController(text: pessoaAtualizar.email);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('Atualizar'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 56, 0, 32),
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nome,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nome',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'E-mail',
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _pessoasCtrl.atulizarPessoa(data[1], pessoaAtualizar);

                  Get.back();
                },
                child: const Text('Cadastrar'))
          ],
        ),
      ),
    );
  }
}
