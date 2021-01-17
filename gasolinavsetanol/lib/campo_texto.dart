import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";
  void _calcular(){
      double precoAlcool = double.tryParse(_controllerAlcool.text);
      double precoGasolina =double.tryParse(_controllerGasolina.text);

      if(precoAlcool == null || precoGasolina == null){
        setState(() {
          _textoResultado = 'Digite números maiores que 0 e utilize (.) ';
        });
      }
      else{

        if((precoAlcool/precoGasolina) >= 0.7){
          setState(() {
            _textoResultado = 'É melhor abastecer com Gasolina';
          });
        }

        else{
          setState(() {
            _textoResultado = 'É melhor abastecer com Álcool';
          });
        }
      _limparCampos();
      }
  }

  void _limparCampos() {
    _controllerAlcool .text = "";
    _controllerGasolina.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou Gasolina'),
        centerTitle: true,
      ),
      body: Container(
        //DEIXAR A TELA ROLANDO PARA NÃO DAR OVERFLOW
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, //O CONTEUDO OCUPA O ESPAÇAMENTO TOTAL,INCLUSIVE O BOTÃO
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child:  Image.asset('images/logo.png'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child:  Text('Saiba qual a melhor opção para abastecimento do seu carro',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Preço Álcool, ex: 3.59',
                  ),
                  style: TextStyle(fontWeight: FontWeight.w300,
                      fontSize: 22),
                  controller: _controllerAlcool,
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Preço Gasolina, ex: 4.64',
                    ),
                    style: TextStyle(fontWeight: FontWeight.w300,
                        fontSize: 22),

                    controller: _controllerGasolina,
                  )
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child:  RaisedButton(
                  onPressed: _calcular,
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text('Calcular',
                    style: TextStyle(
                      fontSize: 20,
                    ),),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(_textoResultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),),
              )
            ],

          ),
        ),
      ),
    );
  }
}
