import 'dart:io';

import 'package:crud/models/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
    File? imagemSelecionada;
    final ImagePicker imagePicker = ImagePicker();

    Future<File> _pegarImagemGaleira() async {
      final XFile? imagemTemporaria =
          await imagePicker.pickImage(source: ImageSource.gallery);
          
      if (imagemTemporaria != null) {
        print('Olha ai $imagemTemporaria');
        final File imagemSelecionada = File(imagemTemporaria.path);
        return imagemSelecionada;
      }  throw('Falha ao coletar imagem');
    }

    _pegarImagemCamera() async {
      final XFile? imagemTemporaria =
          await imagePicker.pickImage(source: ImageSource.camera);
      if (imagemTemporaria != null) {
        File imagemSelecionada = File(imagemTemporaria.path);
          } else {
        return null;
      }
    }

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
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CircleAvatar(
                child: Text(
                  pessoaAtualizar.name[0].capitalize!,
                  style: const TextStyle(fontSize: 50),
                ),
                radius: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      final File imagemSelecionada = await _pegarImagemGaleira();
                    },
                    child: const Text('Inserir Foto'),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Text('ou'),
                  ),
                  ElevatedButton(
                      onPressed: () => _pegarImagemCamera(),
                      child: const Text('Tirar Foto'))
                ],
              ),
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 56),
                      child: TextFormFieldCadastro(
                        controller: nome,
                        menssagemErro: 'Nome obrigatório.',
                        nomeCampo: 'Nome',
                        textInputType: TextInputType.text,
                      ),
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
                    print('Teste: $imagemSelecionada');
                    final isValidForm = formKey.currentState!.validate();
                    if (isValidForm) {
                      
                      _pessoasCtrl.atulizarPessoa(
                          indexPessoa, Pessoa(nome.text, email.text, imagemSelecionada));
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
