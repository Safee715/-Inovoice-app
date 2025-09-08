import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/widgets/custom_elevatedButton.dart';
import 'package:flutter/material.dart';

class CommonFunctions {

  Future<bool>  showSecurityPrompt(BuildContext context) async{
    return await  showDialog<bool>(context: context,
      builder: (BuildContext dialogueContext) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceBetween,
          content: Container(
            height: 100,
            child: Column(spacing: 10,mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(backgroundColor: Colors.red.withValues(alpha: 0.1),radius: 35,
                  child: Icon(Icons.exit_to_app_outlined,color: Colors.red,size: 30,),),
                Text('Are you sure you want to exit?',style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
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