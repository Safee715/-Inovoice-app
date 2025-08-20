import 'package:DummyInvoice/pages/client_page/client_page_viewmodel.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/pages/view_details_page/view_details_viewmodel.dart';
import 'package:DummyInvoice/widgets/text_form_fields_mandatory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ViewDetails extends StatefulWidget {
  const ViewDetails({
    super.key,
  required this.id
  });
final id;
  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {

  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    ViewDetailsViewmodel viewDetailsViewmodel=ViewDetailsViewmodel();
    bool isDark=Theme.of(context).brightness==Brightness.dark;
    final clientPageViewmodel=context.watch<ClientPageViewmodel>();
    clientPageViewmodel.firstNameController.text=clientPageViewmodel.client.value.elementAt(widget.id).firstName;
    clientPageViewmodel.emailController.text=clientPageViewmodel.client.value.elementAt(widget.id).email;
    clientPageViewmodel.lastNameController.text=clientPageViewmodel.client.value.elementAt(widget.id).lastname;
    clientPageViewmodel.addressController.text=clientPageViewmodel.client.value.elementAt(widget.id).address;
    clientPageViewmodel.phoneController.text=clientPageViewmodel.client.value.elementAt(widget.id).phoneNo;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,
        backgroundColor: homePageViewmodel.getBackColor(isDark),
        scrolledUnderElevation: 0,
        title: Text(
          viewDetailsViewmodel.appBarTitle,
          style: TextStyle(color:homePageViewmodel.getTextColor(isDark),
              fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize:Size.fromHeight(1) ,
        child: Container(margin: EdgeInsets.symmetric(
            horizontal: homePageViewmodel.getWidth(context, 20),
        ),
          color: isDark?Color(0xff333747):Color(0xff000000).withValues(alpha: 0.05),
          height: 1,
        ),
        ),
      



      ),backgroundColor: homePageViewmodel.getBackColor(isDark),
      body: SafeArea(top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: homePageViewmodel.getWidth(context, 20),
                right: homePageViewmodel.getWidth(context, 20),
                bottom: homePageViewmodel.getWidth(context, 20)
            ),
            child: Column(
              children: [
                TextFormFieldsMandatory(
                  labelText: viewDetailsViewmodel.firstNameLabel,
                  controller: clientPageViewmodel.firstNameController,
                  isMandatory: true,
                  enabeled: false,
                ),
                TextFormFieldsMandatory(
                  labelText: viewDetailsViewmodel.lastNameLabel,
                  controller: clientPageViewmodel.lastNameController,
                  isMandatory: true,
                  enabeled: false,
                ),
                TextFormFieldsMandatory(
                  labelText: viewDetailsViewmodel.emailAddress,
                  controller: clientPageViewmodel.emailController,
                  isMandatory: false,
                  enabeled: false,
                ),
                TextFormFieldsMandatory(
                  labelText: viewDetailsViewmodel.phoneNo,
                  controller: clientPageViewmodel.phoneController,
                  isMandatory: true,
                  enabeled: false,
                ),
                TextFormFieldsMandatory(
                  labelText: viewDetailsViewmodel.address,
                  controller: clientPageViewmodel.addressController,
                  isMandatory: false,
                  enabeled: false,
                ),
        
                SizedBox(height: 30),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
