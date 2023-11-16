import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pavpl/app/routing/route_handler.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final biController = TextEditingController();
  final nameController = TextEditingController();
  final nascController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final pass1Controller = TextEditingController();
  final pass2Controller = TextEditingController();

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
          SingleChildScrollView(
            child: Center(
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
                          Icons.person,
                          size: 35,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Text("Nova Conta",
                            style: GoogleFonts.acme(fontSize: 35),
                            textAlign: TextAlign.center),
                      ],
                    ),
                    MRTextField(
                      controller: biController,
                      label: "BI",
                      hint: "123456789AZ123",
                    ),
                    MRTextField(
                      readOnly: true,
                      isEnabled: true,
                      controller: nameController,
                      label: "Nome",
                      hint: "Exemplo Paulo",
                    ),
                    MRTextField(
                      readOnly: true,
                      isEnabled: true,
                      controller: nascController,
                      label: "Data de nascimento",
                      hint: "YYYY/MM/DD",
                    ),
                    MRTextField(
                      controller: emailController,
                      label: "Email",
                      hint: "exemplo@emp.com",
                    ),
                    MRTextField(
                      isNumeber: true,
                      controller: phoneController,
                      label: "Telefone",
                      hint: "999999999",
                    ),
                    MRTextField(
                      isPassword: true,
                      controller: pass1Controller,
                      label: "Palavra pass",
                      hint: "****",
                    ),
                    MRTextField(
                      isPassword: true,
                      controller: pass2Controller,
                      label: "Repetir Palavra pass",
                      hint: "****",
                    ),
                    ElevatedButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, MRRoutes.login),
                        child: Text(
                          "Avançar",
                          style: GoogleFonts.acme(fontSize: 20),
                        ))
                  ],
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
