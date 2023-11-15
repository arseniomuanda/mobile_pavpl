import 'package:flutter/material.dart';

class MRTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final String? initialValue;
  final bool? readOnly;
  final bool isNumeber;
  final int linhas;

  MRTextField.editable(
      {this.initialValue, this.label, this.isNumeber = false, this.readOnly, this.controller, this.linhas = 1})
      : hint = null,
        validator = null,
        isPassword = false;

  const MRTextField(
      {Key? key,
      required this.controller,
      this.label,
      this.validator,
        this.isNumeber= false,
      this.hint,
      this.isPassword = false,
      this.readOnly = false, this.linhas = 1, this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          minLines: 1,
          maxLines: linhas,
          obscureText: isPassword,
          controller: controller,
          initialValue: initialValue,
          validator: validator,
          readOnly: readOnly!,
          keyboardType: isNumeber ? TextInputType.number : null,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              gapPadding: 5,
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 0.2,
                style: BorderStyle.none,
              ),
            ),
            labelText: label,
            hintText: hint,
          ),
        ),
      ),
    );
  }
}
