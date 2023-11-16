import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pavpl/app/routing/route_handler.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final biController = TextEditingController();
  final nameController = TextEditingController();
  final nascController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final pass1Controller = TextEditingController();
  final pass2Controller = TextEditingController();

  @override
  void initState() {
    biController.text = "98359487934DS484";
    nameController.text = "Arsénio Mululunga";
    nascController.text = "09/04/1998";
    phoneController.text = "9999999999";
    emailController.text = "exemple@ars.com";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SingleChildScrollView(
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
                    Text("Arsénio Mululunga",
                        style: GoogleFonts.acme(fontSize: 35),
                        textAlign: TextAlign.center),
                  ],
                ),
                MRTextField(
                  readOnly: true,
                  isEnabled: true,
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
                  readOnly: true,
                  isEnabled: true,
                  controller: emailController,
                  label: "Email",
                  hint: "exemplo@emp.com",
                ),
                MRTextField(
                  readOnly: true,
                  isEnabled: true,
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
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, MRRoutes.login),
                    child: Text(
                      "Avançar",
                      style: GoogleFonts.acme(fontSize: 20),
                    ))
              ],
            ),
          )),
        ),
      ),
    );
  }
}
