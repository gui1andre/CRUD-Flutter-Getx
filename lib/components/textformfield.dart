import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm(
      {Key? key,
      required this.textoCampo,
      required this.controler,
      required this.nomeCampo})
      : super(key: key);
  final String textoCampo;
  final TextEditingController controler;
  final String nomeCampo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: SizedBox(
        width: 350,
        child: TextFormField(
          style: TextStyle(
            color: Colors.white
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$textoCampo.';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          controller: controler,
          decoration: InputDecoration(
            hintText: nomeCampo,
          ),
        ),
      ),
    );
  }
}
