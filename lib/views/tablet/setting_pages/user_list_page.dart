import 'package:flutter/material.dart';
import 'package:mobile_pavpl/widgets/settings/users_data_grid_widget.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';

class UserListPage extends StatefulWidget {
  UserListPage({super.key});

  @override
  State<UserListPage> createState() => _CelasPageState();
}

class _CelasPageState extends State<UserListPage> {
  var blocoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: size.width * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: size.height,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: size.width * 0.3,
                          child: MRTextField(
                            borderRadius: 60,
                            prefixIcon: const Icon(Icons.search),
                            label: 'Pesuisar utilizador',
                            hint: '',
                            controller: blocoController,
                            isNumeber: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 60),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(200, 60)),
                          child: const Text(
                            'Adicionar utilizador',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ))
                    ],
                  ),
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            "Lista de utilizadores",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: UserDataGridWidget(size: size),
                  )),
                ],
              ),
            ),
          ),
          // Adicione mais informações conforme necessário
        ],
      ),
    );
  }
}
