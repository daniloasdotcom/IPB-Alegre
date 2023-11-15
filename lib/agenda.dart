import 'package:app_igreja/animate.progress.dart';
import 'package:app_igreja/itens.agenda.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home02 extends StatefulWidget {
  @override
  _Home02State createState() => _Home02State();
}

class _Home02State extends State<Home02> {
  List<FeedbackModel> feedbacks = <FeedbackModel>[];

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() => isLoading = true);
  }

  _getFeedbackFromSheet() async {
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbx0iN9uGqg3t3C-ht1vh7c8dAe9PXwfSvLBr6uJEuWJs6P24jnJN8_Grc1zLrMtEV-B/exec"));

    var jsonFeedback = convert.jsonDecode(raw.body);

    //print('this is json Feedback $jsonFeedback');

    //feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      //print('$element THIS IS NEXT>>>>>>>\n');

      FeedbackModel feedbackModel = FeedbackModel(
          feedback: '', profilePic: '', sourceUrl: '', name: '', source: '');
      feedbackModel.name = element['name'];
      feedbackModel.feedback = element['feedback'];
      feedbackModel.profilePic = element['profile_pic'];
      feedbackModel.source = element['source'];
      feedbackModel.sourceUrl = element["source_url"];

      feedbacks.add(feedbackModel);
    });

    await Future.delayed(const Duration(milliseconds: 2000));
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
                title: const Text("Agenda da Igreja",
                    style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                elevation: 0,
              ),
              body: Container(
                child: isLoading
                    ? CenteredCircularProgress(message: 'Carregando Agenda\nCaso demore mais que 5 segundos\nverifique sua conexao de internet',)
                    : ListView.builder(
                        itemCount: feedbacks.length,
                        itemBuilder: (context, index) {
                          return FeedbackTile(
                            profilePic: feedbacks[index].profilePic,
                            name: feedbacks[index].name,
                            source: feedbacks[index].source,
                            feedback: feedbacks[index].feedback,
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
  final String profilePic, name, source, feedback, sourceUrl;
  FeedbackTile(
      {required this.profilePic,
      required this.name,
      required this.source,
      required this.feedback,
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
          EasyRichText('Evento: ' + widget.feedback,
              defaultStyle: const TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
              patternList: [
                EasyRichTextPattern(
                  targetString: 'Evento:',
                  matchWordBoundaries: false,
                  style: const TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.white),
                ),
              ]),
          const SizedBox(height: 16),
          EasyRichText('Detalhes: ' + widget.sourceUrl,
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
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
