import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataGridWidget extends StatefulWidget {
  const DataGridWidget({Key? key}) : super(key: key);

  @override
  _DataGridWidgetState createState() => _DataGridWidgetState();
}

class _DataGridWidgetState extends State<DataGridWidget> {
  final _reclusos = <Recluso>[];
  final _faker = Faker();
  late final ReclusosDataSource _employeeDataSource;

  Future populateData() async {
    for (int i = 0; i < 100; i++) {
      _reclusos.add(
        Recluso(
          id: i + 1,
          name: _faker.person.name(),
          designation: _faker.job.title(),
          salary: _faker.randomGenerator
              .decimal(min: 1000, scale: 2)
              .roundToDouble(),
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
    return Expanded(
        child: SfDataGrid(
            columnWidthMode: ColumnWidthMode.fill,
            rowsPerPage: 20,
            source: _employeeDataSource,
            columns: [
          GridColumn(
              columnName: 'id',
              label: const Center(
                child: Text(
                  'ID',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
          GridColumn(
              columnName: 'name',
              label: const Center(
                  child: Text('Name',
                      style: TextStyle(fontWeight: FontWeight.bold)))),
          GridColumn(
              columnName: 'designation',
              label: const Center(
                child: Text('Designation',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              )),
          GridColumn(
              columnName: 'salary',
              label: const Center(
                child: Text('Salary',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              )),
        ]));
  }
}

class ReclusosDataSource extends DataGridSource {
  ReclusosDataSource({List<Recluso>? reclusos}) {
    _reclusos = reclusos!
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<double>(columnName: 'salary', value: e.salary),
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
  String? designation;
  double? salary;

  Recluso({this.id, this.name, this.designation, this.salary});
}
