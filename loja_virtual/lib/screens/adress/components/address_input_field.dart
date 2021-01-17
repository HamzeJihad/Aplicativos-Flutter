import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual/modelos/address.dart';
import 'package:loja_virtual/modelos/cart_manager.dart';
import 'package:provider/provider.dart';
//CAMPO APÓS CLICAR EM BUSCAR CEP


class AddressInputField extends StatelessWidget {


  const AddressInputField(this.address);

  final Address address;
  @override
  Widget build(BuildContext context) {

    final primarycolor = Theme.of(context).primaryColor;
    final cartManager  = context.watch<CartManager>();

    String emptyValidator(String text) => text.isEmpty ? 'Campo Obrigatório' : null;

    //se meu endereço for diferente de null  e  se eu não tenho preço calculado mostro o formulário.
    if(address.zipCode != null && cartManager.deliveryPrice == null) {
      return Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        TextFormField(
          enabled:  !cartManager.loading,
          initialValue: address.street,
          decoration: const InputDecoration(
            isDense: true,
            labelText: 'Rua/Avenida',
            hintText: 'Av.Brasil',
          ),
          validator: emptyValidator,
          onSaved: (t) => address.street = t,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                enabled:  !cartManager.loading,
                initialValue: address.number,
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: 'Número',
                  hintText: '123',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                validator: emptyValidator,
                onSaved: (t) => address.number = t,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: TextFormField(
                enabled:  !cartManager.loading,
                initialValue: address.complement,
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: 'Complemento',
                  hintText: 'Opcional',
                ),
                onSaved: (t) => address.complement = t,
              ),
            ),
          ],
        ),
        TextFormField(
          enabled:  !cartManager.loading,
          initialValue: address.district,
          decoration: const InputDecoration(
            isDense: true,
            labelText: 'Bairro',
            hintText: 'Vila Regina',
          ),
          validator: emptyValidator,
          onSaved: (t) => address.district = t,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: TextFormField(
                enabled: false,
                initialValue: address.city,
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: 'Cidade',
                  hintText: 'Goiânia',
                ),
                validator: emptyValidator,
                onSaved: (t) => address.city = t,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: TextFormField(
                autocorrect: false,
                enabled: false,
                textCapitalization: TextCapitalization.characters,
                initialValue: address.state,
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: 'UF',
                  hintText: 'GO',
                  counterText: '',
                ),
                maxLength: 2,
                validator: (e) {
                  if (e.isEmpty) {
                    return 'Campo obrigatório';
                  } else if (e.length != 2) {
                    return 'Inválido';
                  }
                  return null;
                },
                onSaved: (t) => address.state = t,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8,),

        if(cartManager.loading)
          LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation(primarycolor),
            backgroundColor: Colors.transparent,
          ),

        //botao de calcular frete
        RaisedButton(
          color: Theme.of(context).primaryColor,
          disabledColor: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onPressed: !cartManager.loading ?() async{

            if(Form.of(context).validate()) {
              Form.of(context).save();
              try {
                await context.read<CartManager>().setAddress(address);

              }
              catch (e) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                      content: Text('$e'),
                    backgroundColor: Colors.red,
                  )
                );
              }
            }
          }: null,

          child: const Text('Calcular Frete'),
        ),
      ],
     );
    } else if(address.zipCode != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text(
            '${address.street}, ${address.number}\n${address.district}\n'
                '${address.city} - ${address.state}'),
      );
    } else
      return Container();
  }
}