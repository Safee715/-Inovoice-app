import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFields extends StatefulWidget {
  const CustomTextFields({
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
    this.prefix,
  });
  final String labelText;
  final TextEditingController? controller;
  final String? hintText;
  final bool isMandatory;
  final bool? enabled;
  final TextInputType? textInputType;
  final int? maxLength;
  final String? Function(String?)? validator;
  final TextInputFormatter? inputFormatter;
  final String? prefix;
  @override
  State<CustomTextFields> createState() =>
      _CustomTextFieldsState();
}

class _CustomTextFieldsState
    extends State<CustomTextFields> {
  @override
  Widget build(BuildContext context) {
   
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
                color: Theme.of(context)
                    .getTextColor(),
              ),
            ),
            widget.isMandatory
                ? const Text(
                    '*',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Biennale',
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        TextFormField(
          inputFormatters:
              widget.inputFormatter == null
              ? null
              : [widget.inputFormatter!],
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus
                ?.unfocus();
          },

          keyboardType: widget.textInputType,
          maxLength: widget.maxLength,
          controller: widget.controller,
          validator: (value) =>
              widget.validator?.call(value),
          enabled: widget.enabled,
          cursorColor: const Color(0xFF4082E3),
          decoration: InputDecoration(
            filled: true,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF4082E3),
                width: 2,
              ),
            ),
            focusedErrorBorder:
                const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF4082E3),
                    width: 2,
                  ),
                ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            fillColor: Theme.of(context)
                .getTextFormFieldColor(),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
            hintText: widget.hintText,
            prefix: Text(widget.prefix ?? ""),
            prefixStyle: const TextStyle(
              color: Colors.black,
            ),
            hintStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Biennale',
              fontWeight: FontWeight.w500,
              color: Theme.of(context)
                  .getHintTextColor(),
            ),
            contentPadding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
          ),
        ),
      ],
    );
  }
}
