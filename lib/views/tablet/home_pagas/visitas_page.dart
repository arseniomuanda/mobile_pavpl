import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pavpl_app/providers/global_provider.dart';
import 'package:pavpl_app/widgets/assider_widget.dart';
import 'package:pavpl_app/widgets/reclusos_data_grid_widget.dart';
import 'package:pavpl_app/widgets/text_field.dart';
import 'package:pavpl_app/widgets/visitante_perfil_widget.dart';
import 'package:pavpl_app/widgets/visitas_data_grid_widget.dart';


class VisitasPage extends ConsumerWidget {
  final Size size;
  final codController = TextEditingController();

  VisitasPage({
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
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            "Lista de visitas",
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
                        child: VisitasDataGridWidget(size: size),
                      )),
                ],
              ),
            ),
          ),
          if (ref.watch(visitaProvider).id != null) ...[
            VisitaWidget(
              size: size,
              visita: ref.watch(visitaProvider),
            ),
          ]
        ],
      ),
    );
  }
}