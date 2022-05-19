import 'package:crud/screens/add_pessoa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/pessoa.dart';

void main() {
  runApp(const CrudApp());
}

class CrudApp extends StatelessWidget {
  const CrudApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (_) => Dashboard(),
        'cadastrarPessoa': (_) => CadastrarPessoa(),
      },

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
        title: Text('CRUD'),
      ),
      body: DashBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('cadastrarPessoa'),
        child: Icon(
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
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.purple),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: PersonCard(
                pessoa: Pessoa('Guilherme', 'guilhermeandre@dnitservices.com'),
              ),
            ),
          ],
        ));
  }
}

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key? key,
    required this.pessoa,
  }) : super(key: key);
  final Pessoa pessoa;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 32,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pessoa.name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                pessoa.email,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 24,
              ))
        ],
      ),
    );
  }
}

