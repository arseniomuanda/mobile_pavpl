import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_pavpl/app/data/dummy_data.dart';
import 'package:mobile_pavpl/providers/global_provider.dart';
import 'package:mobile_pavpl/widgets/rich_text_widget.dart';
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
                  controller: null
              ),
              MRTextField(
                  borderRadius: 60,
                  initialValue: preso!.crime,
                  prefixIcon: Icon(EvaIcons.text),
                  label: 'Crime',
                  hint: '',
                  controller: null
              ),MRTextField(
                  borderRadius: 60,
                  initialValue: preso!.cell,
                  prefixIcon: Icon(EvaIcons.text),
                  label: 'Cela',
                  hint: '',
                  controller: null
              ),MRTextField(
                  borderRadius: 60,
                  initialValue: preso!.block,
                  prefixIcon: Icon(EvaIcons.text),
                  label: 'Bloco',
                  hint: '',
                  controller: null
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 60)
                ), child: const Text('Salvar', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}


