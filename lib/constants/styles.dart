import 'package:flutter/material.dart';

TextStyle getStyle(double size, {String? family}) => TextStyle(
    fontSize: size,
    color: Colors.white,
    height: 1,
    fontFamily: family ?? 'Arco');
