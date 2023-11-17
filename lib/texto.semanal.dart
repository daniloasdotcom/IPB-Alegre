import 'package:app_igreja/animate.progress.dart';
import 'package:app_igreja/home.dart';
import 'package:app_igreja/itens.texto.semanal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TextoSemanalPage extends StatefulWidget {
  @override
  _TextoSemanalPageState createState() => _TextoSemanalPageState();
}

class _TextoSemanalPageState extends State<TextoSemanalPage> {
  List<TextoSemanalModel> textosemanal = <TextoSemanalModel>[];

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() => isLoading = true);
  }

  _getFeedbackFromSheet() async {
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbxEffuPNlOFg-ki20EZShDW2MlA7I80UNbx2r4GZTsMyBOjJD7cK52nUgWmON_U66h7/exec"));

    var jsonTexto = convert.jsonDecode(raw.body);

    //print('this is json Feedback $jsonFeedback');

    //feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonTexto.forEach((element) {
      //print('$element THIS IS NEXT>>>>>>>\n');

      TextoSemanalModel textoModel = TextoSemanalModel(
          textosemanal: '',
          titulo: '',
          subtitulo: '',
          paragrafo01: '',
          paragrafo02: '',
          paragrafo03: '',
          paragrafo04: '',
          paragrafo05: '',
          paragrafo06: '',
          paragrafo07: '',
          paragrafo08: '',
          paragrafo09: '',
          paragrafo10: '');
      textoModel.titulo = element['titulo'];
      textoModel.subtitulo = element['subtitulo'];
      textoModel.paragrafo01 = element['paragrafo01'];
      textoModel.paragrafo02 = element['paragrafo02'];
      textoModel.paragrafo03 = element['paragrafo03'];
      textoModel.paragrafo04 = element['paragrafo04'];
      textoModel.paragrafo05 = element['paragrafo05'];
      textoModel.paragrafo06 = element['paragrafo06'];
      textoModel.paragrafo07 = element['paragrafo07'];
      textoModel.paragrafo08 = element['paragrafo08'];
      textoModel.paragrafo09 = element['paragrafo09'];
      textoModel.paragrafo10 = element['paragrafo10'];
      textosemanal.add(textoModel);
    });

    await Future.delayed(const Duration(milliseconds: 1000));
    isLoading = false;
    //print('${feedbacks[0]}');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getFeedbackFromSheet(),
      builder: (context, snapshot) {
        return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: const Color(0xFF45936C),
                title: const Text("Texto Semanal",
                    style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                elevation: 0,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }));
                    },
                  )
                ],
              ),
              body: Container(
                child: isLoading
                    ? CenteredCircularProgress(message: 'Carregando Texto\nCaso demore mais que 5 segundos\nverifique sua conexão de internet',)
                    : TextoSemanalFormato(
                        textosemanal: textosemanal[0].textosemanal,
                        titulo: textosemanal[0].titulo,
                        subtitulo: textosemanal[0].subtitulo,
                        paragrafo01: textosemanal[0].paragrafo01,
                        paragrafo02: textosemanal[0].paragrafo02,
                        paragrafo03: textosemanal[0].paragrafo03,
                        paragrafo04: textosemanal[0].paragrafo04,
                        paragrafo05: textosemanal[0].paragrafo05,
                        paragrafo06: textosemanal[0].paragrafo06,
                        paragrafo07: textosemanal[0].paragrafo07,
                        paragrafo08: textosemanal[0].paragrafo08,
                        paragrafo09: textosemanal[0].paragrafo09,
                        paragrafo10: textosemanal[0].paragrafo10,
                      ),
              ),
            ));
      },
    );
  }
}

class TextoSemanalFormato extends StatefulWidget {
  final String textosemanal,
      titulo,
      subtitulo,
      paragrafo01,
      paragrafo02,
      paragrafo03,
      paragrafo04,
      paragrafo05,
      paragrafo06,
      paragrafo07,
      paragrafo08,
      paragrafo09,
      paragrafo10;
  TextoSemanalFormato(
      {required this.textosemanal,
      required this.titulo,
      required this.subtitulo,
      required this.paragrafo01,
      required this.paragrafo02,
      required this.paragrafo03,
      required this.paragrafo04,
      required this.paragrafo05,
      required this.paragrafo06,
      required this.paragrafo07,
      required this.paragrafo08,
      required this.paragrafo09,
      required this.paragrafo10});
  @override
  State<TextoSemanalFormato> createState() => _TextoSemanalFormatoState();
}

class _TextoSemanalFormatoState extends State<TextoSemanalFormato> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 3.0)),
                    child: Text(widget.titulo,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.subtitulo,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      widget.paragrafo01,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Widget de Imagem da Internet
                  Container(
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Image.network(widget.paragrafo03))),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      widget.paragrafo02,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 15,
                          height: 1.5,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: widget.paragrafo04 != 'nada',
                    child: Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        widget.paragrafo04,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontFamily: 'Merriweather',
                            fontSize: 15,
                            height: 1.5,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.paragrafo05 != 'nada',
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        widget.paragrafo05,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontFamily: 'Merriweather',
                            fontSize: 15,
                            height: 1.5,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.paragrafo06 != 'nada',
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        widget.paragrafo06,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontFamily: 'Merriweather',
                            fontSize: 15,
                            height: 1.5,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.paragrafo07 != 'nada',
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        widget.paragrafo07,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontFamily: 'Merriweather',
                            fontSize: 15,
                            height: 1.5,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.paragrafo08 != 'nada',
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        widget.paragrafo08,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontFamily: 'Merriweather',
                            fontSize: 15,
                            height: 1.5,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.paragrafo09 != 'nada',
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        widget.paragrafo09,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontFamily: 'Merriweather',
                            fontSize: 15,
                            height: 1.5,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.paragrafo10 != 'nada',
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        widget.paragrafo10,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontFamily: 'Merriweather',
                            fontSize: 15,
                            height: 1.5,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    ]);
  }
}
