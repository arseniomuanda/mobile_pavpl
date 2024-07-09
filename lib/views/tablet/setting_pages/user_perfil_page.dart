import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select_clone/flutter_awesome_select.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';

class UserPerfilPage extends StatefulWidget {
  UserPerfilPage({super.key, required this.size});
  final Size size;

  @override
  State<UserPerfilPage> createState() => _UserPerfilPageState();
}

class _UserPerfilPageState extends State<UserPerfilPage> {
  List<S2Choice<String>> acessos = [
    S2Choice<String>(value: 'Admin', title: 'Admin'),
    S2Choice<String>(value: 'Secretario', title: 'Secretario'),
    S2Choice<String>(value: 'Super Admin', title: 'Super Admin'),
  ];
  var nameController = TextEditingController();

  var biController = TextEditingController();

  var acessoController = TextEditingController();

  var emailController = TextEditingController();

  var nascController = TextEditingController();

  var oldPassController = TextEditingController();

  var newPassController = TextEditingController();

  var reNewPassController = TextEditingController();

  String? _acesso = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: widget.size.width * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                  width: 150,
                  child: Image.asset(
                    'assets/recluso_photo.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: MRTextField(
                      borderRadius: 60,
                      prefixIcon: Icon(EvaIcons.text),
                      label: 'Nome',
                      hint: '',
                      controller: nameController)),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: MRTextField(
                      borderRadius: 60,
                      prefixIcon: Icon(EvaIcons.text),
                      label: 'BI',
                      hint: '',
                      controller: biController)),
            ],
          ),

          Row(
            children: [
              Expanded(
                  child: MRTextField(
                      borderRadius: 60,
                      prefixIcon: Icon(EvaIcons.text),
                      label: 'Nascimento',
                      hint: '',
                      controller: nascController)),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: MRTextField(
                      borderRadius: 60,
                      prefixIcon: Icon(EvaIcons.text),
                      label: 'Email',
                      hint: '',
                      controller: emailController)),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(60)),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: SmartSelect<String?>.single(
                      title: 'Acesso',
                      selectedValue: _acesso,
                      choiceItems: acessos,
                      modalType: S2ModalType.popupDialog,
                      onChange: (selected) {
                        setState(() => _acesso = selected.value);
                      },
                      tileBuilder: (context, state) {
                        return ListTile(
                          title: Text(state.title ?? ''),
                          subtitle: Text(
                            state.selected.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(
                              state.selected.toString()[0],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          trailing: const Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.grey,
                          ),
                          onTap: state.showModal,
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: MRTextField(
                      borderRadius: 60,
                      prefixIcon: Icon(EvaIcons.lock),
                      label: 'Palavra Pass antida',
                      hint: '',
                      controller: oldPassController)),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: MRTextField(
                      borderRadius: 60,
                      prefixIcon: Icon(EvaIcons.lock),
                      label: 'Palavra Pass antida',
                      hint: '',
                      controller: reNewPassController)),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: MRTextField(
                      borderRadius: 60,
                      prefixIcon: Icon(EvaIcons.lock),
                      label: 'Nova Palavra Pass ',
                      hint: '',
                      controller: newPassController)),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 60)),
                  child: const Text(
                    'Salvar',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  )),
            ),
          )
          // Adicione mais informações conforme necessário
        ],
      ),
    );
  }
}
