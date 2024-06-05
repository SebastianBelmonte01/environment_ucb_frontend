import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/request_cubit/request_cubit.dart';

class MyEndTimePicker extends StatefulWidget {
  const MyEndTimePicker({super.key});

  @override
  State<MyEndTimePicker> createState() => _MyEndTimePickerState();
}

class _MyEndTimePickerState extends State<MyEndTimePicker> {

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
                    color: const Color(0xFFD3D3D3),
                    child: CupertinoDatePicker(
                      initialDateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 8, 0, 0),
                      mode: CupertinoDatePickerMode.time,
                      use24hFormat: true,
                      minimumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 8, 0, 0),
                      maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 20, 0, 0),
                      // This is called when the user changes the time.
                      onDateTimeChanged: (DateTime newTime) {
                        BlocProvider.of<RequestCubit>(context).setEndTime(newTime);
                      },
                    ),
                  );
                });
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(50, 30),
            backgroundColor: Color(0xFF2C3E6C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
        
      ),
          child: const Icon(Icons.watch_later),
    );
  }
}