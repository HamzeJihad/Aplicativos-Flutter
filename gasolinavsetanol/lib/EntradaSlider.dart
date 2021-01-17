import 'package:flutter/material.dart';


class EntradaSlider extends StatefulWidget {
  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double _valor = 0;
  String _label = 'Valor selecionado';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrada de dados'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(60),
        child: Column(
          children: <Widget>[

            Slider(
                value: _valor,
                max: 5,
                min: 0,
                label: _label,
                divisions: 5,
                activeColor: Colors.red,
                inactiveColor: Colors.black26, //COR DA LINHA
                onChanged: (double novoValor){
                    setState(() {
                      _valor = novoValor;
                      _label = 'Valor selecionado ' + (novoValor +1).toString();
                    });
                }),
            RaisedButton(
              onPressed: (){
              },
              color: Colors.blue,
              child: Text('Salvar',
                style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
