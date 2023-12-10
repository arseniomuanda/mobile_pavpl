import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_pavpl/app/models/chart_data.dart';
import 'package:mobile_pavpl/providers/global_provider.dart';
import 'package:mobile_pavpl/widgets/assider_widget.dart';
import 'package:mobile_pavpl/widgets/reclusos_data_grid_widget.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';
import 'package:mobile_pavpl/widgets/visitante_perfil_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashbordPage extends ConsumerWidget {
  final Size size;
  final codController = TextEditingController();

  DashbordPage({
    super.key,
    required this.size,
  });

  final List<ChartData> chartData = [
    ChartData('David', 25),
    ChartData('Steve', 38),
    ChartData('Jack', 34),
    ChartData('Others', 52)
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
                          series: <ChartSeries>[
                            SplineAreaSeries<SalesData, String>(
                              dataSource: <SalesData>[
                                SalesData('Jan', 30),
                                SalesData('Feb', 50),
                                SalesData('Mar', 40),
                                SalesData('Apr', 60),
                                SalesData('May', 80),
                                SalesData('Jun', 70),
                                SalesData('Jul', 55),
                                SalesData('Aug', 70),
                                SalesData('Sep', 43),
                                SalesData('Oct', 65),
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
