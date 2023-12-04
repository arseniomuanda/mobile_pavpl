import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_pavpl/app/routing/route_handler.dart';
import 'package:mobile_pavpl/providers/global_provider.dart';

class AsiderWidget extends ConsumerWidget {
  const AsiderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context, ref) {
    var _homeState = ref.watch(homeState);
    return Expanded(
      flex: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
        ),
        height: size.height,
        width: size.width * 0.2,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.06,
            ),
            const FlutterLogo(
              size: 100,
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
              height: 15,
              thickness: 0.3,
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
                onTap: () => _homeState.changeBottomIndex(0),
                textColor: Colors.grey,
                iconColor: Theme.of(context).colorScheme.primary,
                leading: const Icon(
                  EvaIcons.gridOutline,
                ),
                title: Text(
                  'Dashboard',
                  style: _homeState.bottomIndex == 0
                      ? TextStyle(color: Theme.of(context).colorScheme.primary)
                      : null,
                )),
            ListTile(
                onTap: () => _homeState.changeBottomIndex(1),
                textColor: Colors.grey,
                iconColor: Theme.of(context).colorScheme.primary,
                leading: const Icon(
                  EvaIcons.personOutline,
                ),
                title: Text(
                  'Reclusos',
                  style: _homeState.bottomIndex == 1
                      ? TextStyle(color: Theme.of(context).colorScheme.primary)
                      : null,
                )),
            ListTile(
              onTap: () => _homeState.changeBottomIndex(2),
              textColor: Colors.grey,
              iconColor: Theme.of(context).colorScheme.primary,
              leading: const Icon(
                EvaIcons.list,
              ),
              title: Text('Visitas',
                  style: _homeState.bottomIndex == 2
                      ? TextStyle(color: Theme.of(context).colorScheme.primary)
                      : null),
            ),
            ListTile(
              onTap: () => _homeState.changeBottomIndex(3),
              textColor: Colors.grey,
              iconColor: Theme.of(context).colorScheme.primary,
              leading: const Icon(
                EvaIcons.calendarOutline,
              ),
              title: Text('Agendamento',
                  style: _homeState.bottomIndex == 3
                      ? TextStyle(color: Theme.of(context).colorScheme.primary)
                      : null),
            ),
            const Spacer(),
            ListTile(
              onTap: () => _homeState.changeBottomIndex(4),
              textColor: Colors.grey,
              iconColor: Theme.of(context).colorScheme.primary,
              leading: const Icon(
                EvaIcons.settingsOutline,
              ),
              title: Text('Configurações',
                  style: _homeState.bottomIndex == 4
                      ? TextStyle(color: Theme.of(context).colorScheme.primary)
                      : null),
            ),
            ListTile(
              textColor: Colors.grey,
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(
                        MRRoutes.tabletLogin, (route) => false)
                    .then((value) => _homeState.changeBottomIndex(0));
              },
              iconColor: Theme.of(context).colorScheme.primary,
              leading: const Icon(
                EvaIcons.logOutOutline,
              ),
              title: const Text(
                'Sair',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
