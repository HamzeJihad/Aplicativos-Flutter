import 'package:flutter/material.dart';

class EntradaCheckBox extends StatefulWidget {
  @override
  _EntradaCheckBoxState createState() => _EntradaCheckBoxState();
}

class _EntradaCheckBoxState extends State<EntradaCheckBox> {

  bool _comidaBrasileira = false;
  bool _comidaMexicana = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrada de dados'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              title: Text('Comida Brasileira'),
                subtitle: Text('A melhor comida do mundo!'),
               // cor da marcação do Checkbox activeColor: ,
               // secondary: Icon(Icons.add_box),
                value: _comidaBrasileira ,
                onChanged: (bool valor){
                      setState(() {
                        _comidaBrasileira = valor;
                      });
                }
                ),
            CheckboxListTile(
                title: Text('Comida Mexicana'),
                subtitle: Text('A melhor comida do mundo!'),
                // cor da marcação do Checkbox activeColor: ,
                // secondary: Icon(Icons.add_box),
                value: _comidaMexicana ,
                onChanged: (bool valor){
                  setState(() {
                    _comidaMexicana = valor;
                  });
                }
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text('Salvar',
              style: TextStyle(fontSize: 20, color: Colors.white),),
                onPressed: (){

                },
            ),

          ],
        ),
      ),
    );
  }
}
