import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {

  String _escolhaUsuario;
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
            
            RadioListTile(
              title: Text('Masculino'),
                value: 'm',
                groupValue: _escolhaUsuario,
                onChanged: (String escolha){
                  setState(() {
                  _escolhaUsuario = escolha;
                  });
                  }),
          RadioListTile(
          title: Text('Feminino'),
          value: 'f',
          groupValue: _escolhaUsuario,
          onChanged: (String escolha){
          setState(() {
          _escolhaUsuario = escolha;
          });
          }),

         RaisedButton(onPressed: (){},
           color: Colors.blue,
         child: Text('Salvar',
         style: TextStyle(color: Colors.white),),
         )

    /*
            Text('Masculino'),
            Radio(
                value: 'm',
                groupValue: _escolhaUsuario,
                onChanged: (String escolha){
                    setState(() {
                      _escolhaUsuario = escolha;
                    });
                }),

            Text('Feminino'),
            Radio(
                value: 'f',
                groupValue: _escolhaUsuario,
                onChanged: (String escolha){
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                })*/
          ],
        ),
      ),
    );
  }
}
