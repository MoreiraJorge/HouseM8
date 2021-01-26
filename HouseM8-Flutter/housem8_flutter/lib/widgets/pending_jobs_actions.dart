import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PendingJobsActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      IconButton(
        icon: Icon(Icons.work),
        color: Color(0xFF5B82AA),
        iconSize: 30,
        tooltip: 'Trabalho correspondente',
        onPressed: () =>
            print('Redirecionar para a página do Trabalho selecionado'),
      ),
      IconButton(
        icon: Icon(Icons.message),
        color: Color(0xFF5B82AA),
        iconSize: 30,
        tooltip: 'Enviar Mensagem',
        onPressed: () => print('Responder ao Empregador por chat'),
      ),
    ]);
  }
}
