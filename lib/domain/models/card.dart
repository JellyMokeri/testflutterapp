import 'package:flutter/material.dart';

class CardData {
  final String text;
  final String descriptionText;
  final IconData icon;
  final String? imageUrl;

  CardData (
      this.text,{
        this.icon = Icons.ac_unit_outlined,
        required this.descriptionText,
        this.imageUrl,
      });
}