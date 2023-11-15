import 'package:app_igreja/agenda.dart';
import 'package:app_igreja/animate.progress.dart';
import 'package:app_igreja/escola.dominical.dart';
import 'package:app_igreja/especiais.dart';
import 'package:app_igreja/itens.especiais.dart';
import 'package:app_igreja/main.dart';
import 'package:app_igreja/precisase.dart';
import 'package:app_igreja/texto.semanal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RecadoEspecialModel> recado = <RecadoEspecialModel>[];
  final Uri _url =
      Uri.parse('https://bioquimicacomdanilo.com.br/politicaipbalegre');

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() => isLoading = true);
    _scheduleDailyNotification();
  }

  _getFeedbackFromSheet() async {
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbwM_3-k8RHa5SIegByCBZ_XaIBbrdmzH6Ze0D71JGhq2Kjm_U3jh0hhnesPO0JjUQrldg/exec"));

    var jsonRecado = convert.jsonDecode(raw.body);

    //print('this is json Feedback $jsonFeedback');

    //feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonRecado.forEach((element) {
      //print('$element THIS IS NEXT>>>>>>>\n');

      RecadoEspecialModel recadoModel = RecadoEspecialModel(
          titulo: '', subtitulo: '', descricao: '', recado: '');
      recadoModel.titulo = element['titulo'];
      recadoModel.subtitulo = element['subtitulo'];
      recadoModel.descricao = element['descricao'];
      recado.add(recadoModel);
    });

    await Future.delayed(const Duration(milliseconds: 1000));
    isLoading = false;
    //print('${feedbacks[0]}');
  }

  Future<void> _scheduleDailyNotification() async {
    var time = Time(14, 24, 0); // Defina o horário desejado para a notificação diária
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'daily_notification',
      'Daily Notification',
      importance: Importance.high,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Bom dia! Já verificou a agenda da igreja hoje?',
      'Clique aqui para conferir no App',
      time,
      platformChannelSpecifics,
      payload: 'Dados adicionais da notificação',
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getFeedbackFromSheet(),
        builder: (context, snapshot) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: const Color(0xFF334F53),
              appBar: AppBar(
                  iconTheme: const IconThemeData(
                    color: Colors.black,
                  ),
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: const Text("IPB Alegre",
                      style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  backgroundColor: const Color(0xFF45936C),
                  toolbarHeight: 80,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              body: Center(
                child: ListView(
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      height: 100,
                      margin:
                          const EdgeInsets.only(left: 40, right: 40, top: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Precisase();
                          }));
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.handsHelping,
                          color: const Color(0xFF334F53),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          minimumSize: const Size(100, 50),
                        ),
                        label: const Text(
                          "Precisamos de você em nossa equipe!\n\n"
                          "Clique aqui e saiba como!",
                          style: TextStyle(
                              fontFamily: 'Merriweather',
                              fontSize: 13,
                              color: const Color(0xFF334F53)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 40, right: 40, top: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF45936C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Home02();
                          }));
                        },
                        icon: const Icon(Icons.calendar_today_outlined,
                            color: Colors.white),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          minimumSize: const Size(100, 50),
                        ),
                        label: const Text(
                          "Agenda da Semana",
                          style: TextStyle(
                              fontFamily: 'Merriweather',
                              fontSize: 12,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 40, right: 40, top: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF45936C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return TextoSemanalPage();
                          }));
                        },
                        icon: const Icon(FontAwesomeIcons.bible,
                            color: Colors.white),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          minimumSize: const Size(100, 50),
                        ),
                        label: const Text(
                          "Palavras da semana",
                          style: TextStyle(
                              fontFamily: 'Merriweather',
                              fontSize: 12,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 40, right: 40, top: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF45936C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return AgendaEscolaDominical();
                          }));
                        },
                        icon: const Icon(FontAwesomeIcons.bookReader, color: Colors.white),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          minimumSize: const Size(100, 50),
                        ),
                        label: const Text(
                          "Escola Bíblica Dominical",
                          style: TextStyle(
                              fontFamily: 'Merriweather',
                              fontSize: 12,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.bullhorn,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Recados Especiais',
                            style: TextStyle(
                                fontFamily: 'Merriweather',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          
                        ],
                      ),
                      
                    ),
                     SizedBox(
                            height: 20,
                          ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        thickness: 5,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        child: isLoading
                            ? CenteredCircularProgress(message: 'Carregando Recados\nCaso demore mais que 3 segundos\nverifique sua conexão de internet',)
                            : Column(
                                children: [
                                  RecadosEspeciaisLista(
                                    titulo: recado[0].titulo,
                                    subtitulo: recado[0].subtitulo,
                                    descricao: recado[0].descricao,
                                    recado: recado[0].recado,
                                  ),
                                  RecadosEspeciaisLista(
                                    titulo: recado[1].titulo,
                                    subtitulo: recado[1].subtitulo,
                                    descricao: recado[1].descricao,
                                    recado: recado[1].recado,
                                  ),
                                  RecadosEspeciaisLista(
                                    titulo: recado[2].titulo,
                                    subtitulo: recado[2].subtitulo,
                                    descricao: recado[2].descricao,
                                    recado: recado[2].recado,
                                  ),
                                ],
                              )),
                    Container(
                      margin: const EdgeInsets.fromLTRB(120, 20, 120, 20),
                      width: 120,
                      height: 120,
                      alignment: Alignment.center,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40)),
                          child: Image.asset('assets/images/logoIgreja.jpg')),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(90)),
                        border: Border.all(
                          color: Colors.white,
                          width: 4.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: const Text(
                        '"Em seu coração o homem planeja o seu caminho, mas o SENHOR determina os seus passos"',
                        style: TextStyle(
                            fontFamily: 'Merriweather',
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Provérbios 16:9",
                      style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        _launchUrl();
                      },
                      child: Text(
                        "Politica de Privacidade",
                        style: TextStyle(
                            fontFamily: 'Merriweather',
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            height: 1.5,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2.0,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
