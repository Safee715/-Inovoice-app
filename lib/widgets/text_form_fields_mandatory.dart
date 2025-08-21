
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldsMandatory extends StatefulWidget {
  const TextFormFieldsMandatory({
    super.key,
    required this.labelText,
    this.hintText,
    required this.isMandatory,
    this.controller,
    this.enabled,
     this.textInputType,
    this.maxLength,
    this.validator,
    this.inputFormatter,
  });
  final String labelText;
  final TextEditingController? controller;
  final String? hintText;
  final bool isMandatory;
  final bool? enabled;
  final TextInputType ?textInputType;
  final  int ?maxLength;
  final String? Function(String?)?  validator;
  final TextInputFormatter ?inputFormatter;
  @override
  State<TextFormFieldsMandatory> createState() =>
      _TextFormFieldsMandatoryState();
}

class _TextFormFieldsMandatoryState extends State<TextFormFieldsMandatory> {
  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel = HomePageViewmodel();
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.labelText,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Biennale',
                fontWeight: FontWeight.w500,
                color: homePageViewmodel.getTextColor(isDark),
              ),
            ),
            widget.isMandatory
                ? Text(
                    '*',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Biennale',
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
        TextFormField(
          inputFormatters: widget.inputFormatter==null?null:[widget.inputFormatter!],
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          keyboardType: widget.textInputType,
          maxLength:widget.maxLength,
          controller: widget.controller,
          validator: (value) =>widget.validator?.call(value),
          enabled: widget.enabled,
          cursorColor: Color(0xFF4082E3),
          decoration: InputDecoration(
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xFF4082E3),width: 2,
                ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF4082E3),width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
                borderSide:  BorderSide(
                    color:Colors.red,width: 1)),
            fillColor: homePageViewmodel.getTextFormFieldColor(isDark),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Biennale',
              fontWeight: FontWeight.w500,
              color: homePageViewmodel.getHintTextColor(isDark),
            ),
            contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
          ),
        ),
      ],
    );
  }
}
