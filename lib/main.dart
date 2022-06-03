import 'package:crud/screens/add_pessoa.dart';
import 'package:crud/screens/atualizarcadastro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/textformfields.dart';
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
        GetPage(name: '/', page: () => Login()),
        GetPage(name: '/dashboard', page: () => const Dashboard()),
        GetPage(name: '/cadastrarPessoa', page: () => const CadastrarPessoa()),
        GetPage(name: '/atualizarPessoa', page: () => const AtualizarPessoa()),
      ],
    );
  }
}

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 130),
                  child: Container(
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
                ),
                Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 48, 0, 16),
                        child: TextFieldFormLogin(
                          controler: loginController,
                          textoCampo: 'Preencher o Login',
                          nomeCampo: 'Login',
                          textInputType: TextInputType.emailAddress,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: TextFieldFormLogin(
                          controler: senhaController,
                          textoCampo: 'Preencher a Senha',
                          nomeCampo: 'Senha',
                          textInputType: TextInputType.visiblePassword,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.offNamed('dashboard');
                            // if (_verificarLogin(
                            //     loginController, senhaController)) {
                            //   Get.offNamed('dashboard');
                            // } else {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(
                            //     content: Text("Login ou Senha Invalidos!"),
                            //   ),
                            // );
                            // }
                            
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue.shade500),
                          child: const Text('Efetuar Login'))
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

  bool _verificarLogin(
      TextEditingController usuario, TextEditingController senha) {
    if (usuario.text == 'guilherme' && senha.text == '123') {
      return true;
    }
    return false;
  }
}
