import 'package:flutter/material.dart';
import 'dart:math';
void main(){
  runApp(MaterialApp(

    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases = [
    'Agora é a hora de começar a surpreender aqueles que duvidaram de você!',
    'Quando pensar em desistir, lembre-se porque começou',
    'Se não puder fazer tudo, faça tudo que puder',
    'Por mais difícil que algo possa parecer, jamais desista antes de tentar!',
    'Acreditar é a força que nos permite subir os maiores degraus da vida',
    'Com fé no Senhor e determinação todos os sonhos são possíveis de realizar',
    'A fé em Deus nos faz crer no incrível, ver o invisível e realizar o impossível',
    'Vá firme na direção da sua meta, porque o pensamento cria, o desejo atrai e a fé realiza!',
    'A fé não é a estrada, mas pode ser a força que nos faz caminhar'
  ];

  var _fraseGerada = 'Clique abaixo para gerar uma frase!';


  void _gerarfrase(){

    var numerosorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numerosorteado];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frases do dia'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.amber)
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/frases.jpg'),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              RaisedButton(
                onPressed: _gerarfrase  ,

                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
