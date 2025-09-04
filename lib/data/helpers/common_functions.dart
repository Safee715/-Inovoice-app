import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/widgets/custom_elevatedButton.dart';
import 'package:flutter/material.dart';

class CommonFunctions {

  Future<bool>  showSecurityPrompt(BuildContext context) async{
    return await  showDialog<bool>(context: context,
      builder: (BuildContext dialogueContext) {
        return AlertDialog(actionsAlignment: MainAxisAlignment.spaceBetween,
          content: Text('Are you want to exit?'),
          actions: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                        function: (){
                          Navigator.of(dialogueContext).pop(false);
                        },
                        textColor: Theme.of(dialogueContext).getHintTextColor(),
                        buttonColor: Colors.transparent,
                      borderColor: Theme.of(dialogueContext).getHintTextColor(),
                        text: 'No',
                      gradient: false,
                        ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomElevatedButton(
                      function: (){
                        Navigator.of(dialogueContext).pop(true);
                      },
                      textColor: Color(0xffffffff),
                      borderColor: Colors.transparent,
                      buttonColor: Colors.transparent,
                     text: 'Yes',
                      gradient: true,

                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    )?? false;
  }


  void backButtonForSubNavigationPages(BuildContext context)
  {      client_page_index.value=0;

  if(selected_page_notifier.value == 0) {
      Navigator
          .of(context)
          .pop();

    }
    else {
      selected_page_notifier.value =0;
    }
  }







}