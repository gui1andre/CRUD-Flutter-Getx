import 'dart:html';

import 'package:crud/screens/add_pessoa.dart';
import 'package:crud/screens/atualizarcadastro.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/pessoas_controller.dart';
import 'models/pessoa.dart';

void main() {
  runApp(const CrudApp());
}

class CrudApp extends StatelessWidget {
  const CrudApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      getPages: [
        GetPage(name: '/home', page: () => const Dashboard()),
        GetPage(name: '/cadastrarPessoa', page: () => const CadastrarPessoa()),
        GetPage(name: '/atualizarPessoa', page: () => const AtualizarPessoa()),
      ],
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text('CRUD'),
      ),
      body: const DashBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('cadastrarPessoa'),
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}

class DashBody extends StatefulWidget {
  const DashBody({Key? key}) : super(key: key);

  @override
  State<DashBody> createState() => _DashBodyState();
}

class _DashBodyState extends State<DashBody> {
  @override
  Widget build(BuildContext context) {
    final pessoasCtrl = Get.put(PessoasControler());

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Obx(() {
        if (pessoasCtrl.pessoas.isEmpty) {
          return const Center(child: Text('Sem Usuarios Cadastrados'));
        } else {
          return ListView.builder(
            itemCount: pessoasCtrl.pessoas.length,
            itemBuilder: (context, index) {
              Pessoa _porPessoa = pessoasCtrl.pessoas.elementAt(index);
              return Column(
                children: [
                  PersonCard(
                    pessoa: Pessoa(_porPessoa.name, _porPessoa.email),
                    indexPessoa: index,
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 1,
                  )
                ],
              );
            },
          );
        }
      }),
    );
  }
}

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key? key,
    required this.pessoa,
    required this.indexPessoa,
  }) : super(key: key);
  final Pessoa pessoa;
  final int indexPessoa;

  @override
  Widget build(BuildContext context) {
    final _pessoasCtrl = Get.find<PessoasControler>();

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 100,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Text(
                '${pessoa.name[0].capitalize}',
                style: const TextStyle(fontSize: 32),
              ),
              radius: 32,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pessoa.name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  pessoa.email,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed('atualizarPessoa', arguments: [
                      Pessoa(pessoa.name, pessoa.email),
                      indexPessoa
                    ]);
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                    size: 24,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      _pessoasCtrl.removerPessoa(indexPessoa);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 24,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
