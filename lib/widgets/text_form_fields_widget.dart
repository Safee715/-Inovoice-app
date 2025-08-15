import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
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

    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    bool isDark=Theme.of(context).brightness==Brightness.dark;
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),

            Text(widget.labelText,
              style: TextStyle(fontSize: 14,fontFamily: 'Biennale',
                  fontWeight: FontWeight.w500,
                  color:homePageViewmodel.getTextColor(isDark)),
            ),

        SizedBox(height:homePageViewmodel.getWidth(context, 7),),

        TextFormField(
          decoration: InputDecoration(filled: true,
            fillColor: homePageViewmodel.getTextFormFieldColor(isDark),
            border:OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5),
            ),

            hintText: widget.hintText,
            hintStyle: TextStyle(fontSize: 12,fontFamily: 'Biennale',
                fontWeight: FontWeight.w500,
                color: homePageViewmodel.getHintTextColor(isDark)),

            contentPadding: EdgeInsets.only(left:10,right: 10 ),


          ),
        ),
      ],
    );
  }
}


