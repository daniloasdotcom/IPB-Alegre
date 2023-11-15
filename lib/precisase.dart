
import 'package:app_igreja/home.dart';
import 'package:flutter/material.dart';


class Precisase extends StatefulWidget {
  @override
  State<Precisase> createState() => _PrecisaseState();
}

class _PrecisaseState extends State<Precisase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF334F53),
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Veja abaixo como pode nos ajudar",
              style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          backgroundColor: const Color(0xFF45936C),
          toolbarHeight: 80,
          elevation: 5,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
            )
          ],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.fromLTRB(120, 20, 120, 20),
              width: 120,
              height: 120,
              alignment: Alignment.center,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  child: Image.asset('assets/images/logoIgreja.jpg')),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(90)),
                border: Border.all(
                  color: Colors.white,
                  width: 4.0,
                ),
              ),
            ),
            const Divider(
              thickness: 5,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                '\nO Culto Infantil\nestá precisando de voluntários',
                style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                'Nossa equipe do culto infantil precisa de voluntários para auxiliar nas atividades dos cultos de domingo com nossas crianças.\n\n'
                'Procure a nossa querida Andressa e saiba como.\n',
                style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              thickness: 5,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                '\nCulto na Pedreira MinerBraz',
                style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                'Irmãos, recentemente iniciamos nossos trabalhos na Pedreira MinerBraz e estamos muito contentes em poder partilhar da Palavra de Deus com os novos irmãos!\n\n'
                'Precisamos de voluntários para nos apoiar em nossas atividades as quinta-feiras as 7:00 da manhã na Pedreria MinerBraz no Distrito do Sobreira!\n\n',
                style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              thickness: 5,
              color: Colors.white,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
