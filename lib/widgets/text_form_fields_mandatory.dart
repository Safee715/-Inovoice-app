import 'package:flutter/material.dart';

class TextFormFieldsMandatory extends StatefulWidget {
  const TextFormFieldsMandatory({super.key,
    required this.labelText,
    required this.hintText});
  final String labelText;
  final String hintText;

  @override
  State<TextFormFieldsMandatory> createState() => _TextFormFieldsMandatoryState();
}

class _TextFormFieldsMandatoryState extends State<TextFormFieldsMandatory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Row(
          children: [
            Text(widget.labelText,
              style: TextStyle(color: Colors.black),
            ),
            Text('*'
              ,style: TextStyle(color: Colors.red),
            ),

          ],
        ),
        TextFormField(validator: (value) {
          if((value==null)||(value.isEmpty))
            {
              return 'Please fill out the mandatory fields';
            }
          return null;
        },
          decoration: InputDecoration(filled: true,fillColor: Color(0xFFD8DAE5),
            border:OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: widget.hintText,
            contentPadding: EdgeInsets.all(15),


          ),
        ),
      ],
    );
  }
}
