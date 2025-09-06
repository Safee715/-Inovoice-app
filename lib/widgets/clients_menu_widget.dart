import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/client_page/viewmodel/client_page_viewmodel.dart';
import 'package:DummyInvoice/pages/client_view_details_page/view/client_view_details_page.dart';
import 'package:DummyInvoice/pages/edit_details_page/view/edit_client.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';

class ClientsMenuWidget extends StatefulWidget {
  const ClientsMenuWidget({
    super.key,
    required this.id,
    required this.constants,
    required this.clientPageViewmodel,

  });
  final int id;
  final Constants constants;
  final ClientPageViewmodel clientPageViewmodel;

  @override
  State<ClientsMenuWidget> createState() =>
      _ClientsMenuWidgetState();
}

class _ClientsMenuWidgetState
    extends State<ClientsMenuWidget> {

  @override
  Widget build(BuildContext context) {



    return PopupMenuButton(
      onSelected: (value) {
        print('value is $value');
        if (value == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditClient(id: widget.id,
                  clientPageViewmodel: widget.clientPageViewmodel,);
              },
            ),
          );
        } else if (value == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ClientViewDetailsPage(
                  id: widget.id,
                );
              },
            ),
          );
        } else if (value == 2) {
          return widget.clientPageViewmodel
              .delete_Client(widget.id);
        }
      },

      color:  Theme.of(context)
          .getBottomContainerColor()
          .withValues(alpha: 0.8),
      icon: CustomIconWidget(
        iconaddress: Theme.of(context)
            .getMenuIcon(),
        height: 24,
        weight: 24,
      ),

      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            leading: CustomIconWidget(
              iconaddress:
                  Assets.EditIcon,
              height: 18,
              weight: 18,
              color: Theme.of(context)
                  .getTextColor(),
            ),
            title: Text(widget.constants.popMenuText[0]),
          ),
          value: 0,
        ),
        PopupMenuItem(
          child: ListTile(
            leading: CustomIconWidget(
              iconaddress:
              Assets.ViewIcon,
              height: 18,
              weight: 18,
              color: Theme.of(context)
                  .getTextColor(),
            ),
            title: Text(widget.constants.popMenuText[1]),
          ),
          value: 1,
        ),
        PopupMenuItem(
          child: ListTile(
            leading: CustomIconWidget(
              iconaddress:
              Assets.DeleteIcon,
              height: 18,
              weight: 18,
              color: Theme.of(context)
                  .getTextColor(),
            ),
            title: Text(widget.constants.popMenuText[2]),
          ),
          value: 2,
        ),
      ],
    );
  }
}
