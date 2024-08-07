import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavpl_app/providers/global_provider.dart';
import 'package:pavpl_app/views/tablet/home_pagas/agendamento_page.dart';
import 'package:pavpl_app/views/tablet/setting_pages/config_page.dart';
import 'package:pavpl_app/views/tablet/home_pagas/dashboard_page.dart';
import 'package:pavpl_app/views/tablet/home_pagas/reclusos_page.dart';
import 'package:pavpl_app/views/tablet/home_pagas/visitas_page.dart';
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
      body: SafeArea(
        child: PageView(
          pageSnapping: false,
          controller: _homeState.homePageController,
          onPageChanged: _homeState.changeBottomIndex,
          children: [
            DashbordPage(size: size),
            ReclusoPage(size: size),
            VisitasPage(size: size),
            AgendamentoPage(size: size),
            ConfigPage(size: size)
          ],
        ),
      ),
    );
  }
}
