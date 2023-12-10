import 'package:awesome_select/awesome_select.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mobile_pavpl/widgets/settings/acessos_data_grid_widget.dart';
import 'package:mobile_pavpl/widgets/settings/blocos_data_grid_widget.dart';
import 'package:mobile_pavpl/widgets/settings/celas_data_grid_widget.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';
import 'package:mobile_pavpl/choices.dart' as choices;

class AcessoPage extends StatefulWidget {
  AcessoPage({super.key});

  @override
  State<AcessoPage> createState() => _CelasPageState();
}

class _CelasPageState extends State<AcessoPage> {
  var blocoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: size.width * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
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
                        label: 'Pesuisar Acesso',
                        hint: '',
                        controller: blocoController,
                        isNumeber: true,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            "Lista de acessos",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AcessoDataGridWidget(size: size),
                  )),
                ],
              ),
            ),
          ),
          // Adicione mais informações conforme necessário
        ],
      ),
    );
  }
}
