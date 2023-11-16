import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pavpl/app/helpers/text_helper.dart';
import 'package:mobile_pavpl/app/helpers/time_helper.dart';
import 'package:mobile_pavpl/app/routing/route_handler.dart';
import 'package:mobile_pavpl/widgets/data_picker.widget.dart';
import 'package:mobile_pavpl/widgets/text_field.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SchedulingPage extends StatefulWidget {
  SchedulingPage({super.key});

  @override
  State<SchedulingPage> createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  final timeController = TextEditingController();
  final dateController = TextEditingController();

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
            text: TextSpan(
                style: fonte(context),
                text: 'Nº',
                children: const [TextSpan(text: '99999999')])),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed(MRRoutes.perfil),
              icon: const Icon(Icons.person_3)),
          IconButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed(MRRoutes.login),
              icon: const Icon(Icons.exit_to_app))
        ],
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MRTextField(
              suffixIconButton: IconButton(
                icon: const Icon(Icons.today),
                onPressed: () async {
                  pickDate(context).then((value) {
                    if (value != null) {
                      setState(() {
                        dateController.text = formateDate2.format(value);
                      });
                    }
                  });
                  //final date = pickDate(context);
                },
              ),
              hint: "YYYY/MM/DD",
              label: "Data",
              controller: dateController,
            ),
            MRTextField(
                suffixIconButton: IconButton(
                    icon: const Icon(Icons.schedule),
                    onPressed: () {
                      pickTime(context).then((value) {
                        if (value != null) {
                          timeController.text = "${value.hour}:${value.minute}";
                        }
                      });
                    }),
                hint: "HH:mm",
                label: "Hora",
                controller: timeController),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Confirmar',
                    style: fonte(context, isButton: true),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
