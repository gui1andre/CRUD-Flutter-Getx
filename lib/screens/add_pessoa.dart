import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pessoas_controller.dart';

class CadastrarPessoa extends StatelessWidget {
  const CadastrarPessoa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pessoasCtrl = Get.find<PessoasControler>();
    TextEditingController nome = TextEditingController();
    TextEditingController email = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text('CRUD'),
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
                  controller: email,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'E-mail',
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              
              Get.back();
            }, child: const Text('Cadastrar'))
          ],
        ),
      ),
    );
  }
}
