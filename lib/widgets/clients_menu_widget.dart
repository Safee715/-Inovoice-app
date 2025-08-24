import 'package:DummyInvoice/pages/client_page/client_page_viewmodel.dart';
import 'package:DummyInvoice/pages/edit_details_page/edit_client.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/pages/view_details_page/view_details_page.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';
import 'package:provider/provider.dart';

class ClientsMenuWidget extends StatefulWidget {
  const ClientsMenuWidget({super.key,
  required this.id
  });
  final id;
  @override
  State<ClientsMenuWidget> createState() => _ClientsMenuWidgetState();
}

class _ClientsMenuWidgetState extends State<ClientsMenuWidget> {
  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    final clientPageViewmodel=context.watch<ClientPageViewmodel>();
    bool isDark=Theme.of(context).brightness==Brightness.dark;


    return PopupMenuButton(
      onSelected: (value) {
        print('value is $value');
          if (value == 0) {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return EditClient(id: widget.id,);
              },
              ),
            );
          }
          else if (value == 1) {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return ViewDetailsPage(id: widget.id);
              },
              ),
            );
          }
          else if (value == 2) {
            return clientPageViewmodel.delete_Client(widget.id);
          }

      },

      color: homePageViewmodel.getBottomContainerColor(isDark).withValues(alpha: 0.8),
      icon: CustomIconWidget(
          iconaddress: homePageViewmodel.getIconAddress(isDark, 'assets/images/icons/nightmode_menuButton.svg', 'assets/images/icons/edit_delete_button.svg'),
          height: 24, weight: 24,),

      itemBuilder: (context) => [
        PopupMenuItem(
          child:ListTile(leading:CustomIconWidget(
              iconaddress: 'assets/images/icons/Group 37201.svg',
              height: 18, weight: 18,color: homePageViewmodel.getTextColor(isDark),),
            title: Text('Edit'),
          ),
          value: 0,
        ),
        PopupMenuItem(
          child: ListTile(leading:CustomIconWidget(
              iconaddress: 'assets/images/icons/eye.svg',
              height: 18, weight: 18,color: homePageViewmodel.getTextColor(isDark)),title: Text('View Details'),
          ),
          value: 1,
        ),
        PopupMenuItem(
          child: ListTile(leading:CustomIconWidget(
              iconaddress: 'assets/images/icons/trash.svg',
              height: 18, weight: 18,color: homePageViewmodel.getTextColor(isDark)),title: Text('Delete'),
          ),
          value:2,
        ),

      ],


    );
  }
}
