import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final Size size;

  AboutPage({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: size.width * 0.6,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Nome da Empresa',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Versão: 1.0.0',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Resumo:',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          // Adicione mais informações conforme necessário
        ],
      ),
    );
  }
}
