import 'package:flutter/material.dart';

class CadastrarPessoa extends StatelessWidget {
  const CadastrarPessoa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('CRUD'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Container(
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nome',
                ),
              ),
            ),Container(
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'E-mail',
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Cadastrar'))
          ],
        ),
      ),
    );
  }
}
