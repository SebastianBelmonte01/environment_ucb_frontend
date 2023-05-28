import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/request_cubit/request_cubit.dart';

class MyInitTimePicker extends StatefulWidget {
  const MyInitTimePicker({super.key});

  @override
  State<MyInitTimePicker> createState() => _MyInitTimePickerState();
}

class _MyInitTimePickerState extends State<MyInitTimePicker> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: () {
            showCupertinoModalPopup<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 220,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    padding: const EdgeInsets.only(top: 8.0),
                    color: Color(0xFFD3D3D3),
                    child: CupertinoDatePicker(
                      minimumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 8, 0, 0),
                      maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 20, 0, 0),
                      initialDateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 8, 0, 0),
                      mode: CupertinoDatePickerMode.time,
                      use24hFormat: true,
                      // This is called when the user changes the time.
                      onDateTimeChanged: (DateTime newTime) {
                        BlocProvider.of<RequestCubit>(context).setInitTime(newTime);
                      },
                    ),
                  );
                });
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(50, 30),
            primary: Color(0xFF2C3E6C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
        
      ),
          child: Icon(Icons.access_time_outlined),
    );
  }
}