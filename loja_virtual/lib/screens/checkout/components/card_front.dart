import 'package:brasil_fields/brasil_fields.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual/screens/checkout/components/card_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class CardFront extends StatelessWidget {

  CardFront({this.numberFocus, this.dateFocus, this.nameFocus, this.finished});

  //validação do ano do cartão
  final dateFormatter = MaskTextInputFormatter(
    mask: '##/####', filter: {'#': RegExp('[0-9]')}
  );

  final VoidCallback finished;
  final FocusNode numberFocus;
  final FocusNode dateFocus;
  final FocusNode nameFocus;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,

      //deixar arredondado
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 16,
      child: Container(
        height: 200,
        color: const Color(0xFF1B4B52),
        padding: EdgeInsets.all(24),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  //CARDTEXTFIELD PASSEI POR PARAMETRO
                  CardTextField(
                    title: 'Número',
                    hint: '0000 0000 0000 0000',
                    textInputType: TextInputType.number,
                    bold: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CartaoBancarioInputFormatter(),
                    ],
                    validator: (number){
                      if(number.length != 19)
                        return 'Inválido';
                      else if(detectCCType(number) == CreditCardType.unknown)
                        return 'Inválido';
                      return null;
                        },
                    onSubmitted: (_){
                      dateFocus.requestFocus();
                    },
                    focusNode: numberFocus,
                  ),
                  CardTextField(
                    title: 'Validade',
                    hint: '11/2020',
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      dateFormatter,
                    ],
                    validator: (date){
                      if(date.length != 7)
                        return 'Inválido';
                      return null;
                    },
                    onSubmitted: (_){
                      nameFocus.requestFocus();
                    },
                    focusNode: dateFocus,
                  ),
                   CardTextField(
                    title: 'Titular',
                    hint: 'Pedro Albuquerque da Silva',
                    textInputType: TextInputType.text,
                    bold: true,
                     validator: (name){
                      if(name.isEmpty) return 'Inválido';
                      return null;
                     },
                     onSubmitted: (_){
                       finished();
                     },
                     focusNode: nameFocus,
                   ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}