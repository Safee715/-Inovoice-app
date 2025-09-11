import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/edit_profile_page/view/editprofileview.dart';
import 'package:DummyInvoice/pages/profile_page/viewmodel/profile_page_viewmodel.dart';
import 'package:DummyInvoice/pages/viewprofile/view/viewprofile.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';
import 'package:provider/provider.dart';

class ProfileMenuWidget extends StatefulWidget {
  const ProfileMenuWidget({
    super.key,
    required this.id,
    required this.constants,

  });
  final int id;
  final Constants constants;

  @override
  State<ProfileMenuWidget> createState() =>
      _ProfileMenuWidgetState();
}

class _ProfileMenuWidgetState
    extends State<ProfileMenuWidget> {

  @override
  Widget build(BuildContext context) {
    final  profilePageViewmodel= context.read<ProfilePageViewmodel>();
    return PopupMenuButton(
      onSelected: (value) async{
        print('value is $value');
        if (value == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditProfile(id: widget.id,
                  );
              },
            ),
          );
        } else if (value == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ViewProfile(
                  id: widget.id,
                );
              },
            ),
          );
        } else if (value == 2) {
          return await profilePageViewmodel
              .deleteProfile(widget.id);
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
