import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_pavpl/app/models/chart_data.dart';
import 'package:mobile_pavpl/providers/global_provider.dart';
import 'package:mobile_pavpl/widgets/assider_widget.dart';
import 'package:mobile_pavpl/widgets/menu_config_widget.dart';
import 'package:mobile_pavpl/widgets/reclusos_data_grid_widget.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';
import 'package:mobile_pavpl/widgets/visitante_perfil_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ConfigPage extends ConsumerWidget {
  final Size size;
  final codController = TextEditingController();

  ConfigPage({
    super.key,
    required this.size,
  });

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
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.4,
                  ),
                  const Spacer(),
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
