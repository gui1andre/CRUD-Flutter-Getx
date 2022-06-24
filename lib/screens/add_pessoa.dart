import 'package:crud/controllers/estados_controller.dart';
import 'package:crud/models/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../components/textformfields.dart';
import '../controllers/pessoas_controller.dart';
import '../models/estados.dart';

class CadastrarPessoa extends StatelessWidget {
  CadastrarPessoa({
    Key? key,
  }) : super(key: key);
  final _pessoasCtrl = Get.find<PessoasControler>();
  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dataNascimento = TextEditingController();
  TextEditingController cep = TextEditingController();
  TextEditingController cidade = TextEditingController();
  final formKey = GlobalKey<FormState>();
  EstadosController estadosController = EstadosController();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 180,
                            child: Obx(
                              () => DropdownButton(
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
                              ),
                            ),
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ElevatedButton(
                    onPressed: () {
                      final isValidForm = formKey.currentState!.validate();
                      if (isValidForm) {
                        _pessoasCtrl.adicionarPessoa(Pessoa(
                            name: nome.text,
                            email: email.text,
                            foto: null,
                            datanascimento: dataNascimento.text,
                            cep: cep.text,
                            estado: estadosController.selected.string,
                            cidade: cidade.text));
                        Get.back();
                      }
                    },
                    child: const Text('Cadastrar')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
