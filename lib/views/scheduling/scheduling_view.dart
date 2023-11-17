import 'package:flutter/material.dart';
import 'package:mobile_pavpl/app/helpers/text_helper.dart';
import 'package:mobile_pavpl/app/helpers/time_helper.dart';
import 'package:mobile_pavpl/app/routing/route_handler.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';

class SchedulingPage extends StatefulWidget {
  const SchedulingPage({super.key});

  @override
  State<SchedulingPage> createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  final timeController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
            text: TextSpan(
                style: fonte(context),
                text: 'Nº',
                children: const [TextSpan(text: '99999999')])),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed(MRRoutes.perfil),
              icon: const Icon(Icons.person_3)),
          IconButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed(MRRoutes.login),
              icon: const Icon(Icons.exit_to_app))
        ],
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MRTextField(
              suffixIconButton: IconButton(
                icon: const Icon(Icons.today),
                onPressed: () async {
                  pickDate(context).then((value) {
                    if (value != null) {
                      setState(() {
                        dateController.text = formateDate2.format(value);

                        pickTime(context).then((value) {
                          if (value != null) {
                            timeController.text =
                                "${value.hour}:${value.minute}";
                          }
                        });
                      });
                    }
                  });
                  //final date = pickDate(context);
                },
              ),
              hint: "YYYY/MM/DD",
              label: "Data",
              controller: dateController,
            ),
            MRTextField(
                suffixIcon: const Icon((Icons.schedule)),
                hint: "HH:mm",
                label: "Hora",
                controller: timeController),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(MRRoutes.scheduleProfile),
                  child: Text(
                    'Confirmar',
                    style: fonte(context, isButton: true),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
