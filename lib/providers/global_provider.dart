import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_pavpl/app/data/dummy_data.dart';

var visitaProvider = StateProvider((ref) => Visita());

var prisonerProvider = StateProvider((ref) => Prisoner());

var tabIndexProvider = StateProvider((ref)=> int);
