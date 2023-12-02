import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pavpl/app/core/consts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataGridWidget extends StatefulWidget {
  const DataGridWidget({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  _DataGridWidgetState createState() => _DataGridWidgetState();
}

class _DataGridWidgetState extends State<DataGridWidget> {
  final _reclusos = <Recluso>[];
  final _faker = Faker();

  late final ReclusosDataSource _employeeDataSource;
  final int rowsPerPage = 30;
  Future populateData() async {
    for (int i = 0; i < 100; i++) {
      _reclusos.add(
        Recluso(
          id: i + 1,
          name: _faker.person.name(),
          entrada: DateFormat('dd-MM-yyyy hh:mm').parse(
            formateDate.format(
              DateTime.now(),
            ),
          ),
          saida: DateFormat('dd-MM-yyyy hh:mm').parse(
            formateDate.format(
              DateTime.now(),
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    populateData();
    _employeeDataSource = ReclusosDataSource(reclusos: _reclusos);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: constraints.maxWidth,
            height: constraints.minHeight - 60,
            child: SfDataGrid(
                gridLinesVisibility: GridLinesVisibility.both,
                headerGridLinesVisibility: GridLinesVisibility.both,
                allowSorting: true,
                allowTriStateSorting: true,
                showSortNumbers: true,
                columnWidthMode: ColumnWidthMode.fill,
                rowsPerPage: rowsPerPage,
                source: _employeeDataSource,
                columns: [
                  GridColumn(
                      columnName: 'id',
                      label: const Center(
                        child: Text(
                          'ID',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                  GridColumn(
                      columnName: 'name',
                      label: const Center(
                        child: Text(
                          'Name',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                  GridColumn(
                      columnName: 'name',
                      label: const Center(
                          child: Text('Name',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold)))),
                  GridColumn(
                      columnName: 'entrada',
                      label: const Center(
                        child: Text('Data Entrada',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )),
                  GridColumn(
                      columnName: 'saida',
                      label: const Center(
                        child: Text('Data Saida',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )),
                ]),
          ),
          SizedBox(
              height: 60,
              width: constraints.maxWidth,
              child: SfDataPager(
                delegate: _employeeDataSource,
                pageCount: _reclusos.length / rowsPerPage,
                visibleItemsCount: 3,
                direction: Axis.horizontal,
              ))
        ],
      ),
    );
  }
}

class ReclusosDataSource extends DataGridSource {
  ReclusosDataSource({List<Recluso>? reclusos}) {
    _reclusos = reclusos!
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<DateTime>(columnName: 'entrada', value: e.entrada),
              DataGridCell<DateTime>(columnName: 'saida', value: e.saida),
            ]))
        .toList();
  }

  List<DataGridRow> _reclusos = [];
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    Color getRowBackgroundColor() {
      final int index = effectiveRows.indexOf(row);
      if (index % 2 != 0) {
        return Colors.orange.withOpacity(0.1);
      }

      return Colors.transparent;
    }

    return DataGridRowAdapter(
      color: getRowBackgroundColor(),
      cells: row.getCells().map<Widget>((e) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }

  @override
  List<DataGridRow> get rows => _reclusos;
}

class Recluso {
  int? id;
  String? name;
  DateTime entrada;
  DateTime saida;

  Recluso({this.id, this.name, required this.entrada, required this.saida});
}
