import 'package:flutter/material.dart';

class TextFormFieldsWidget extends StatefulWidget {
  const TextFormFieldsWidget({super.key,required this.labelText,required this.hintText});

  final String labelText;
  final String hintText;
  @override
  State<TextFormFieldsWidget> createState() => _TextFormFieldsWidgetState();
}

class _TextFormFieldsWidgetState extends State<TextFormFieldsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),

            Text(widget.labelText,
              style: TextStyle(color: Colors.black),
            ),


        TextFormField(
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


