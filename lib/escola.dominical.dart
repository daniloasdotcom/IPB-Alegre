import 'dart:ffi';
import 'package:app_igreja/animate.progress.dart';
import 'package:app_igreja/home.dart';
import 'package:app_igreja/itens.agenda.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AgendaEscolaDominical extends StatefulWidget {
  @override
  _AgendaEscolaDominicalState createState() => _AgendaEscolaDominicalState();
}

class _AgendaEscolaDominicalState extends State<AgendaEscolaDominical> {
  List<FeedbackModel> feedbacks = <FeedbackModel>[];

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() => isLoading = true);
  }

  _getFeedbackFromSheet() async {
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbxN3Z1fWvHBXxqGNbiutoGP9uD5yQE6U5sdEKeo4bPDebr2NUyGmi0cu3T6MHQsSI1E/exec"));

    var jsonFeedback = convert.jsonDecode(raw.body);

    //print('this is json Feedback $jsonFeedback');

    //feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      //print('$element THIS IS NEXT>>>>>>>\n');

      FeedbackModel feedbackModel = FeedbackModel(
          feedback: '', profilePic: '', sourceUrl: '', name: '', source: '');
      feedbackModel.name = element['name'];
      feedbackModel.profilePic = element['profile_pic'];
      feedbackModel.source = element['source'];
      feedbackModel.sourceUrl = element["source_url"];

      feedbacks.add(feedbackModel);
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
                child: isLoading
                    ? CenteredCircularProgress(message: 'Carregando Agenda\nCaso demore mais que 3 segundos\nverifique sua internet',)
                    : ListView.builder(
                        itemCount: feedbacks.length,
                        itemBuilder: (context, index) {
                          return FeedbackTile(
                            profilePic: feedbacks[index].profilePic,
                            name: feedbacks[index].name,
                            source: feedbacks[index].source,
                            sourceUrl: feedbacks[index].sourceUrl,
                          );
                        }),
              ),
            ));
      },
    );
  }
}

class FeedbackTile extends StatefulWidget {
  final String profilePic, name, source, sourceUrl;
  FeedbackTile(
      {required this.profilePic,
      required this.name,
      required this.source,
      required this.sourceUrl});

  @override
  State<FeedbackTile> createState() => _FeedbackTileState();
}

class _FeedbackTileState extends State<FeedbackTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      child: Image.network(widget.profilePic))),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: Text(widget.name,
                        style: const TextStyle(
                            fontFamily: 'Merriweather',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.source,
                    style: const TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 15,
                        color: Colors.white),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          EasyRichText('Estudo do dia: ' + widget.sourceUrl,
              defaultStyle: const TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
              patternList: [
                EasyRichTextPattern(
                  targetString: 'Detalhes:',
                  matchWordBoundaries: false,
                  style: const TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.white),
                ),
              ]),
          const Divider(
            thickness: 5,
          ),
        ],
      ),
    );
  }
}
