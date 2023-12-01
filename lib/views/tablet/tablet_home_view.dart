import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pavpl/app/models/chart_data.dart';
import 'package:mobile_pavpl/app/routing/route_handler.dart';
import 'package:mobile_pavpl/app/style/hexadecimal_color.dart';
import 'package:mobile_pavpl/widgets/data_grid_widget.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class TabletHomePage extends StatefulWidget {
  TabletHomePage({super.key});

  @override
  State<TabletHomePage> createState() => _TabletHomePageState();
}

class _TabletHomePageState extends State<TabletHomePage> {
  final codController = TextEditingController();
  bool? encontrado;
  late TooltipBehavior _tooltip;

  final List<ChartData> chartData = [
    ChartData('David', 25),
    ChartData('Steve', 38),
    ChartData('Jack', 34),
    ChartData('Others', 52)
  ];

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                flex: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                  ),
                  height: size.height,
                  width: size.width * 0.2,
                  child: Column(
                    children: [
                      const FlutterLogo(
                        size: 100,
                      ),
                      Divider(
                        color: Theme.of(context).colorScheme.primary,
                        height: 20,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      ListTile(
                          textColor: Colors.grey,
                          iconColor: Theme.of(context).colorScheme.primary,
                          leading: const Icon(
                            EvaIcons.gridOutline,
                          ),
                          title: const Text(
                            'Dashboard',
                          )),
                      ListTile(
                          textColor: Colors.grey,
                          iconColor: Theme.of(context).colorScheme.primary,
                          leading: const Icon(
                            EvaIcons.personOutline,
                          ),
                          title: const Text(
                            'Reclusos',
                          )),
                      ListTile(
                        textColor: Colors.grey,
                        iconColor: Theme.of(context).colorScheme.primary,
                        leading: const Icon(
                          EvaIcons.calendarOutline,
                        ),
                        title: Text(
                          'Agendamento',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      const Spacer(),
                      ListTile(
                        textColor: Colors.grey,
                        iconColor: Theme.of(context).colorScheme.primary,
                        leading: const Icon(
                          EvaIcons.settingsOutline,
                        ),
                        title: const Text(
                          'Configurações',
                        ),
                      ),
                      ListTile(
                        textColor: Colors.grey,
                        onTap: () {
                          // Navigator.of(context).pushNamedAndRemoveUntil(
                          //     RouteHandler.login, (route) => false);
                        },
                        iconColor: Theme.of(context).colorScheme.primary,
                        leading: const Icon(
                          EvaIcons.logOutOutline,
                        ),
                        title: const Text(
                          'Sair',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                      Expanded(child: DataGridWidget()),
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
