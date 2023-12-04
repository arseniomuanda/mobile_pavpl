import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  RichTextWidget({
    super.key,
    required this.descricao,
    required this.dado,
  });

  String? descricao;
  String? dado;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$descricao:',
            children: [
              TextSpan(
                text: ' $dado',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.withOpacity(0.6),
                ),
              )
            ],
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}