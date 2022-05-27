import 'package:crud/screens/add_pessoa.dart';
import 'package:crud/screens/atualizarcadastro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(const CrudApp());
}

class CrudApp extends StatelessWidget {
  const CrudApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Login()),
        GetPage(name: '/dashboard', page: () => const Dashboard()),
        GetPage(name: '/cadastrarPessoa', page: () => const CadastrarPessoa()),
        GetPage(name: '/atualizarPessoa', page: () => const AtualizarPessoa()),
      ],
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(999, 59, 149, 254),
                Colors.indigo,

              ],
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 118,
                  height: 118,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Color.fromARGB(999, 59, 149, 254),
                    size: 90,
                  ),
                ),
                Form(child: Column(
                  children: [TextFormField(),
                  TextFormField(),
                  ],
                ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
