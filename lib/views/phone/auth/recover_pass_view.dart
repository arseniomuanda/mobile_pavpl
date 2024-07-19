import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavpl_app/widgets/text_field.dart';

class RecoverPassPage extends StatefulWidget {
  const RecoverPassPage({super.key});

  @override
  State<RecoverPassPage> createState() => _RecoverPassPageState();
}

class _RecoverPassPageState extends State<RecoverPassPage> {
  final constactController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock_open,
                        size: 25,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Text("Recuperação de senha",
                          style: GoogleFonts.acme(fontSize: 25),
                          textAlign: TextAlign.center),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MRTextField(
                    controller: constactController,
                    label: "Email ou Telefone",
                    hint: "exemple@com ou 999999999",
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Enviar",
                        style: GoogleFonts.acme(fontSize: 20),
                      ))
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
