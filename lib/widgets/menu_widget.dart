import 'package:DummyInvoice/pages/edit_details_page/edit_client.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/pages/view_details_page/view_details.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    bool isDark=Theme.of(context).brightness==Brightness.dark;
List<Widget> pages=[EditClient(),ViewDetails()];

    return PopupMenuButton(
      onSelected: (value) {
       Navigator.push(context,
           MaterialPageRoute(builder: (context) {
            if(value==0 ||value==2)
              {
                return pages[0];
              }
            else
            {
              return pages[1];
            }

           },
           )
       );
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
