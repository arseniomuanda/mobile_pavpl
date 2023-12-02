import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class AsiderWidget extends StatelessWidget {
  const AsiderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
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
                textColor: Colors.grey,
                iconColor: Theme.of(context).colorScheme.primary,
                leading: const Icon(
                  EvaIcons.gridOutline,
                ),
                title: const Text(
                  'Dashboard',
                )),
            ListTile(
                textColor: Colors.grey,
                iconColor: Theme.of(context).colorScheme.primary,
                leading: const Icon(
                  EvaIcons.personOutline,
                ),
                title: const Text(
                  'Reclusos',
                )),
            ListTile(
              textColor: Colors.grey,
              iconColor: Theme.of(context).colorScheme.primary,
              leading: const Icon(
                EvaIcons.list,
              ),
              title: Text(
                'Visitas',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
            ListTile(
              textColor: Colors.grey,
              iconColor: Theme.of(context).colorScheme.primary,
              leading: const Icon(
                EvaIcons.calendarOutline,
              ),
              title: Text(
                'Agendamento',
              ),
            ),
            const Spacer(),
            ListTile(
              textColor: Colors.grey,
              iconColor: Theme.of(context).colorScheme.primary,
              leading: const Icon(
                EvaIcons.settingsOutline,
              ),
              title: const Text(
                'Configurações',
              ),
            ),
            ListTile(
              textColor: Colors.grey,
              onTap: () {
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //     RouteHandler.login, (route) => false);
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
