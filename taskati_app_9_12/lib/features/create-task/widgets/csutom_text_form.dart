import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app_9_12/core/utils/styles.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm(
      {super.key, required this.con, required this.name, required this.lines});
  final TextEditingController con;
  final String name;
  final int lines;
  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: getTitleStyle(fontSize: 16),
        ),
        const Gap(5),
        TextFormField(
          controller: widget.con,
          maxLines: widget.lines,
          validator: (value) {
            if (value!.isEmpty) {
              return '${widget.name} is required*';
            }

            return null;
          },
          decoration: InputDecoration(hintText: 'Enter ${widget.name} Here'),
        ),
      ],
    );
  }
}
