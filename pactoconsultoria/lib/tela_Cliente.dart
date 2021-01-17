import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  @override
  _TelaClienteState createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
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
                
                Image.asset('images/detalhe_cliente.png'),
                SizedBox(width: 12,),
                Text('Empresa de Software'),
              ],
            ),
            Image.asset('images/cliente1.png'),
            SizedBox(height: 16,),
            Image.asset('images/cliente2.png'),
          ],
        ),
      ),
    );
  }
}
