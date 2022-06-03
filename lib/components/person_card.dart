import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/pessoas_controller.dart';
import '/models/pessoa.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key? key,
    required this.pessoa,
    required this.indexPessoa,
    this.foto,
  }) : super(key: key);
  final Pessoa pessoa;
  final int indexPessoa;
  final File? foto;

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
            FotoPerfil(
              nomePessoa: pessoa.name,
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
                      Pessoa(pessoa.name, pessoa.email, null),
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

class FotoPerfil extends StatelessWidget {
  const FotoPerfil({Key? key, required this.nomePessoa, this.foto})
      : super(key: key);
  final String nomePessoa;
  final File? foto;

  @override
  Widget build(BuildContext context) {
    if (foto == null) {
      return CircleAvatar(
        child: Text(
          '${nomePessoa[0].capitalize}',
          style: const TextStyle(fontSize: 32),
        ),
        radius: 32,
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle
        ),
        child: Image.file(foto!)
      );
    }
  }
}
