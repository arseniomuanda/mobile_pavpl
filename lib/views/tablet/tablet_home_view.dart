import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pavpl/providers/global_provider.dart';
import 'package:mobile_pavpl/widgets/visitas_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TabletHomePage extends ConsumerStatefulWidget {
  TabletHomePage({super.key});

  @override
  _TabletHomePageState createState() => _TabletHomePageState();
}

class _TabletHomePageState extends ConsumerState<TabletHomePage> {
  bool? encontrado;
  late TooltipBehavior _tooltip;
  late TabController _tabController;

  TextStyle fonte(BuildContext context, {bool isButton = false}) =>
      GoogleFonts.akatab(
          fontWeight: FontWeight.bold,
          color: isButton
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.primary,
          fontSize: 15);

  @override
  Widget build(BuildContext context) {
    var _homeState = ref.watch(homeState);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: PageView(
        controller: _homeState.homePageController,
        onPageChanged: _homeState.changeBottomIndex,
        children: [
          VisitasPage(size: size),
          Container(
            color: Colors.red,
            width: 400,
            height: 300,
          )
        ],
      ),
    );
  }
}
