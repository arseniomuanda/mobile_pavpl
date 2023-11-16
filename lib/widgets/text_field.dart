import 'package:flutter/material.dart';

class MRTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final bool isPassword;
  final Icon? suffixIcon;
  final IconButton? suffixIconButton;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final String? initialValue;
  final bool? readOnly, isEnabled;
  final bool isNumeber;
  final int linhas;

  const MRTextField.editable(
      {this.initialValue,
      this.label,
      this.isNumeber = false,
      this.readOnly,
      this.suffixIcon,
      this.suffixIconButton,
      this.isEnabled,
      this.controller,
      this.linhas = 1})
      : hint = null,
        validator = null,
        isPassword = false;

  const MRTextField(
      {Key? key,
      required this.controller,
      this.label,
      this.validator,
      this.isNumeber = false,
      this.hint,
      this.suffixIcon,
      this.isPassword = false,
      this.readOnly = false,
      this.isEnabled = true,
      this.linhas = 1,
      this.initialValue,
      this.suffixIconButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          enabled: isEnabled,
          minLines: 1,
          maxLines: linhas,
          obscureText: isPassword,
          controller: controller,
          initialValue: initialValue,
          validator: validator,
          readOnly: readOnly!,
          keyboardType: isNumeber ? TextInputType.number : null,
          decoration: InputDecoration(
            suffixIcon: suffixIcon ?? (suffixIconButton),
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
