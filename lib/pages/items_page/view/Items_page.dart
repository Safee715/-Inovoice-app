import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/common_functions.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/add_items_page/view/add_items_page.dart';
import 'package:DummyInvoice/pages/items_page/viewmodel/items_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';
import 'package:DummyInvoice/pages/items_page/Widgets/item_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemsPage extends StatefulWidget {
  ItemsPage({super.key, this.constants});

  final Constants? constants;

  @override
  State<ItemsPage> createState() =>
      _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  CommonFunctions commonFunctions =
      CommonFunctions();

  @override
  Widget build(BuildContext context) {
    print('ItemsPage');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(
          context,
        ).getBackColor(),
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            commonFunctions
                .backButtonForSubNavigationPages(
                  context,
                );
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Theme.of(
              context,
            ).getTextColor(),
          ),
        ),
        title: Text(
          widget.constants!.itemsAppBarTitle,
          style: TextStyle(
            color: Theme.of(
              context,
            ).getTextColor(),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _buildBody(),
      floatingActionButton:
          _buildFloatingActionButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endDocked,
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.only(
        left: context.getWidth(15),
        right: context.getWidth(15),
      ),
      child: Consumer<ItemsPageViewmodel>(
        builder: (context, itemsPageViewmodel, child) {
          final noOfItems = itemsPageViewmodel.getItemsNumber();
          if (noOfItems == 0) {
            return Center(
              child: Container(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    CustomIconWidget(
                      iconaddress:
                          Assets.NoDataIcon,
                      height: context.getWidth(
                        65,
                      ),
                      weight: context.getWidth(
                        114,
                      ),
                    ),
                    Text(
                      widget
                          .constants!
                          .noDataAvailableText,
                      maxLines: 2,
                      softWrap: true,

                      style: const TextStyle(
                        color: Color(0xffBEC0CC),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: noOfItems,
              itemBuilder: (context, index) {
                final currentItem =
                    itemsPageViewmodel.getItem(
                      index,
                    );
                final bool isLast =
                    index == noOfItems - 1;
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
                    name: currentItem.itemName,
                    price: currentItem.itemPrice,
                    id: currentItem.id!,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    final itemsPageViewmodel = context
        .read<ItemsPageViewmodel>();
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const AddItemsPage();
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
