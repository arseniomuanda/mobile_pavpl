import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle fonte(BuildContext context,
        {bool isButton = false}) =>
    GoogleFonts.acme(
        color: isButton
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.primary,
        fontSize: 15);
