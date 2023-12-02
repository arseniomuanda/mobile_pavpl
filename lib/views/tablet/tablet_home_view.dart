import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pavpl/app/models/chart_data.dart';
import 'package:mobile_pavpl/providers/global_provider.dart';
import 'package:mobile_pavpl/widgets/assider_widget.dart';
import 'package:mobile_pavpl/widgets/data_grid_widget.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';
import 'package:mobile_pavpl/widgets/visitante_perfil_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TabletHomePage extends ConsumerStatefulWidget {
  TabletHomePage({super.key});

  @override
  _TabletHomePageState createState() => _TabletHomePageState();
}

class _TabletHomePageState extends ConsumerState<TabletHomePage> {
  final codController = TextEditingController();
  bool? encontrado;
  late TooltipBehavior _tooltip;

  TextStyle fonte(BuildContext context, {bool isButton = false}) =>
      GoogleFonts.akatab(
          fontWeight: FontWeight.bold,
          color: isButton
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.primary,
          fontSize: 15);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        body: Padding(
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
                      Expanded(
                        flex: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Text(
                                "Relatorio de visitas",
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
              if (ref.watch(visitaProvider).id != null) ...[
                VisitaWidget(
                  size: size,
                  visita: ref.watch(visitaProvider),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
