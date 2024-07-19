import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pavpl_app/app/helpers/text_helper.dart';
import 'package:pavpl_app/app/models/chart_data.dart';
import 'package:pavpl_app/providers/global_provider.dart';
import 'package:pavpl_app/widgets/assider_widget.dart';
import 'package:pavpl_app/widgets/reclusos_data_grid_widget.dart';
import 'package:pavpl_app/widgets/text_field.dart';
import 'package:pavpl_app/widgets/visitante_perfil_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashbordPage extends ConsumerWidget {
  final Size size;
  final codController = TextEditingController();

  DashbordPage({
    super.key,
    required this.size,
  });

  final List<ChartData> chartData = [
    ChartData('Visitas', 110),
    ChartData('Cancelamentos', 38),
    ChartData('Por Confirmar', 34)
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Row(
        children: [
          AsiderWidget(
            size: size,
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
                        label: 'Pesuisar recluso',
                        hint: '',
                        controller: codController,
                        isNumeber: true,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.3),
                  Column(
                    children: [
                      Text('Agendamento por estados', style: fonte2(context)),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.4,
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
                                        labelPosition:
                                            ChartDataLabelPosition.inside,
                                        labelAlignment: ChartDataLabelAlignment.top,
                                      ),
                                      dataSource: chartData,
                                      pointColorMapper: (ChartData data, _) =>
                                          data.color,
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
                          const Spacer(),
                          SizedBox(
                            width: size.width * 0.4,
                            child: SfCartesianChart(
                              legend: const Legend(
                                  position: LegendPosition.bottom, isVisible: true),
                              primaryXAxis: CategoryAxis(),
                              series: <CartesianSeries>[
                                SplineAreaSeries<SalesData, String>(
                                  dataSource: <SalesData>[
                                    SalesData('Jan', 10),
                                    SalesData('Feb', 50),
                                    SalesData('Mar', 50),
                                    SalesData('Apr', 10),
                                    SalesData('May', 80),
                                    SalesData('Jun', 0),
                                    SalesData('Jul', 75),
                                    SalesData('Aug', 70),
                                    SalesData('Sep', 3),
                                    SalesData('Oct', 15),
                                    SalesData('Nov', 25),
                                    SalesData('Dec', 75),
                                  ],
                                  name: 'Cancelamentos',
                                  xValueMapper: (SalesData sales, _) => sales.month,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                ),
                                SplineAreaSeries<SalesData, String>(
                                  name: 'Visitas',
                                  dataSource: <SalesData>[
                                    SalesData('Jan', 1),
                                    SalesData('Feb', 10),
                                    SalesData('Mar', 0),
                                    SalesData('Apr', 60),
                                    SalesData('May', 80),
                                    SalesData('Jun', 74),
                                    SalesData('Jul', 35),
                                    SalesData('Aug', 70),
                                    SalesData('Sep', 42),
                                    SalesData('Oct', 5),
                                    SalesData('Nov', 45),
                                    SalesData('Dec', 75),
                                  ],
                                  xValueMapper: (SalesData sales, _) => sales.month,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  //Row(
                  //  children: [
                  //    SizedBox(
                  //      width: size.width * 0.4,
                  //      child: SfCircularChart(
                  //          legend: const Legend(
                  //              position: LegendPosition.bottom,
                  //              isVisible: true),
                  //          series: <CircularSeries>[
                  //            // Render pie chart
                  //            PieSeries<ChartData, String>(
                  //                dataLabelSettings: const DataLabelSettings(
                  //                  isVisible: true,
                  //                  // Define como os rótulos de dados são exibidos
                  //                  // Aqui, estamos mostrando o nome e o valor
                  //                  labelPosition:
                  //                      ChartDataLabelPosition.inside,
                  //                  labelAlignment: ChartDataLabelAlignment.top,
                  //                ),
                  //                dataSource: chartData,
                  //                pointColorMapper: (ChartData data, _) =>
                  //                    data.color,
                  //                xValueMapper: (ChartData data, _) => data.x,
                  //                yValueMapper: (ChartData data, _) => data.y,
                  //                radius: '100%',
                  //                // Segments will explode on tap
                  //                explode: true,
                  //                // First segment will be exploded on initial rendering
                  //                explodeIndex: 1,
                  //                groupMode: CircularChartGroupMode.point,
                  //                // As the grouping mode is point, 2 points will be grouped
                  //                groupTo: 4)
                  //          ]),
                  //    ),
                  //    const Spacer(),
                  //    SizedBox(
                  //      width: size.width * 0.4,
                  //      child: SfCircularChart(
                  //          legend: const Legend(
                  //              position: LegendPosition.bottom,
                  //              isVisible: true),
                  //          series: <CircularSeries>[
                  //            // Render pie chart
                  //            PieSeries<ChartData, String>(
                  //                dataLabelSettings: const DataLabelSettings(
                  //                  isVisible: true,
                  //                  // Define como os rótulos de dados são exibidos
                  //                  // Aqui, estamos mostrando o nome e o valor
                  //                  labelPosition:
                  //                      ChartDataLabelPosition.inside,
                  //                  labelAlignment: ChartDataLabelAlignment.top,
                  //                ),
                  //                dataSource: chartData,
                  //                pointColorMapper: (ChartData data, _) =>
                  //                    data.color,
                  //                xValueMapper: (ChartData data, _) => data.x,
                  //                yValueMapper: (ChartData data, _) => data.y,
                  //                radius: '100%',
                  //                // Segments will explode on tap
                  //                explode: true,
                  //                // First segment will be exploded on initial rendering
                  //                explodeIndex: 1,
                  //                groupMode: CircularChartGroupMode.point,
                  //                // As the grouping mode is point, 2 points will be grouped
                  //                groupTo: 4)
                  //          ]),
                  //    ),
                  //  ],
                  //)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
