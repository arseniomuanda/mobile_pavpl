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
    var index = ref.watch(menuState);
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
              Text('Opções',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.7),
                  )),
              const Divider(color: Colors.black),
              const SizedBox(height: 40),
              ListTile(
                onTap: () => index.changeIndex(0),
                  textColor: Colors.grey,
                  iconColor: Theme.of(context).colorScheme.primary,
                  leading: const Icon(
                    EvaIcons.infoOutline,
                  ),
                  title: Text(
                      'Sobre',
                      style: index.index == 0 ? TextStyle(color: Theme.of(context).colorScheme.primary): null
                  )),
              ListTile(
                  onTap: () => index.changeIndex(1),
                  textColor: Colors.grey,
                  iconColor: Theme.of(context).colorScheme.primary,
                  leading: const Icon(
                    EvaIcons.personOutline,
                  ),
                  title: Text(
                      'Meu Perfil',
                      style: index.index == 1 ? TextStyle(color: Theme.of(context).colorScheme.primary): null
                  )),
              ListTile(
                  onTap: () => index.changeIndex(2),
                  textColor: Colors.grey,
                  iconColor: Theme.of(context).colorScheme.primary,
                  leading: const Icon(
                    Icons.house_siding_sharp,
                  ),
                  title: Text(
                      'Blocos',
                      style: index.index == 2 ? TextStyle(color: Theme.of(context).colorScheme.primary): null
                  )),
              ListTile(
                  onTap: () => index.changeIndex(3),
                  textColor: Colors.grey,
                  iconColor: Theme.of(context).colorScheme.primary,
                  leading: const Icon(
                    Icons.grid_on,
                  ),
                  title: Text(
                      'Celas',
                      style: index.index == 3 ? TextStyle(color: Theme.of(context).colorScheme.primary): null
                  )),
              ListTile(
                  onTap: () => index.changeIndex(4),
                  textColor: Colors.grey,
                  iconColor: Theme.of(context).colorScheme.primary,
                  leading: const Icon(
                    EvaIcons.lockOutline,
                  ),
                  title: Text(
                      'Acessos',
                      style: index.index == 4 ? TextStyle(color: Theme.of(context).colorScheme.primary): null
                  )),
              ListTile(
                  onTap: () => index.changeIndex(5),
                  textColor: Colors.grey,
                  iconColor: Theme.of(context).colorScheme.primary,
                  leading: const Icon(
                    Icons.group_add_outlined,
                  ),
                  title: Text(
                      'Utilizadores',
                      style: index.index == 5 ? TextStyle(color: Theme.of(context).colorScheme.primary): null
                  )),
            ],
          ),
        ),
      ),
    );
  }
}