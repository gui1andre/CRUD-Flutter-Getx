import 'dart:io';

import 'package:crud/models/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../components/textformfields.dart';
import '../controllers/pessoas_controller.dart';

class AtualizarPessoa extends StatefulWidget {
  const AtualizarPessoa({
    Key? key,
  }) : super(key: key);

  @override
  State<AtualizarPessoa> createState() => _AtualizarPessoaState();
}

class _AtualizarPessoaState extends State<AtualizarPessoa> {
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
    XFile? imagemTemporaria;

    final ImagePicker imagePicker = ImagePicker();

    void _pegarImagemGaleira() async {
      imagemTemporaria =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (imagemTemporaria != null) {
        setState(() {
          pessoaAtualizar.foto = File(imagemTemporaria!.path);
        });
      }
    }

    void _pegarImagemCamera() async {
      imagemTemporaria =
          await imagePicker.pickImage(source: ImageSource.camera);
      if (imagemTemporaria != null) {
        setState(() {
          pessoaAtualizar.foto = File(imagemTemporaria!.path);
        });
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: PerfilImage(
                  fotoPessoa: pessoaAtualizar,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () async {
                        _pegarImagemGaleira();
                      },
                      child: const Text('Inserir Foto'),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Text('ou'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        _pegarImagemCamera();
                      },
                      child: const Text('Tirar Foto'),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red.shade400),
                onPressed: () {
                  setState(() {
                    pessoaAtualizar.foto = null;
                  });
                },
                child: const Text('Remover Foto'),
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
                      final isValidForm = formKey.currentState!.validate();
                      if (isValidForm) {
                        _pessoasCtrl.atulizarPessoa(
                            indexPessoa,
                            Pessoa(
                                nome.text, email.text, pessoaAtualizar.foto));
                        Get.back();
                      }
                    },
                    child: const Text('Atualizar')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PerfilImage extends StatelessWidget {
  const PerfilImage({Key? key, required this.fotoPessoa}) : super(key: key);
  final Pessoa fotoPessoa;

  @override
  Widget build(BuildContext context) {
    if (fotoPessoa.foto == null) {
      return CircleAvatar(
        child: Text(
          fotoPessoa.name[0].capitalize!,
          style: const TextStyle(fontSize: 50),
        ),
        radius: 50,
      );
    } else {
      return CircleAvatar(
        backgroundImage: FileImage(
          fotoPessoa.foto!,
        ),
        radius: 50,
      );
      
    }
  }
}
