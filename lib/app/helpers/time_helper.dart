import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<DateTime?> pickDate(BuildContext context) => showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2023),
    lastDate: DateTime(2024));

Future<TimeOfDay?> pickTime(BuildContext context) =>
    showTimePicker(context: context, initialTime: TimeOfDay.now());

final formateDate = DateFormat('yyyy-MM-dd hh:mm');
final formateDate2 = DateFormat('yyyy-MM-dd');
final formateTime = DateFormat('hh:mm');
