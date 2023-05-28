import 'package:environment_ucb/cubit/request_cubit/request_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_icon_button.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerState extends State<DatePicker>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime selectedDate = RestorableDateTime(DateTime.now().add(Duration(days: 2)));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime.now().add(Duration(days: 2)),
          lastDate: DateTime(2029),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  } 

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      BlocProvider.of<RequestCubit>(context).setDate(newSelectedDate);
      // setState(() {
      //   selectedDate.value = newSelectedDate;
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text(
      //         'Selected: ${selectedDate.value.day}/${selectedDate.value.month}/${selectedDate.value.year}'),
      //   ));
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _restorableDatePickerRouteFuture.present();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(50, 30),
        primary: Color(0xFF2C3E6C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          
        ),
        
      ),
      child: Icon(Icons.calendar_today_outlined)
    );
  }


}
