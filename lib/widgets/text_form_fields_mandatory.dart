import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';

class TextFormFieldsMandatory extends StatefulWidget {
  const TextFormFieldsMandatory({super.key,
    required this.labelText,
     this.hintText,
    required this.isMandatory,
     this.controller,
    this.enabeled,
  });
  final String labelText;
  final TextEditingController ?controller;
  final String ?hintText;
  final bool isMandatory;
  final bool ?enabeled;
  @override
  State<TextFormFieldsMandatory> createState() => _TextFormFieldsMandatoryState();
}

class _TextFormFieldsMandatoryState extends State<TextFormFieldsMandatory> {
  @override
  Widget build(BuildContext context) {

    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    bool isDark=Theme.of(context).brightness==Brightness.dark;

    return Column(
      children: [
        SizedBox(height: 20,),
        Row(
          children: [
            Text(widget.labelText,
              style: TextStyle(fontSize: 14,fontFamily: 'Biennale',
                  fontWeight: FontWeight.w500,
                  color: homePageViewmodel.getTextColor(isDark)),
            ),
             widget.isMandatory?
            Text('*'
              ,style: TextStyle(fontSize: 14,fontFamily: 'Biennale',
                  fontWeight: FontWeight.w500,
                  color: Colors.red),
            ):SizedBox.shrink(),

          ],
        ),
        SizedBox(height:homePageViewmodel.getWidth(context, 7),),
        TextFormField(
          controller:widget.controller ,
          validator: (value) {
          if((value==null)||(value.isEmpty))
            {
              return 'Please fill out the mandatory fields';
            }
          return null;
        },enabled:widget.enabeled,
          decoration: InputDecoration(filled: true,
            fillColor:homePageViewmodel.getTextFormFieldColor(isDark),
            border:OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(fontSize: 12,fontFamily: 'Biennale',
                fontWeight: FontWeight.w500,
                color: homePageViewmodel.getHintTextColor(isDark)),
            contentPadding: EdgeInsets.only(left:10,right: 10 ,top:10),

          ),
        ),
      ],
    );
  }
}
