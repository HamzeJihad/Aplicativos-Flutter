import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  @override
  _TelaContatoState createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset('images/detalhe_contato.png'),
                SizedBox(width: 12,),
                Text('pactosolucoes@hotmail.com'),
              ],
            ),
            SizedBox(height: 12,),
            Text('Contato: (62) 98556-6262'),
          ],
        ),
      ),
    );
  }
}
