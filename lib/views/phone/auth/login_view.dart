import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pavpl/app/routing/route_handler.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final biController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/tema/fundo_1.jpg"))),
          ),
          Center(
            child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lock,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text("Login",
                              style: GoogleFonts.acme(fontSize: 40),
                              textAlign: TextAlign.center),
                        ],
                      ),
                      MRTextField(
                        controller: biController,
                        label: "BI",
                        hint: "123456789AZ123",
                      ),
                      MRTextField(
                        isPassword: true,
                        controller: passController,
                        label: "Palavra Pass",
                        hint: "****",
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => Navigator.pushNamed(
                                context, MRRoutes.passRecover),
                            child: const Text("Esqueceu a Palavra Pass?"),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                  style: GoogleFonts.acme(
                                      fontSize: 14, color: Colors.black),
                                  text: 'Não tem conta? ',
                                  children: [
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => Navigator.pushNamed(
                                              context, MRRoutes.register),
                                        text: "CRIAR CONTA",
                                        style: GoogleFonts.acme(
                                            fontSize: 14,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary))
                                  ]),
                            ),
                            const Spacer(),
                            ElevatedButton(
                                onPressed: () => Navigator.pushReplacementNamed(
                                    context, MRRoutes.home),
                                child: Text(
                                  "Logar",
                                  style: GoogleFonts.acme(fontSize: 20),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
