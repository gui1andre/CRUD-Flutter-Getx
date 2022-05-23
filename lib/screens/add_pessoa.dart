import 'package:crud/models/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pessoas_controller.dart';

class CadastrarPessoa extends StatelessWidget {
  const CadastrarPessoa({Key? key, }) : super(key: key);



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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 56, 0, 32),
                      child: SizedBox(
                        width: 350,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nome obrigatório.';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.name,
                          controller: nome,
                          decoration: const InputDecoration(
                            hintText: 'Nome',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: SizedBox(
                        width: 350,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'E-mail obrigatório.';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          decoration: const InputDecoration(
                            hintText: 'E-mail',
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            ElevatedButton(onPressed: () {
              _pessoasCtrl.adicionarPessoa(Pessoa(nome.text, email.text));
              Get.back();

            }, child: const Text('Cadastrar'))
          ],
        ),
      ),
    );
  }
}
