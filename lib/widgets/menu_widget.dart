import 'package:flutter/material.dart';
import 'package:invoiceapp/widgets/custom_icon_widget.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(color: Colors.white,
      icon: CustomIconWidget(
          iconaddress: 'assets/images/icons/edit_delete_button.svg',
          height: 24, weight: 24),
      onSelected: (value) {
        Navigator.pushNamed(context, value);
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          child:ListTile(leading:CustomIconWidget(
              iconaddress: 'assets/images/icons/Group 37201.svg',
              height: 18, weight: 18),
            title: Text('Edit'),
          ),
          value: 'edit',
        ),
        PopupMenuItem(
          child: ListTile(leading:CustomIconWidget(
              iconaddress: 'assets/images/icons/eye.svg',
              height: 18, weight: 18),title: Text('View Details'),
          ),
          value: 'details',
        ),
        PopupMenuItem(
          child: ListTile(leading:CustomIconWidget(
              iconaddress: 'assets/images/icons/trash.svg',
              height: 18, weight: 18),title: Text('Delete'),
          ),
          value: 'delete',
        ),

      ],
    );
  }
}
