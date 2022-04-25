
import 'package:flutter/material.dart';

import '../constantes.dart';

class ExtraInfo extends StatelessWidget {
  const ExtraInfo({
    Key? key,
    required this.icon, required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: mauve),
            SizedBox(width: 10,),
            Text(text,style: TextStyle(color: mauve),),
          ],
        ));
  }
}
