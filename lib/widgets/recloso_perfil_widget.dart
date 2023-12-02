import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_pavpl/app/data/dummy_data.dart';
import 'package:mobile_pavpl/providers/global_provider.dart';

class ReclusoWidget extends ConsumerWidget {
  ReclusoWidget({
    super.key,
    required this.preso,
    required this.size,
  });

  Prisoner? preso;
  final Size size;

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
              RichTextWidget(
                descricao: 'Nome',
                dado: preso!.name,
              ),
              const SizedBox(height: 20),
              RichTextWidget(
                descricao: 'Crime',
                dado: preso!.crime,
              ),
              const SizedBox(height: 20),
              RichTextWidget(
                descricao: 'Celula',
                dado: preso!.cell,
              ),
              const SizedBox(height: 20),
              RichTextWidget(
                descricao: 'Bloco',
                dado: preso!.block,
              ),
              const SizedBox(height: 20),
              RichTextWidget(
                descricao: 'Cadeia',
                dado: preso!.prison,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class RichTextWidget extends StatelessWidget {
  RichTextWidget({
    super.key,
    required this.descricao,
    required this.dado,
  });

  String? descricao;
  String? dado;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$descricao:',
            children: [
              TextSpan(
                text: ' $dado',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.withOpacity(0.6),
                ),
              )
            ],
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
