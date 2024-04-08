import 'package:flutter/material.dart';

class Constantes {
  static double larguraDaTela(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double alturaDaTela(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
