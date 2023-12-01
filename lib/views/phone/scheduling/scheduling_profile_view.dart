import 'package:flutter/material.dart';
import 'package:mobile_pavpl/app/helpers/text_helper.dart';
import 'package:mobile_pavpl/app/routing/route_handler.dart';

class ScheduleProfilePage extends StatefulWidget {
  const ScheduleProfilePage({super.key});

  @override
  State<ScheduleProfilePage> createState() => _ScheduleProfilePageState();
}

class _ScheduleProfilePageState extends State<ScheduleProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: RichText(
              text: TextSpan(
                  style: fonte(context),
                  text: 'Nº',
                  children: const [TextSpan(text: '99999999')])),
          actions: [
            IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(MRRoutes.perfil),
                icon: const Icon(Icons.person_3)),
            IconButton(
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed(MRRoutes.login),
                icon: const Icon(Icons.exit_to_app)),
          ],
          elevation: 0,
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.primary),
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          bottom: TabBar(
              labelColor: Theme.of(context).colorScheme.primary,
              indicatorColor: Theme.of(context).colorScheme.primary,
              tabs: const [
                Tab(
                    icon: Icon(
                  Icons.schedule,
                )),
                Tab(icon: Icon(Icons.confirmation_num)),
                Tab(icon: Icon(Icons.list_alt)),
              ]),
        ),
        body: TabBarView(
          //controller: _tabController,
          children: [
            Center(
                child: Text(
              "Esperando a aprovação!",
              style: fonte(context),
            )),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.2,
                  horizontal: 30),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                            style: fonte2(context),
                            text: "Nome: ",
                            children: [
                          TextSpan(
                              text: "Arsenio Nelson",
                              style: fonteBlack(context, isButton: true))
                        ])),
                    RichText(
                        text: TextSpan(
                            style: fonte2(context),
                            text: "Ticket: ",
                            children: [
                          TextSpan(
                              text: "3894753498",
                              style: fonteBlack(context, isButton: true))
                        ])),
                    RichText(
                        text: TextSpan(
                            style: fonte2(context),
                            text: "Data: ",
                            children: [
                          TextSpan(
                              text: "04/12/2023",
                              style: fonteBlack(context, isButton: true))
                        ])),
                    RichText(
                        text: TextSpan(
                            style: fonte2(context),
                            text: "Hora: ",
                            children: [
                          TextSpan(
                              text: "12:30",
                              style: fonteBlack(context, isButton: true))
                        ])),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text(
                      "Cancelar",
                      style: fonte2(context, isButton: true),
                    ),
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(MRRoutes.home),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    child: Text(
                      "Adiar",
                      style: fonte2(context, isButton: true),
                    ),
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(MRRoutes.scheduling),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
