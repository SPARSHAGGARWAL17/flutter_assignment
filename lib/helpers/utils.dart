import 'package:flutter/material.dart';

double getDeviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getDeviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

SizedBox hSpacing([double value = 15]) => SizedBox(width: value);

SizedBox vSpacing([double value = 15]) => SizedBox(height:   value);

const Color kBrownColor = Color(0xff8d756e);