import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_pavpl/app/models/chart_data.dart';
import 'package:mobile_pavpl/providers/global_provider.dart';
import 'package:mobile_pavpl/widgets/assider_widget.dart';
import 'package:mobile_pavpl/widgets/menu/about_widget.dart';
import 'package:mobile_pavpl/widgets/menu/user_perfil_widget.dart';
import 'package:mobile_pavpl/widgets/menu_config_widget.dart';
import 'package:mobile_pavpl/widgets/reclusos_data_grid_widget.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';
import 'package:mobile_pavpl/widgets/visitante_perfil_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ConfigPage extends ConsumerWidget {
  final Size size;

  ConfigPage({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var index = ref.watch(menuState).index;
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
              child: Row(
                children: [
                  IndexedStack(
                    index: index,
                    children: [
                      AboutWidget(size: size),
                      UserPerfilWidget(size: size),
                      Text('Arsenio 3'),
                      Text('Arsenio 4'),
                      Text('Arsenio 5'),
                      Text('Arsenio 6'),
                    ],
                  ),
                  MenuConfigWidget(size: size)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
