import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pavpl_app/providers/global_provider.dart';
import 'package:pavpl_app/views/tablet/setting_pages/acessos_page.dart';
import 'package:pavpl_app/views/tablet/setting_pages/blocos_page.dart';
import 'package:pavpl_app/views/tablet/setting_pages/celas_page.dart';
import 'package:pavpl_app/views/tablet/setting_pages/user_list_page.dart';
import 'package:pavpl_app/views/tablet/setting_pages/user_perfil_page.dart';
import 'package:pavpl_app/widgets/assider_widget.dart';
import 'package:pavpl_app/views/tablet/setting_pages/about_page.dart';
import 'package:pavpl_app/widgets/settings/menu_config_widget.dart';

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
                      AboutPage(size: size),
                      UserPerfilPage(size: size),
                      BlocosPage(),
                      CelasPage(),
                      AcessoPage(),
                      UserListPage()
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
