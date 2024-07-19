import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pavpl_app/app/core/consts.dart';
import 'package:pavpl_app/app/data/dummy_data.dart';
import 'package:pavpl_app/providers/global_provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class VisitasDataGridWidget extends ConsumerStatefulWidget {
  const VisitasDataGridWidget({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  _VisitasDataGridState createState() => _VisitasDataGridState();
}

class _VisitasDataGridState extends ConsumerState<VisitasDataGridWidget> {
  final _faker = Faker();

  late final VisitaDataSource _listDataSource;
  final int rowsPerPage = 10;

  @override
  void initState() {
    _listDataSource = VisitaDataSource(reclusos: visitas);
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
                allowSorting: true,
                allowTriStateSorting: true,
                showSortNumbers: true,
                selectionMode: SelectionMode.single,
                onSelectionChanged: (addedRows, removedRows) {
                  print(addedRows.first.getCells()[1].value);
                  if (ref.read(visitaProvider).id !=
                      addedRows.first.getCells()[1].value) {
                    setState(() {
                      ref.read(visitaProvider.notifier).update((state) =>
                      addedRows.first.getCells()[1].value);
                    });
                  }
                },
                columnWidthMode: ColumnWidthMode.fill,
                rowsPerPage: rowsPerPage,
                source: _listDataSource,
                columns: [
                  GridColumn(
                    width: 50,
                    columnName: 'number',
                    label: Text(
                      '#',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  GridColumn(
                    columnName: 'nome',
                    label: Text(
                      'Nome do Visitante',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
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
                  padding: const EdgeInsets.symmetric(horizontal: 52.0),
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
                      delegate: _listDataSource,
                      pageCount: (visitas.length / rowsPerPage).ceilToDouble(),
                      visibleItemsCount: 6,
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

class VisitaDataSource extends DataGridSource {
  VisitaDataSource({List<Visita>? reclusos}) {
    _reclusos = reclusos!
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(
                  columnName: 'number', value: reclusos.indexOf(e) + 1),
              DataGridCell<Visita>(columnName: 'nome', value: e),
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
        if (e.columnName == 'nome') {
          var visita = e.value as Visita;
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(backgroundImage: NetworkImage(visita.photo!)),
              const SizedBox(width: 10,),
              Text(visita.nameOfVisitor!)
            ],
          );
        }
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
