import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_pavpl/providers/global_provider.dart';
import 'package:mobile_pavpl/widgets/assider_widget.dart';
import 'package:mobile_pavpl/widgets/data_grid_widget.dart';
import 'package:mobile_pavpl/widgets/recloso_perfil_widget.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';
import 'package:mobile_pavpl/widgets/visitante_perfil_widget.dart';


class ReclusoPage extends ConsumerWidget {
  final Size size;
  final codController = TextEditingController();

  ReclusoPage({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Row(
        children: [
          AsiderWidget(size: size,),
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

                            label: 'Pesuisar recluso',
                            hint: '',
                            controller: codController,
                            isNumeber: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 60),
                      ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 60)
                      ), child: const Text('Adicionar Recluso', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),))
                    ],
                  ),
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            "List de Reclusos",
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
                        child: DataGridWidget(size: size),
                      )),
                ],
              ),
            ),
          ),
          if (ref.watch(prisonerProvider).id != null) ...[
            ReclusoWidget(
              size: size, preso: null,
            ),
          ]
        ],
      ),
    );
  }
}