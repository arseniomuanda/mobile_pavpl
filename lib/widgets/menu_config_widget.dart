import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_pavpl/app/data/dummy_data.dart';
import 'package:mobile_pavpl/providers/global_provider.dart';

class MenuConfigWidget extends ConsumerWidget {
  MenuConfigWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        color: Colors.grey[50],
        width: size.width * 0.2,
        height: size.height,
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Menu',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.7),
                  )),
              const Divider(color: Colors.black),
              const SizedBox(height: 40),
              ListTile(
                //onTap: () => _homeState.changeBottomIndex(0),
                  textColor: Colors.grey,
                  iconColor: Theme.of(context).colorScheme.primary,
                  leading: const Icon(
                    EvaIcons.personOutline,
                  ),
                  title: Text(
                      'Meu Perfil',
                      style: TextStyle(color: Theme.of(context).colorScheme.primary)
                  )),
              ListTile(
                  //onTap: () => _homeState.changeBottomIndex(0),
                  textColor: Colors.grey,
                  iconColor: Theme.of(context).colorScheme.primary,
                  leading: const Icon(
                    EvaIcons.infoOutline,
                  ),
                  title: Text(
                    'Sobre',
                    style: TextStyle(color: Theme.of(context).colorScheme.primary)
                  )),
              ListTile(
                //onTap: () => _homeState.changeBottomIndex(0),
                  textColor: Colors.grey,
                  iconColor: Theme.of(context).colorScheme.primary,
                  leading: const Icon(
                    EvaIcons.pr,
                  ),
                  title: Text(
                      'Celas',
                      style: TextStyle(color: Theme.of(context).colorScheme.primary)
                  )),
              ListTile(
                //onTap: () => _homeState.changeBottomIndex(0),
                  textColor: Colors.grey,
                  iconColor: Theme.of(context).colorScheme.primary,
                  leading: const Icon(
                    EvaIcons.gridOutline,
                  ),
                  title: Text(
                      'Acessos',
                      style: TextStyle(color: Theme.of(context).colorScheme.primary)
                  )),
              ListTile(
                //onTap: () => _homeState.changeBottomIndex(0),
                  textColor: Colors.grey,
                  iconColor: Theme.of(context).colorScheme.primary,
                  leading: const Icon(
                    EvaIcons.gridOutline,
                  ),
                  title: Text(
                      'Utilizadores',
                      style: TextStyle(color: Theme.of(context).colorScheme.primary)
                  )),
            ],
          ),
        ),
      ),
    );
  }
}