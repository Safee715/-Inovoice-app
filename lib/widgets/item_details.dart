import 'package:DummyInvoice/pages/items_page/items_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/items_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key,
    required  this.name,
    required this.price,
    required this.id,
    required this.itemsPageViewmodel,

  });

  final String name;
  final double price;
  final id;
  final ItemsPageViewmodel itemsPageViewmodel ;
  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    bool isDark=Theme.of(context).brightness==Brightness.dark;
    return ListTile(contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 8.0),
      minLeadingWidth: 30,horizontalTitleGap: 5,
      dense: true,
      tileColor: homePageViewmodel.getBottomContainerColor(isDark),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10),
          side: BorderSide(color:homePageViewmodel.getTextColor(isDark).withValues(alpha: 0.2), )
      ),

      title: Row(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10),
          Text(widget.name,style: TextStyle(
              color:homePageViewmodel.getTextColor(isDark),
              fontWeight: FontWeight.w400,fontSize: 14),),
          Spacer(),
          Text("\$${widget.price.toString()}",
            style: TextStyle(color:Color(0xFF4082E3),fontSize: 12
          ),
          ),
        ],
      ),
      trailing: ItemsMenuWidget(itemsPageViewmodel: widget.itemsPageViewmodel,id: widget.id),


    );

  }
}
