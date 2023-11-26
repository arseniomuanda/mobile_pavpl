import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pavpl/app/routing/route_handler.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final codController = TextEditingController();

  bool? encontrado;

  TextStyle fonte(BuildContext context, {bool isButton = false}) =>
      GoogleFonts.acme(
          color: isButton
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.primary,
          fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: MRTextField(
                  suffixIconButton: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        if (encontrado == null) {
                          encontrado = false;
                        } else if (!encontrado!) {
                          encontrado = true;
                        } else {
                          encontrado = null;
                        }
                      });
                    },
                  ),
                  label: 'Nº do recluso',
                  hint: '#######',
                  controller: codController,
                  isNumeber: true,
                ),
              ),
              if (encontrado != null && !encontrado!)
                Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                        ),
                        Icon(
                          Icons.warning_amber_outlined,
                          color: Theme.of(context).colorScheme.primary,
                          size: 100,
                        ),
                        Text(
                          'Não encontrado!',
                          style: GoogleFonts.acme(
                              fontSize: 30,
                              color: Theme.of(context).colorScheme.primary),
                        )
                      ]),
                ),
              if (encontrado != null && encontrado!)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/tema/fundo_1.jpg",
                                width: 130,
                                height: 130,
                              ),
                              //const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: fonte(context),
                                          text: 'Nome: ',
                                          children: [
                                        TextSpan(
                                            text: 'Mateus Mululunga',
                                            style: GoogleFonts.acme(
                                                color: Colors.black))
                                      ])),
                                  RichText(
                                      text: TextSpan(
                                          style: fonte(context),
                                          text: 'BI: ',
                                          children: [
                                        TextSpan(
                                            text: '98475473625BG098',
                                            style: GoogleFonts.acme(
                                                color: Colors.black))
                                      ])),
                                  RichText(
                                      text: TextSpan(
                                          style: fonte(context),
                                          text: 'Pai: ',
                                          children: [
                                        TextSpan(
                                            text: 'Claudio Mululunga',
                                            style: GoogleFonts.acme(
                                                color: Colors.black))
                                      ])),
                                  RichText(
                                      text: TextSpan(
                                          style: fonte(context),
                                          text: 'Mãe: ',
                                          children: [
                                        TextSpan(
                                            text: 'Teresa Mululunga',
                                            style: GoogleFonts.acme(
                                                color: Colors.black))
                                      ])),
                                  RichText(
                                      text: TextSpan(
                                          style: fonte(context),
                                          text: 'Idade: ',
                                          children: [
                                        TextSpan(
                                            text: '26 anos',
                                            style: GoogleFonts.acme(
                                                color: Colors.black))
                                      ])),
                                  RichText(
                                      text: TextSpan(
                                          style: fonte(context),
                                          text: 'Data de nascimento: ',
                                          children: [
                                        TextSpan(
                                            text: '08/03/1997',
                                            style: GoogleFonts.acme(
                                                color: Colors.black))
                                      ])),
                                  RichText(
                                      text: TextSpan(
                                          style: fonte(context),
                                          text: 'Natural de: ',
                                          children: [
                                        TextSpan(
                                            text: 'Benguela',
                                            style: GoogleFonts.acme(
                                                color: Colors.black))
                                      ])),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        RichText(
                            text: TextSpan(
                                style: fonte(context),
                                text: 'História: ',
                                children: [
                              TextSpan(
                                  text:
                                      "Numa penitenciária isolada em Benguela, Angola, vive um jovem chamado Mateus. Com seus 26 anos de idade, ele passou grande parte de sua vida nas ruas, enfrentando desafios e dificuldades desde tenra idade. Nasceu em uma família desfavorecida, sem muitos recursos para oferecer uma vida estável.\nMateus cresceu em um ambiente difícil, onde as oportunidades eram escassas, e a linha entre certo e errado muitas vezes se tornava obscura. Seus pais, esforçados trabalhadores, lutavam para colocar comida na mesa, mas a pobreza era uma sombra constante sobre a família.\nAos 16 anos, tentando escapar da inevitabilidade de uma vida difícil, Mateus se envolveu com más companhias. O caminho tortuoso levou-o a um mundo de criminalidade, onde a sobrevivência muitas vezes significava transgredir as leis. O jovem, cheio de sonhos interrompidos, foi arrastado para um ciclo vicioso de delinquência.\nA vida nas ruas não poupou Mateus das garras da justiça. Aos 23 anos, após uma série de eventos infelizes, ele encontrou-se atrás das grades, encarando as consequências de suas escolhas. Na prisão, Mateus teve tempo para refletir sobre sua jornada tumultuada. Arrependimento e remorso tornaram-se seus companheiros constantes, enquanto ele se esforçava para entender como chegara àquela encruzilhada da vida.\nEnquanto cumpre sua pena, Mateus busca redenção. Participa de programas de reabilitação oferecidos na prisão, buscando adquirir novas habilidades e conhecimentos que possam guiá-lo para um caminho melhor quando recuperar sua liberdade. Aos poucos, ele começa a vislumbrar um futuro diferente, longe das sombras do passado.\nA história de Mateus é uma mistura de escolhas difíceis, luta contra adversidades e a busca por uma segunda chance. Se ele conseguirá transformar sua vida e construir um futuro mais positivo, só o tempo dirá. Mas, por enquanto, no confinamento de uma cela, Mateus enfrenta a batalha consigo mesmo, determinado a emergir das sombras e encontrar a luz que o guiará para um novo começo.",
                                  style: GoogleFonts.acme(color: Colors.black))
                            ])),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(MRRoutes.scheduling),
                              child: Text(
                                'Visitar',
                                style: fonte(context, isButton: true),
                              )),
                        )
                      ]),
                )
            ],
          ),
        ),
      ),
    );
  }
}
