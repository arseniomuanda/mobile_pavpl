import 'package:flutter/material.dart';
import 'package:pavpl_app/widgets/settings/blocos_data_grid_widget.dart';
import 'package:pavpl_app/widgets/text_field.dart';
import 'package:pavpl_app/choices.dart' as choices;

class BlocosPage extends StatefulWidget {
  BlocosPage({super.key});

  @override
  State<BlocosPage> createState() => _BlocosPageState();
}

class _BlocosPageState extends State<BlocosPage> {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: size.width * 0.3,
                          child: MRTextField(
                            borderRadius: 60,
                            prefixIcon: const Icon(Icons.search),
                            label: 'Pesuisar Bloco',
                            hint: '',
                            controller: blocoController,
                            isNumeber: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 60),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(200, 60)),
                          child: const Text(
                            'Adicionar bloco',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ))
                    ],
                  ),
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            "Lista de Blocos",
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
                    child: BlocosDataGridWidget(size: size),
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
