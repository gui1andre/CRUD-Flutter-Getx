import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/pessoas_controller.dart';
import '/models/pessoa.dart';

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
            FotoPerfil(
              pessoa: pessoa,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SizedBox(
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pessoa.name.capitalize!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      pessoa.email,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed('atualizarPessoa', arguments: [
                      pessoa,
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
  const FotoPerfil({
    Key? key,
    required this.pessoa,
  }) : super(key: key);
  final Pessoa pessoa;

  @override
  Widget build(BuildContext context) {
    if (pessoa.foto == null) {
      return CircleAvatar(
        child: Text(
          '${pessoa.name[0].capitalize}',
          style: const TextStyle(fontSize: 32),
        ),
        radius: 32,
      );
    } else {
      return CircleAvatar(
        radius: 32,
        backgroundImage: FileImage(
          pessoa.foto!,
        ),
      );
    }
  }
}
