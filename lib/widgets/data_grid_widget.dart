import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pavpl/app/core/consts.dart';
import 'package:mobile_pavpl/app/helpers/dummy_data.dart';
import 'package:mobile_pavpl/providers/recluso_provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataGridWidget extends ConsumerStatefulWidget {
  const DataGridWidget({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  _DataGridWidgetState createState() => _DataGridWidgetState();
}

class _DataGridWidgetState extends ConsumerState<DataGridWidget> {
  final _faker = Faker();

  late final ReclusosDataSource _employeeDataSource;
  final int rowsPerPage = 10;

  @override
  void initState() {
    _employeeDataSource = ReclusosDataSource(reclusos: visitas);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: constraints.maxHeight - 60,
            width: constraints.maxWidth,
            child: SfDataGrid(
                gridLinesVisibility: GridLinesVisibility.none,
                headerGridLinesVisibility: GridLinesVisibility.none,
                headerRowHeight: 40,
                allowSorting: false,
                allowTriStateSorting: false,
                showSortNumbers: false,
                selectionMode: SelectionMode.single,
                onSelectionChanged: (addedRows, removedRows) {
                  if (ref.read(reclusoProvider).name !=
                      addedRows.first.getCells()[1].value) {
                    setState(() {
                      ref.read(reclusoProvider.notifier).update((state) =>
                          presos
                              .where((element) =>
                                  element.name ==
                                  addedRows.first.getCells()[1].value)
                              .first);
                    });
                  }
                },
                columnWidthMode: ColumnWidthMode.fill,
                rowsPerPage: rowsPerPage,
                source: _employeeDataSource,
                columns: [
                  GridColumn(
                    columnName: 'nome',
                    label: Text(
                      'Nome do Visitante',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  GridColumn(
                      columnName: 'nome_prisioneiro',
                      label: Text(
                        'Nome do Prisioneiro',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                      )),
                  GridColumn(
                    columnName: 'entrada',
                    label: Text(
                      'Hora de Entrada',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  GridColumn(
                    columnName: 'saida',
                    label: Text(
                      'Hora de Saida',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ]),
          ),
          Center(
            child: SizedBox(
                height: 60,
                width: constraints.maxWidth,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: SfDataPagerTheme(
                    data: SfDataPagerThemeData(
                      backgroundColor: Colors.white,
                      itemBorderRadius: BorderRadius.circular(5),
                      itemTextStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.black),
                      selectedItemColor: Theme.of(context).colorScheme.primary,
                      selectedItemTextStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                      itemColor: Colors.grey[200],
                    ),
                    child: SfDataPager(
                      delegate: _employeeDataSource,
                      pageCount: visitas.length / rowsPerPage,
                      visibleItemsCount: 10,
                      direction: Axis.horizontal,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class ReclusosDataSource extends DataGridSource {
  ReclusosDataSource({List<Visita>? reclusos}) {
    _reclusos = reclusos!
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'nome', value: e.nameOfVisitor!),
              DataGridCell<String>(
                  columnName: 'nome_prisioneiro',
                  value: presos
                      .where(
                          (element) => element.id == int.parse(e.idOfPrisoner!))
                      .first
                      .name!),
              DataGridCell<String>(
                  columnName: 'entrada', value: formatHour(e.arrivalTime!)),
              DataGridCell<String>(
                  columnName: 'saida', value: formatHour(e.leftAt!)),
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

String formatHour(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final dt =
      DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  final format = DateFormat.jm(); //"6:00 AM"
  return format.format(dt);
}
