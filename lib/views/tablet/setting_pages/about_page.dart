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
            'Plataforma de Agendamento de Visitas à reclusos do Sistema Penitenciário de Luanda',
            textAlign: TextAlign.center,
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
            'A Plataforma de Agendamento de Visitas à reclusos do Sistema Penitenciário de Luanda é um serviço online que permite aos familiares e amigos dos presos marcar as suas visitas de forma rápida e fácil. O objetivo é facilitar o contato entre os reclusos e os seus entes queridos, garantindo a segurança e a ordem nas unidades prisionais Para utilizar a plataforma, é necessário fazer um cadastro prévio, informando os dados pessoais e o número do processo do recluso que se pretende visitar',
            textAlign: TextAlign.center,
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
