import 'package:app_igreja/home.dart';
import 'package:app_igreja/itens.especiais.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RecadosEspeciais extends StatefulWidget {
  @override
  _RecadosEspeciaisState createState() => _RecadosEspeciaisState();
}

class _RecadosEspeciaisState extends State<RecadosEspeciais> {
  List<RecadoEspecialModel> recado = <RecadoEspecialModel>[];

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() => isLoading = true);
  }

  _getFeedbackFromSheet() async {
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbyj5lwcrSBmdYopjahJequwFx6P8cOitStGxJiVL9Gb79nynZgrz8yLAmPHKotzAupl/exec"));

    var jsonRecado = convert.jsonDecode(raw.body);

    //print('this is json Feedback $jsonFeedback');

    //feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonRecado.forEach((element) {
      //print('$element THIS IS NEXT>>>>>>>\n');

      RecadoEspecialModel recadoModel = RecadoEspecialModel(
          titulo: '', descricao: '', recado: '', subtitulo: '');
      recadoModel.titulo = element['titulo'];
      recadoModel.subtitulo = element['subtitulo'];
      recadoModel.descricao = element['descricao'];
      recado.add(recadoModel);
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
              backgroundColor: const Color(0xFF334F53),
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: const Color(0xFF45936C),
                title: const Text("Escola Bíblica Dominical",
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
                child: RecadosEspeciaisLista(
                  titulo: recado[1].titulo,
                  subtitulo: recado[1].subtitulo,
                  descricao: recado[1].descricao,
                  recado: recado[1].recado,
                ),
              ),
            ));
      },
    );
  }
}

class RecadosEspeciaisLista extends StatefulWidget {
  
  final String recado, titulo, subtitulo, descricao;
  RecadosEspeciaisLista(
      {required this.recado,
      required this.titulo,
      required this.subtitulo,
      required this.descricao,});

      
  @override
  State<RecadosEspeciaisLista> createState() => _RecadosEspeciaisListaState();
}

class _RecadosEspeciaisListaState extends State<RecadosEspeciaisLista> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    border: Border.all(
                      color: Colors.black,
                      width: 3.0
                    )
                  ),
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
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 15,
                      color: Colors.black),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.descricao,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 15,
                      color: Colors.black),
                ),
                
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
