import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/add_items_page/view/add_items_page.dart';
import 'package:DummyInvoice/pages/client_page/viewmodel/client_page_viewmodel.dart';
import 'package:DummyInvoice/pages/items_page/repo/item_page_repository.dart';
import 'package:DummyInvoice/pages/items_page/viewmodel/items_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';
import 'package:DummyInvoice/pages/items_page/Widgets/item_details.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:provider/provider.dart';

class ItemsPage extends StatefulWidget {
  ItemsPage({super.key,this.constants});

  final Constants ?constants;
  @override
  State<ItemsPage> createState() =>
      _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  late ItemsPageViewmodel itemsPageViewmodel;
  ItemPageRepository itemPageRepository =
      ItemPageRepository();

  @override
  void initState() {
    super.initState();
    itemsPageViewmodel = ItemsPageViewmodel(
      itemPageRepository,
    );
    itemsPageViewmodel.loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Color(0xFE7EBF2),
        leading: IconButton(
          onPressed: () {
            selected_page_notifier.value = 0;
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Theme.of(
              context,
            ).getTextColor(),
          ),
        ),
        title: Text(
          'Items',
          style: TextStyle(
            color: Theme.of(
              context,
            ).getTextColor(),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: context.getWidth(15),
          right: context.getWidth(15),
        ),
        child: ValueListenableBuilder(
          valueListenable:
              itemsPageViewmodel.items,
          builder: (context, items, child) {
            if (items.isEmpty) {
              return Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      CustomIconWidget(
                        iconaddress:Assets.NoDataIcon,
                        height: context.getWidth(
                          65,
                        ),
                        weight: context.getWidth(
                          114,
                        ),
                      ),
                      Text(widget.constants!.noDataAvailableText,
                        maxLines: 2,
                        softWrap: true,

                        style: TextStyle(
                          color: Color(
                            0xffBEC0CC,
                          ),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              print(items.length);
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final bool isLast =
                      index == items.length - 1;
                  print('index==$index');
                  return Padding(
                    padding: EdgeInsets.only(
                      top: context.getWidth(5),
                      bottom: context.getWidth(
                        isLast ? 50 : 5,
                      ),
                    ),
                    child: ItemDetails(
                      itemsPageViewmodel:
                          itemsPageViewmodel,
                      name: item.itemName,
                      price: item.itemPrice,
                      id: item.id!,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endDocked,
    );
  }

  Widget _buildFloatingActionButton()
  {
    return IconButton(
      onPressed: () {
        context
            .read<ClientPageViewmodel>()
            .clearControllers();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddItemsPage();
            },
          ),
        );
      },
      icon: CustomIconWidget(
        iconaddress:
        itemsPageViewmodel.addButtonAddress,
        height: 54,
        weight: 54,
      ),
    );
  }


}
