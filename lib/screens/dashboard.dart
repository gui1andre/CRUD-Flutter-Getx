
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/person_card.dart';
import '../controllers/pessoas_controller.dart';
import '../models/pessoa.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({ Key? key }) : super(key: key);

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

class DashBody extends StatelessWidget {
  const DashBody({ Key? key }) : super(key: key);

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
                    pessoa: _porPessoa,
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
