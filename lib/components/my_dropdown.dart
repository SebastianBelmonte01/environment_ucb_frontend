import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LabelRepositoryCubit, LabelRepositoryState>(
      builder: (context, state){
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: 
            DropdownButton(
              //Make the size of the dropdown button the same as the textfiel
              isExpanded: true,
              value: state.labels[state.selectedLabelIndex].info,
              items: state.labels.map<DropdownMenuItem<String>>((Label value) {
                return DropdownMenuItem<String>(
                  value: value.info,
                  child: Text(value.info!),
                );
              }).toList(),
              onChanged: (String? selectedLabel) {
                BlocProvider.of<LabelRepositoryCubit>(context).updateSelectedLabel(selectedLabel!);
              }
            )
        );
      },
    );
  }
}