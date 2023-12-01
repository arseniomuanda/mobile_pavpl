import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pavpl/app/routing/route_handler.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';

class TabletHomePage extends StatefulWidget {
  TabletHomePage({super.key});

  @override
  State<TabletHomePage> createState() => _TabletHomePageState();
}

class _TabletHomePageState extends State<TabletHomePage> {
  final codController = TextEditingController();

  bool? encontrado;

  TextStyle fonte(BuildContext context, {bool isButton = false}) =>
      GoogleFonts.acme(
          color: isButton
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.primary,
          fontSize: 15);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(60))),
                height: size.height,
                width: size.width * 0.06,
                child:Column(

                  children:[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                          ),
                          onPressed: (){}, child: Column(children: [
                        const Icon(Icons.home_filled),
                        Text('Início', style: fonte(context, isButton: true))
                      ],)),
                    )
                  ]
                )
              ),
              Expanded(
                child: Container(
                  height: size.height,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: size.width * 0.3,
                          child: MRTextField(
                            borderRadius: 60,
                            prefixIcon: const Icon(Icons.search),
                            suffixIconButton: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  if (encontrado == null) {
                                    encontrado = false;
                                  } else if (!encontrado!) {
                                    encontrado = true;
                                  } else {
                                    encontrado = null;
                                  }
                                });
                              },
                            ),
                            label: 'Pesuisar recluso',
                            hint: '',
                            controller: codController,
                            isNumeber: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
