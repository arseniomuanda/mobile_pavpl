import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavpl_app/app/routing/route_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      print(MediaQuery.of(context).size.width);
      if (MediaQuery.of(context).size.width > 801) {
        //TODO: #5 criar aqui as telas para app da central de controle
        if (0 > 1) {
          Navigator.pushReplacementNamed(context, MRRoutes.tabletHome);
        } else {
          Navigator.pushReplacementNamed(context, MRRoutes.tabletLogin);
        }
      } else {
        if (0 > 1) {
          Navigator.pushReplacementNamed(context, MRRoutes.home);
        } else {
          Navigator.pushReplacementNamed(context, MRRoutes.login);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                //color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/tema/fundo_1.jpg"))),
          ),
          Center(
            child: Card(
                child: Text(
                    "Plataforma de Agendamento de Visitas do Sistema Penitenciário de Luanda",
                    style: GoogleFonts.acme(fontSize: 50),
                    textAlign: TextAlign.center)),
          )
        ],
      ),
    );
  }
}
