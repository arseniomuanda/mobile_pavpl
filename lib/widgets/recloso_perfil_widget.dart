// import 'package:awesome_select/awesome_select.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_pavpl/app/data/dummy_data.dart';
import 'package:mobile_pavpl/choices.dart';
import 'package:mobile_pavpl/providers/global_provider.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';

class ReclusoWidget extends ConsumerWidget {
  ReclusoWidget({
    super.key,
    required this.preso,
    required this.size,
  });

  Prisoner? preso;
  final Size size;

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        color: Colors.grey[50],
        width: size.width * 0.2,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    ref
                        .read(prisonerProvider.notifier)
                        .update((state) => Prisoner());
                  },
                  child: Icon(
                    EvaIcons.close,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  maxRadius: 50,
                  child: CircleAvatar(
                    maxRadius: 47,
                    backgroundImage: NetworkImage(
                      preso!.photo!,
                      scale: 0.3,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              MRTextField(
                  borderRadius: 60,
                  initialValue: preso!.name,
                  prefixIcon: Icon(EvaIcons.text),
                  label: 'Nome',
                  hint: '',
                  controller: null),
              MRTextField(
                  borderRadius: 60,
                  initialValue: preso!.crime,
                  prefixIcon: Icon(EvaIcons.text),
                  label: 'Crime',
                  hint: '',
                  controller: null),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10),
              //   child: SmartSelect<Cela?>.single(
              //     title: 'Selecionar cela',
              //     selectedValue:
              //         celas.where((element) => element.id == preso!.cell).first,
              //     choiceItems: s2Celas,
              //     modalType: S2ModalType.bottomSheet,
              //     onChange: (selected) {
              //       //setState(() => _framework = selected.value);
              //     },
              //     tileBuilder: (context, state) {
              //       return InkWell(
              //         onTap: state.showModal,
              //         child: Container(
              //           padding: const EdgeInsets.all(7),
              //           decoration: BoxDecoration(
              //               border: Border.all(color: Colors.grey),
              //               borderRadius: BorderRadius.circular(60)),
              //           child: Row(
              //             children: [
              //               CircleAvatar(
              //                 backgroundColor: Theme.of(context).primaryColor,
              //                 child: Text(
              //                   state.selected.toString()[0],
              //                   style: const TextStyle(color: Colors.white),
              //                 ),
              //               ),
              //               const SizedBox(width: 20),
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(state.title ?? ''),
              //                   Text(
              //                     state.selected.toString(),
              //                     overflow: TextOverflow.ellipsis,
              //                     maxLines: 1,
              //                   )
              //                 ],
              //               ),
              //               const Spacer(),
              //               const Icon(
              //                 Icons.keyboard_arrow_right,
              //                 color: Colors.grey,
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10),
              //   child: SmartSelect<Bloco?>.single(
              //     title: 'Selecionar bloco',
              //     selectedValue: blocos
              //         .where((element) => element.id == preso!.bloco)
              //         .first,
              //     choiceItems: s2Blocos,
              //     modalType: S2ModalType.bottomSheet,
              //     onChange: (selected) {
              //       //setState(() => _framework = selected.value);
              //     },
              //     tileBuilder: (context, state) {
              //       return InkWell(
              //         onTap: state.showModal,
              //         child: Container(
              //           padding: const EdgeInsets.all(7),
              //           decoration: BoxDecoration(
              //               border: Border.all(color: Colors.grey),
              //               borderRadius: BorderRadius.circular(60)),
              //           child: Row(
              //             children: [
              //               CircleAvatar(
              //                 backgroundColor: Theme.of(context).primaryColor,
              //                 child: Text(
              //                   state.selected.toString()[0],
              //                   style: const TextStyle(color: Colors.white),
              //                 ),
              //               ),
              //               const SizedBox(width: 20),
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(state.title ?? ''),
              //                   Text(
              //                     state.selected.toString(),
              //                     overflow: TextOverflow.ellipsis,
              //                     maxLines: 1,
              //                   )
              //                 ],
              //               ),
              //               const Spacer(),
              //               const Icon(
              //                 Icons.keyboard_arrow_right,
              //                 color: Colors.grey,
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 60)),
                    child: const Text(
                      'Salvar',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
