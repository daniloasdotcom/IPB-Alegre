import 'package:app_igreja/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreenPage extends StatelessWidget {
  List<PageViewModel> getPages(BuildContext context) {
    return [
      PageViewModel(
          title: "",
          decoration: PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(fontSize: 18.0),
            // Adicione um fundo verde à página personalizada
            boxDecoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          bodyWidget: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 40, right: 40, top: 50, bottom: 50),
                  child: Text(
                    "Bem Vindo ao App da IPB Alegre",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Merriweather',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(100, 20, 100, 0),
                  width: 120, // Ajuste a largura desejada
                  height: 120, // Ajuste a altura desejada
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(90)),
                    child: Image.asset(
                      'assets/images/logoIgreja.jpg',
                      fit: BoxFit.cover,
                      width: 120, // Ajuste a largura desejada
                      height: 120, // Ajuste a altura desejada
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(90)),
                    border: Border.all(
                      color: Colors.white,
                      width: 4.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40, top: 0),
                  child: Text(
                    "IPB Alegre",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Merriweather',
                    ),
                  ),
                ),
              ],
            ),
          )),
      PageViewModel(
          title: "",
          decoration: PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(fontSize: 18.0),
            // Adicione um fundo verde à página personalizada
            boxDecoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          bodyWidget: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                width: 250, // Ajuste a largura desejada
                height: 250, // Ajuste a altura desejada
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(90)),
                  child: Image.asset(
                    'assets/images/pic02.png',
                    fit: BoxFit.cover,
                    width: 250, // Ajuste a largura desejada
                    height: 250, // Ajuste a altura desejada
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(90)),
                  border: Border.all(
                    color: Colors.white,
                    width: 4.0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 40, right: 40, top: 50, bottom: 50),
                child: Column(children: [
                  Text(
                    "No Aplicativo IBP Alegre você fica por dentro da Agenda de Atividades da Igreja",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      height: 1.5,
                      fontSize: 14,
                      fontFamily: 'Merriweather',
                    ),
                  ),
                ]),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                margin: const EdgeInsets.only(left: 40, right: 40, top: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF45936C),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    _navigateToHomePage(context);
                  },
                  icon: const Icon(Icons.home, color: Colors.white),
                  style: TextButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    minimumSize: const Size(100, 50),
                  ),
                  label: const Text(
                    "Começar!",
                    style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 12,
                        color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          )),
      PageViewModel(
          title: "",
          decoration: PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(fontSize: 18.0),
            // Adicione um fundo verde à página personalizada
            boxDecoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          bodyWidget: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                width: 250, // Ajuste a largura desejada
                height: 250, // Ajuste a altura desejada
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(90)),
                  child: Image.asset(
                    'assets/images/pic03.png',
                    fit: BoxFit.cover,
                    width: 250, // Ajuste a largura desejada
                    height: 250, // Ajuste a altura desejada
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(90)),
                  border: Border.all(
                    color: Colors.white,
                    width: 4.0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 40, right: 40, top: 50, bottom: 50),
                child: Column(children: [
                  Text(
                    "Toda semana você encontra aqui um texto especial",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      height: 1.5,
                      fontSize: 14,
                      fontFamily: 'Merriweather',
                    ),
                  ),
                ]),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                margin: const EdgeInsets.only(left: 40, right: 40, top: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF45936C),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    _navigateToHomePage(context);
                  },
                  icon: const Icon(Icons.home, color: Colors.white),
                  style: TextButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    minimumSize: const Size(100, 50),
                  ),
                  label: const Text(
                    "Começar!",
                    style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 12,
                        color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: getPages(context),
      onDone: () {
        // Navegue para a próxima tela após a introdução
        // Substitua este código com a navegação real do seu aplicativo
        _navigateToHomePage(context);
      },
      onSkip: () {
        // Navegue para a próxima tela após a introdução
        // Substitua este código com a navegação real do seu aplicativo
        _navigateToHomePage(context);
      },
      showSkipButton: true,
      skip: const Text(
        "Pular",
        style: TextStyle(color: Colors.white, fontFamily: 'Merriweather'),
      ),
      dotsContainerDecorator: const ShapeDecoration(
          color: Color(0xFF334F53),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          )),
      done: const Text(
        "Concluir",
        style: TextStyle(color: Colors.white, fontFamily: 'Merriweather'),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: Colors.white,
        activeColor: Colors.white,
        activeSize: const Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  void _navigateToHomePage(BuildContext context) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
        transitionDuration: Duration(milliseconds: 1500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }
}
