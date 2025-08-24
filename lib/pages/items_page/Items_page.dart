import 'package:DummyInvoice/pages/add_items_page/add_items_page.dart';
import 'package:DummyInvoice/pages/client_page/client_page_viewmodel.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/pages/items_page/item_page_repository.dart';
import 'package:DummyInvoice/pages/items_page/items_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';
import 'package:DummyInvoice/widgets/item_details.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:provider/provider.dart';

class ItemsPage extends StatefulWidget {
   ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  late HomePageViewmodel homePageViewmodel;
  late ItemsPageViewmodel itemsPageViewmodel;
ItemPageRepository itemPageRepository=ItemPageRepository();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homePageViewmodel = HomePageViewmodel(
      screenWidth: MediaQuery.of(context).size.width,
      screenHeight: MediaQuery.of(context).size.height,
    );
  }
  @override
  void initState()
  {
    super.initState();
    itemsPageViewmodel =ItemsPageViewmodel(itemPageRepository);
    itemsPageViewmodel.loadItems();

  }

  @override
  Widget build(BuildContext context) {
    bool isDark =Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      appBar: AppBar(scrolledUnderElevation: 0,
        backgroundColor: Color(0xFE7EBF2),
        leading: IconButton(
          onPressed: () {
            selected_page_notifier.value = 0;
          },
          icon: Icon(Icons.arrow_back_ios_outlined,
            color: homePageViewmodel.getTextColor(isDark),),
        ),title:  Text('Items',
            style: TextStyle(color:homePageViewmodel.getTextColor(isDark) ,
                fontSize: 24, fontWeight: FontWeight.bold),

        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: homePageViewmodel.getWidth(15),
          right: homePageViewmodel.getWidth(15),
        ),
        child: ValueListenableBuilder(
          valueListenable: itemsPageViewmodel.items,
          builder: (context, items, child) {
            if (items.isEmpty) {
              return Center(
                child: Container(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIconWidget(iconaddress: 'assets/images/icons/noDataIcon.svg',
                        height: homePageViewmodel.getWidth(65),
                        weight: homePageViewmodel.getWidth(114)
                    ),
                      Text(maxLines: 2,softWrap: true,
                        'No Data Available!',style: TextStyle(
                      color: Color(0xffBEC0CC),fontSize: 14,
                    ),
                    ),
                  ],
                )),
              );
            } else {
              print(items.length);
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item=items[index];
                  final bool isLast = index == items.length - 1;
                  print('index==$index');
                  return Padding(
                    padding: EdgeInsets.only(
                      top: homePageViewmodel.getWidth(5),
                      bottom: homePageViewmodel.getWidth(isLast ? 50 : 5),
                    ),
                    child: ItemDetails(
                      itemsPageViewmodel: itemsPageViewmodel,
                      name: item.itemName,
                      price:item.itemPrice,
                      id: item.id!,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: IconButton(
      onPressed: () {
          context.read<ClientPageViewmodel>().clearControllers();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return  AddItemsPage();

            },
          ),
        );
      },
      icon: CustomIconWidget(
        iconaddress: itemsPageViewmodel.addButtonAddress,
        height: 54,
        weight: 54,
      ),
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

    );
  }
}
