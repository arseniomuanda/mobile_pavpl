import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pavpl/app/core/consts.dart';
import 'package:mobile_pavpl/app/data/dummy_data.dart';
import 'package:mobile_pavpl/providers/global_provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BlocosDataGridWidget extends ConsumerStatefulWidget {
  const BlocosDataGridWidget({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  _BlocoDataGridWidgetState createState() => _BlocoDataGridWidgetState();
}

class _BlocoDataGridWidgetState extends ConsumerState<BlocosDataGridWidget> {
  late final BlocosDataSource _listDataSource;
  final int rowsPerPage = 10;

  @override
  void initState() {
    _listDataSource = BlocosDataSource(blocos: blocos);
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
                },
                columnWidthMode: ColumnWidthMode.fill,
                rowsPerPage: rowsPerPage,
                source: _listDataSource,
                columns: [
                  GridColumn(
                    columnName: 'id',
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
                  )
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
                      pageCount: (blocos.length / rowsPerPage).ceilToDouble(),
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

class BlocosDataSource extends DataGridSource {
  BlocosDataSource({List<Bloco>? blocos}) {
    _blocos = blocos!
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'nome', value: e.name),
            ]))
        .toList();
  }

  List<DataGridRow> _blocos = [];
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
      cells: row.getCells().map<Widget>((e) {return Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }

  @override
  List<DataGridRow> get rows => _blocos;
}
