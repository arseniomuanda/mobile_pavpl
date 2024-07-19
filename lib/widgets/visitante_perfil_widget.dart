import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pavpl_app/app/data/dummy_data.dart';
import 'package:pavpl_app/providers/global_provider.dart';
import 'package:pavpl_app/widgets/rich_text_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class VisitaWidget extends ConsumerWidget {
  VisitaWidget({
    super.key,
    required this.visita,
    required this.size,
  });
  Visita visita;
  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var preso = presos
        .where((element) => int.parse(visita!.idOfPrisoner!) == element.id)
        .first;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        color: Colors.grey[50],
        width: size.width * 0.2,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      ref
                          .read(visitaProvider.notifier)
                          .update((state) => Visita());
                    },
                    child: Icon(
                      EvaIcons.close,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text('Recluso',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.7),
                    )),
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
                  descricao: 'ID',
                  dado: '${preso!.id}',
                ),
                const SizedBox(height: 20),
                RichTextWidget(
                  descricao: 'Crime',
                  dado: preso!.crime,
                ),
                const SizedBox(height: 20),
                RichTextWidget(
                  descricao: 'Celula',
                  dado: celas.where((element) => element.id == preso.cell).first.name,
                ),
                const SizedBox(height: 20),
                RichTextWidget(
                  descricao: 'Bloco',
                  dado: blocos.where((element) => element.id == preso.bloco).first.name,
                ),
                const SizedBox(height: 20),
                RichTextWidget(
                  descricao: 'Cadeia',
                  dado: preso!.prison,
                ),
                const SizedBox(height: 40),

                //Aqui eu estou a apresentar apenas os dados do visitante
                Text('Visitante',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.black.withOpacity(0.7),
                    )),
                Center(
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    maxRadius: 50,
                    child: CircleAvatar(
                      maxRadius: 47,
                      backgroundImage: NetworkImage(
                        visita!.photo!,
                        scale: 0.3,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                RichTextWidget(
                  descricao: 'Nome',
                  dado: visita!.nameOfVisitor,
                ),
                const SizedBox(height: 20),
                RichTextWidget(
                  descricao: 'Idade',
                  dado: visita!.age.toString(),
                ),
                const SizedBox(height: 20),
                RichTextWidget(
                  descricao: 'Sexo',
                  dado: visita!.sexo,
                ),const SizedBox(height: 20),
                RichTextWidget(
                  descricao: 'Total devisitas',
                  dado: visita!.totalVisitas.toString(),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
