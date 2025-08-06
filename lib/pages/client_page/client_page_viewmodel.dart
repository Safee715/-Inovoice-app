import 'package:invoiceapp/data/notifiers.dart';


class ClientPageViewmodel {

  List<String> names=[
    'Jhon Wick',
    'Peter Tinger',
    'Iron Man',
    'Jhon Wick',
    'Peter Tinger',
    'Iron Man',
    'Jhon Wick',
    'Peter Tinger',
    'Iron Man'
  ];
  List<String> emails=[
    'jhon@gmail.com',
    'peter@gmail.com',
    'iron@gmail.com',
    'jhon@gmail.com',
    'peter@gmail.com',
    'iron@gmail.com',
    'jhon@gmail.com',
    'peter@gmail.com',
    'iron@gmail.com'
  ];
final addButtonAddress='assets/images/icons/add clients.svg';
void backButtonFunction()
{
  selected_page_notifier.value=0;
}

}
