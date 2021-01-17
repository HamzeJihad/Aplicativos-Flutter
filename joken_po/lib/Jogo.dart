import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override

    var _imagemApp = AssetImage('images/padrao.png');
    var _mensagem = 'Escolha uma opção abaixo: ';
   void _opcaoselecionada(String escolhadousuario){

     var opcoes = ['pedra', 'papel', 'tesoura'];
     var numero = Random().nextInt(3);
     var escolhaApp = opcoes[numero];

     switch(escolhaApp){
       case 'pedra':
         setState(() {
            this._imagemApp = AssetImage('images/pedra.png');
           });
         break;

       case 'papel':
       setState(() {
       this._imagemApp = AssetImage('images/papel.png');
       });
       break;

        case 'tesoura':
        setState(() {
        this._imagemApp = AssetImage('images/tesoura.png');
        });
        break;
  }

  //VALIDACAO DO GANHADOR
     if((escolhadousuario == 'pedra' && escolhaApp == 'tesoura')
     ||
     (escolhadousuario == 'tesoura' && escolhaApp == 'papel')
     || (escolhadousuario ==  'papel' && escolhaApp == 'pedra'))
     {
      setState(() {
        this._mensagem = 'Você venceu!';
      });
     }

     else if((escolhaApp == 'pedra' && escolhadousuario == 'tesoura')
         ||
         (escolhaApp == 'tesoura' && escolhadousuario == 'papel')
         || (escolhaApp ==  'papel' && escolhadousuario == 'pedra'))
     {
       setState(() {
         this._mensagem = 'Você perdeu!';
       });
     }

     else{

       setState(() {
         this._mensagem = 'Empate';
       });
     }
   }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'JokenPo'
          ),
          centerTitle: true,
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center ,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child:  Text(this._mensagem,
                  textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),


              Image(image: this._imagemApp,),
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child:  Text('Escolha uma opção abaixo: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => _opcaoselecionada('pedra'),
                      child: Image.asset('images/pedra.png',height:95 ,),
                    ),
                    GestureDetector(
                      onTap: () => _opcaoselecionada('papel'),
                      child: Image.asset('images/papel.png',height:95 ,),
                    ),
                    GestureDetector(
                      onTap: () => _opcaoselecionada('tesoura'),
                      child: Image.asset('images/tesoura.png',height:95 ,),
                    ),

                    /*
                    Image.asset('images/pedra.png',height:95 ,),
                    Image.asset('images/papel.png',height: 95,),
                    Image.asset('images/tesoura.png', height: 95,)*/

                  ],
                ),
              )
            ],
        ) ,
    );
  }
}
