import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pavpl_app/app/core/consts.dart';
import 'package:pavpl_app/app/data/dummy_data.dart';
import 'package:pavpl_app/providers/global_provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReclusosDataGridWidget extends ConsumerStatefulWidget {
  const ReclusosDataGridWidget({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  _ReclusosDataGridWidgetState createState() => _ReclusosDataGridWidgetState();
}

class _ReclusosDataGridWidgetState extends ConsumerState<ReclusosDataGridWidget> {
  final _faker = Faker();

  late final ReclusosDataSource _listDataSource;
  final int rowsPerPage = 10;

  @override
  void initState() {
    _listDataSource = ReclusosDataSource(reclusos: presos);
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

                  ref
                      .read(prisonerProvider.notifier)
                      .update((state) => Prisoner());

                  Future.delayed(const Duration(seconds: 1)).then((value){
                    print(addedRows.first.getCells()[1].value);
                    if (ref.read(prisonerProvider).id !=
                        addedRows.first.getCells()[1].value) {
                      setState(() {
                        ref.read(prisonerProvider.notifier).update((state) =>
                        addedRows.first.getCells()[1].value);
                      });
                    }
                  });


                },
                columnWidthMode: ColumnWidthMode.fill,
                rowsPerPage: rowsPerPage,
                source: _listDataSource,
                columns: [
                  GridColumn(
                    width: 70,
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
                      'Nome',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  GridColumn(
                      columnName: 'nome_prisioneiro',
                      label: Text(
                        'Crime',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                      )),
                  GridColumn(
                    columnName: 'entryDay',
                    label: Text(
                      'Dia de entrada',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  GridColumn(
                    columnName: 'outDay',
                    label: Text(
                      'Dia de saída',
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

class ReclusosDataSource extends DataGridSource {
  ReclusosDataSource({List<Prisoner>? reclusos}) {
    _reclusos = reclusos!
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(
                  columnName: 'id', value: reclusos.indexOf(e) + 1),
              DataGridCell<Prisoner>(columnName: 'nome', value: e),
              DataGridCell<String>(
                  columnName: 'crime',
                  value: e.crime),
              DataGridCell<String>(
                  columnName: 'entryDay', value: formateDate2.format(e.entryDay!)),
              DataGridCell<String>(
                  columnName: 'dayOut', value: formateDate2.format(e.dayOut!)),
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
          var preso = e.value as Prisoner;
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(backgroundImage: NetworkImage(preso.photo!)),
              const SizedBox(width: 10,),
              Text(preso.name!)
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
