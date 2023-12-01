import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pavpl/app/models/chart_data.dart';
import 'package:mobile_pavpl/app/routing/route_handler.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: SafeArea(
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(60))),
                  height: size.height,
                  width: size.width * 0.086,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 8),
                      child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              const Icon(
                                Icons.dashboard,
                                color: Colors.white,
                              ),
                              Text('Dashboard',
                                  style: fonte(context, isButton: true))
                            ],
                          )),
                    ),
                    const Divider(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              const Icon(
                                Icons.person_3,
                                color: Colors.white,
                              ),
                              Text('Gestão de Reclusos',
                                  textAlign: TextAlign.center,
                                  style: fonte(context, isButton: true))
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 8),
                      child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                              ),
                              Text('Gestão de agendamento',
                                  textAlign: TextAlign.center,
                                  style: fonte(context, isButton: true))
                            ],
                          )),
                    ),
                    const Spacer(),
                    const Divider(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              const Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              Text('Configurações',
                                  textAlign: TextAlign.center,
                                  style: fonte(context, isButton: true))
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 40),
                      child: InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, MRRoutes.tabletLogin),
                          child: const Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                          )),
                    ),
                  ])),
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
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.3,
                            child: SfCircularChart(
                                legend: const Legend(
                                    position: LegendPosition.bottom,
                                    isVisible: true),
                                series: <CircularSeries>[
                              // Render pie chart
                              PieSeries<ChartData, String>(

                                  dataLabelSettings: const DataLabelSettings(

                                    isVisible: true,
                                    // Define como os rótulos de dados são exibidos
                                    // Aqui, estamos mostrando o nome e o valor
                                    labelPosition: ChartDataLabelPosition.inside,
                                    labelAlignment: ChartDataLabelAlignment.top,
                                  ),
                                  dataSource: chartData,

                                  pointColorMapper: (ChartData data, _) => data.color,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  radius: '100%',
                                  // Segments will explode on tap
                                  explode: true,
                                  // First segment will be exploded on initial rendering
                                  explodeIndex: 1,
                                  groupMode: CircularChartGroupMode.point,
                                  // As the grouping mode is point, 2 points will be grouped
                                  groupTo: 4)
                            ]),
                          ),
                          SizedBox(
                            width: size.width * 0.3,
                            child: SfCircularChart(
                                legend: const Legend(
                                    position: LegendPosition.bottom,
                                    isVisible: true),
                                series: <CircularSeries>[
                                  // Render pie chart
                                  PieSeries<ChartData, String>(

                                      dataLabelSettings: const DataLabelSettings(

                                        isVisible: true,
                                        // Define como os rótulos de dados são exibidos
                                        // Aqui, estamos mostrando o nome e o valor
                                        labelPosition: ChartDataLabelPosition.inside,
                                        labelAlignment: ChartDataLabelAlignment.top,
                                      ),
                                      dataSource: chartData,

                                      pointColorMapper: (ChartData data, _) => data.color,
                                      xValueMapper: (ChartData data, _) => data.x,
                                      yValueMapper: (ChartData data, _) => data.y,
                                      radius: '100%',
                                      // Segments will explode on tap
                                      explode: true,
                                      // First segment will be exploded on initial rendering
                                      explodeIndex: 1,
                                      groupMode: CircularChartGroupMode.point,
                                      // As the grouping mode is point, 2 points will be grouped
                                      groupTo: 4)
                                ]),
                          ),
                          SizedBox(
                            width: size.width * 0.3,
                            child: SfCircularChart(
                                legend: const Legend(
                                    position: LegendPosition.bottom,
                                    isVisible: true),
                                series: <CircularSeries>[
                                  // Render pie chart
                                  PieSeries<ChartData, String>(

                                      dataLabelSettings: const DataLabelSettings(

                                        isVisible: true,
                                        // Define como os rótulos de dados são exibidos
                                        // Aqui, estamos mostrando o nome e o valor
                                        labelPosition: ChartDataLabelPosition.inside,
                                        labelAlignment: ChartDataLabelAlignment.top,
                                      ),
                                      dataSource: chartData,

                                      pointColorMapper: (ChartData data, _) => data.color,
                                      xValueMapper: (ChartData data, _) => data.x,
                                      yValueMapper: (ChartData data, _) => data.y,
                                      radius: '100%',
                                      // Segments will explode on tap
                                      explode: true,
                                      // First segment will be exploded on initial rendering
                                      explodeIndex: 1,
                                      groupMode: CircularChartGroupMode.point,
                                      // As the grouping mode is point, 2 points will be grouped
                                      groupTo: 4)
                                ]),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.3,
                            child: SfCircularChart(
                                legend: const Legend(
                                    position: LegendPosition.bottom,
                                    isVisible: true),
                                series: <CircularSeries>[
                                  // Render pie chart
                                  PieSeries<ChartData, String>(

                                      dataLabelSettings: const DataLabelSettings(

                                        isVisible: true,
                                        // Define como os rótulos de dados são exibidos
                                        // Aqui, estamos mostrando o nome e o valor
                                        labelPosition: ChartDataLabelPosition.inside,
                                        labelAlignment: ChartDataLabelAlignment.top,
                                      ),
                                      dataSource: chartData,

                                      pointColorMapper: (ChartData data, _) => data.color,
                                      xValueMapper: (ChartData data, _) => data.x,
                                      yValueMapper: (ChartData data, _) => data.y,
                                      radius: '100%',
                                      // Segments will explode on tap
                                      explode: true,
                                      // First segment will be exploded on initial rendering
                                      explodeIndex: 1,
                                      groupMode: CircularChartGroupMode.point,
                                      // As the grouping mode is point, 2 points will be grouped
                                      groupTo: 4)
                                ]),
                          ),
                          SizedBox(
                            width: size.width * 0.3,
                            child: SfCircularChart(
                                legend: const Legend(
                                    position: LegendPosition.bottom,
                                    isVisible: true),
                                series: <CircularSeries>[
                                  // Render pie chart
                                  PieSeries<ChartData, String>(

                                      dataLabelSettings: const DataLabelSettings(

                                        isVisible: true,
                                        // Define como os rótulos de dados são exibidos
                                        // Aqui, estamos mostrando o nome e o valor
                                        labelPosition: ChartDataLabelPosition.inside,
                                        labelAlignment: ChartDataLabelAlignment.top,
                                      ),
                                      dataSource: chartData,

                                      pointColorMapper: (ChartData data, _) => data.color,
                                      xValueMapper: (ChartData data, _) => data.x,
                                      yValueMapper: (ChartData data, _) => data.y,
                                      radius: '100%',
                                      // Segments will explode on tap
                                      explode: true,
                                      // First segment will be exploded on initial rendering
                                      explodeIndex: 1,
                                      groupMode: CircularChartGroupMode.point,
                                      // As the grouping mode is point, 2 points will be grouped
                                      groupTo: 4)
                                ]),
                          ),
                          SizedBox(
                            width: size.width * 0.3,
                            child: SfCircularChart(
                                legend: const Legend(
                                    position: LegendPosition.bottom,
                                    isVisible: true),
                                series: <CircularSeries>[
                                  // Render pie chart
                                  PieSeries<ChartData, String>(

                                      dataLabelSettings: const DataLabelSettings(

                                        isVisible: true,
                                        // Define como os rótulos de dados são exibidos
                                        // Aqui, estamos mostrando o nome e o valor
                                        labelPosition: ChartDataLabelPosition.inside,
                                        labelAlignment: ChartDataLabelAlignment.top,
                                      ),
                                      dataSource: chartData,

                                      pointColorMapper: (ChartData data, _) => data.color,
                                      xValueMapper: (ChartData data, _) => data.x,
                                      yValueMapper: (ChartData data, _) => data.y,
                                      radius: '100%',
                                      // Segments will explode on tap
                                      explode: true,
                                      // First segment will be exploded on initial rendering
                                      explodeIndex: 1,
                                      groupMode: CircularChartGroupMode.point,
                                      // As the grouping mode is point, 2 points will be grouped
                                      groupTo: 4)
                                ]),
                          ),
                        ],
                      )
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
