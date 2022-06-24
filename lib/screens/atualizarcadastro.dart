import 'dart:io';

import 'package:crud/controllers/estados_controller.dart';
import 'package:crud/models/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../components/textformfields.dart';
import '../controllers/pessoas_controller.dart';
import '../models/estados.dart';

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
    TextEditingController dataNascimento =
        TextEditingController(text: pessoaAtualizar.datanascimento);
    TextEditingController cep =
        TextEditingController(text: pessoaAtualizar.cep);
    TextEditingController cidade =
        TextEditingController(text: pessoaAtualizar.cidade);
    XFile? imagemTemporaria;
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    EstadosController estadosController = EstadosController();
    estadosController.selected.value = pessoaAtualizar.estado;

    print(pessoaAtualizar.toString());

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
                        padding: const EdgeInsets.fromLTRB(0, 56, 0, 48),
                        child: TextFormFieldCadastro(
                          controller: nome,
                          menssagemErro: 'Nome obrigatório.',
                          nomeCampo: 'Nome',
                          textInputType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 48),
                        child: TextFormFieldCadastro(
                          controller: email,
                          menssagemErro: 'E-mail obrigatório.',
                          nomeCampo: 'E-mail',
                          textInputType: TextInputType.emailAddress,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: SizedBox(
                          width: 350,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 180,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Data de nascimento obrigatoria';
                                    } else {
                                      return null;
                                    }
                                  },
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1960),
                                        lastDate: DateTime.now());
                                    if (date != null) {
                                      dataNascimento.text =
                                          dateFormat.format(date);
                                    }
                                  },
                                  keyboardType: TextInputType.datetime,
                                  controller: dataNascimento,
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.date_range),
                                    hintText: 'Data Nascimento',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                child: TextFormField(
                                  maxLength: 8,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'CEP Obrigatorio';
                                    } else if (value.length < 8) {
                                      return 'Preencher os 8 digitos';
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: cep,
                                  decoration: const InputDecoration(
                                    hintText: 'CEP',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 180,
                              child: Obx(() => DropdownButton(
                                    onChanged: (newValue) {
                                      estadosController
                                          .setSelected(newValue.toString());
                                    },
                                    value: estadosController.selected.value,
                                    items: estadosFormatado.map((selectedType) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          selectedType,
                                        ),
                                        value: selectedType,
                                      );
                                    }).toList(),
                                  )),
                            ),
                            SizedBox(
                              width: 160,
                              child: TextFormField(
                                maxLength: null,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Cidade obrigatoria';
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.name,
                                controller: cidade,
                                decoration: const InputDecoration(
                                  hintText: 'Cidade',
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                name: nome.text,
                                email: email.text,
                                foto: pessoaAtualizar.foto,
                                datanascimento: dataNascimento.text,
                                cep: cep.text,
                                estado: estadosController.selected.string,
                                cidade: cidade.text));
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
