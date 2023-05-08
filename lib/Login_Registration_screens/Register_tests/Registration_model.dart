import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegModel extends StatelessWidget
{
  IconData icon;
  String labelText;
  TextInputType? keyboardType;
  var fieldCont;

  RegModel({
    required this.icon,
    required this.labelText,
    this.keyboardType,
    required this.fieldCont,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldCont,
      keyboardType: keyboardType,
        validator: (writtenData)
        {
          if(writtenData!.isEmpty)
            {
              return 'This Field is required';
            }
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon),
          labelText: labelText,
          hintText: labelText,
        ),
      );
  }

}