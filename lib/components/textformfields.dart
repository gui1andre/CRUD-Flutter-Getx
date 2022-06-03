import 'package:flutter/material.dart';

class TextFieldFormLogin extends StatelessWidget {
  const TextFieldFormLogin(
      {Key? key,
      required this.textoCampo,
      required this.controler,
      required this.nomeCampo,
      required this.textInputType})
      : super(key: key);
  final String textoCampo;
  final TextEditingController controler;
  final String nomeCampo;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$textoCampo.';
          } else {
            return null;
          }
        },
        keyboardType: textInputType,
        controller: controler,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white),
          hintText: nomeCampo,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldCadastro extends StatelessWidget {
  const TextFormFieldCadastro(
      {Key? key,
      required this.menssagemErro,
      required this.textInputType,
      required this.controller,
      required this.nomeCampo})
      : super(key: key);
  final String menssagemErro;
  final TextInputType textInputType;
  final TextEditingController controller;
  final String nomeCampo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return menssagemErro;
          } else {
            return null;
          }
        },
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          hintText: nomeCampo,
        ),
      ),
    );
  }
}
