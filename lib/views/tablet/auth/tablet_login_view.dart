import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pavpl/app/routing/route_handler.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';

class TabletLoginPage extends StatefulWidget {
  const TabletLoginPage({super.key});

  @override
  State<TabletLoginPage> createState() => _TabletLoginPageState();
}

class _TabletLoginPageState extends State<TabletLoginPage> {
  final biController = TextEditingController();
  final passController = TextEditingController();
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
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Row(
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
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, MRRoutes.passRecover),
                              child: const Text("Esqueceu a Palavra Pass?"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () =>
                                      Navigator.pushReplacementNamed(
                                          context, MRRoutes.home),
                                  child: Text(
                                    "Logar",
                                    style: GoogleFonts.acme(fontSize: 20),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
