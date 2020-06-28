// main è una parola chiave delle funzioni in flutter , permette di avviare in automatico il rendering dell'interfaccia utente. Void rappresenta un tipo in questo caso nullo
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//Summary
// Abbiamo una funzione principale main che viene eseguita automaticamente all'avvio .
// Nel nostro caso specifico stiamo richiamando la classe MyApp e la stiamo eseguendo con il comando nativo di flutter runAPP
// Nella nostra classe (che è in pratica un widget) dobbiamo sempre estendere una classe senza stato oppure una classe con stato .
// I widget utilizzati (in questo caso Material App e Text) non sono altro che delle classi Dart, infatti in flutter ogni widget non è che una classe di Dart che alla fine ha un metodo

// void main() {
//   //runApp è una funzione nativa di flutter che ci permette di richiamare la nostra classe e vedere sull'emulatore il codice scritto.
//   runApp(MyApp());
// }

// possiamo utilizzare questa sintassi solo quando all'interno di runApp abbiamo una sola funzione.
void main() => runApp(MyApp());

//ora creo un oggetto che estende le proprietà di una classe preimportata da flutter . All'interno del mio oggetto posso poi aggiungere le mie personalizzazioni.
//Questa è una normale classe con alcune funzionalità extra fornite dal widget
// class MyApp extends StatelessWidget {
//   //override è un decoratore . Possiamo richiamare questo widget senza utilizzarlo tuttavia serve a rendere il nostro codice un pò più chiaro e pulito
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Text('M.R. First App'),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   //override è un decoratore . Possiamo richiamare questo widget senza utilizzarlo tuttavia serve a rendere il nostro codice un pò più chiaro e pulito
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // Scaffold è un altro widget nativo di flutter che ha il compito di creare un design di padina di base per l'app
//       home: Scaffold(
//         //qui non stiamo facendo altro che richiamare widget all'interno di altri widget che ci vengono restituiti nativamente da MaterialApp che abbiamo richiamato all'inizio della nostra app.
//         //Flutter in pratica di permette di comporre la tua applicazione combinando tra loro vari widget
//         appBar: AppBar(
//           title: Text('Mr App'),

//         ),
//         body: Text('Example'),
//       ),
//     );
//   }
// }

// Ora l'obiettivo è costruire una prima semplice app che in base a delle domande risposte dall'utente restituisce un determinato risultato .
// Il primo problema che ci troviamo ad affrontare è che ad esempio non possiamo passare più valore al body , per questo è importante capire che in flutter esistono più tipi di widget:
// widget visibili (output & input ) che possono essere cose come input utente , pulsanti , testo in pratica "disegnano sullo schermo ciò che vede l'utente"
//widget invisibili che ci servono per il layout e il controllo ( ad esempio colorre , tabelle) , in sostanza disegnano la struttura della nostra app

//Inizialmente abbiamo costruito una classe senza stato che quindi non accetta argomenti e non può effettivamente cambiare qualcosa in base ad un'azione compiuta dall'utente
//Adesso invece convertiremo la nostra iniziale classe senza stato in una classe con stato .
//Per farlo abbiamo bisogno di 2 classi
//La prima è quella che avevamo utilizzato in precedenza rinomimando da StatelessWidget a StatefulWidget e in più creeremo la nostra seconda classe che avrà il nome della prima più la parola State e che estende State un'altra classe fornita in automatico Flutter come material

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//inseriamo un puntatore per far capire a Dart e flutter che questa classe è collegata alla classe di base MyApp
//aggiungendo _ prima del nome della classe possiamo renderla privata in modo che non possa essere richiamata in file esterni ma solo all'interno della classe principale MyApp
class _MyAppState extends State<MyApp> {
  final _questions = const [
    //Ora per gestire le domande e risposte potremmo creare una classe apposita , tuttavia cominciamo con il creare una mappa che è una raccolta di coppie chiave valore
    {
      'questionText': 'Qual è il tuo colore preferito?',
      "answers": [
        {'text': "Arancione", 'score': 3},
        {'text': "Verde", 'score': 2},
        {'text': "Rosa", 'score': 0},
        {'text': "Rosso", 'score': 1}
      ]
    },
    {
      'questionText': 'Qual è il tuo animale preferito ?',
      "answers": [
        {'text': "Coniglio", 'score': 2},
        {'text': "Cane", 'score': 3},
        {'text': "Serpente", 'score': 0},
        {'text': "Gatto", 'score': 1}
      ]
    },
    {
      'questionText': 'Qual è il tuo hobby preferito ?',
      "answers": [
        {'text': "Scrivere codice ", 'score': 2},
        {'text': "Andare in palestra/correre", 'score': 3},
        {'text': "Mangiare", 'score': 0},
        {'text': "Andare al cinema", 'score': 1}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() => _questionIndex++);
    print(_questionIndex);
    //setState è un metodo(funzione) che ci permette di dire a flutter che deve reinderizzare l'app quando avviene un determinato cambiamento . Siccome il nostro cambiamento deriva dal cambio dell'index inseriamo il questionIndex qui dentro .
  }

  //override è un decoratore . Possiamo richiamare questo widget senza utilizzarlo tuttavia serve a rendere il nostro codice un pò più chiaro e pulito
  @override
  Widget build(BuildContext context) {
    // const dummy = ["ciao"];
    // dummy.add("Marco");
    // print(dummy);
    //questions = []; // questo non funziona se questions è una constante

    // final names = ['Max', 'Manu', 'Julie'];
    // final result = names.map((name) => Text(name)).toList();
    // print(result);
    return MaterialApp(
      // Scaffold è un altro widget nativo di flutter che ha il compito di creare un design di padina di base per l'app
      home: Scaffold(
        //qui non stiamo facendo altro che richiamare widget all'interno di altri widget che ci vengono restituiti nativamente da MaterialApp che abbiamo richiamato all'inizio della nostra app.
        //Flutter in pratica di permette di comporre la tua applicazione combinando tra loro vari widget
        appBar: AppBar(
          title: Text('Mr First app'),
        ),
        //Column è uno dei widget invisibili che può prendere come argomento una lista di widget
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
