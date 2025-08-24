import 'package:DummyInvoice/pages/client_page/client_page_viewmodel.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/pages/view_details_page/view_details_viewmodel.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewDetailsPage extends StatefulWidget {
  const ViewDetailsPage({super.key, required this.id});
  final id;
  @override
  State<ViewDetailsPage> createState() => _ViewDetailsPageState();
}

class _ViewDetailsPageState extends State<ViewDetailsPage> {
  late ViewDetailsViewmodel viewDetailsViewmodel;
  late HomePageViewmodel homePageViewmodel;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homePageViewmodel = HomePageViewmodel(
      screenWidth: MediaQuery.of(context).size.width,
      screenHeight: MediaQuery.of(context).size.height,
    );
  }
  @override
  void initState() {
    super.initState();
    viewDetailsViewmodel = ViewDetailsViewmodel();
    final clientPageViewmodel = context.read<ClientPageViewmodel>();
    viewDetailsViewmodel.getControllerText(clientPageViewmodel, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: homePageViewmodel.getBackColor(isDark),
        scrolledUnderElevation: 0,
        title: Text(
          viewDetailsViewmodel.appBarTitle,
          style: TextStyle(
            color: homePageViewmodel.getTextColor(isDark),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: homePageViewmodel.getWidth(20),
            ),
            color: isDark
                ? Color(0xff333747)
                : Color(0xff000000).withValues(alpha: 0.05),
            height: 1,
          ),
        ),
      ),
      backgroundColor: homePageViewmodel.getBackColor(isDark),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: homePageViewmodel.getWidth( 20),
              right: homePageViewmodel.getWidth( 20),
              bottom: homePageViewmodel.getWidth( 20),
            ),
            child: Column(
              children: [
                CustomTextFields(
                  labelText: viewDetailsViewmodel.firstNameLabel,
                  controller: viewDetailsViewmodel.firstNameController,
                  isMandatory: true,
                  enabled: false,
                ),
                CustomTextFields(
                  labelText: viewDetailsViewmodel.lastNameLabel,
                  controller: viewDetailsViewmodel.lastNameController,
                  isMandatory: true,
                  enabled: false,
                ),
                CustomTextFields(
                  labelText: viewDetailsViewmodel.emailAddress,
                  controller: viewDetailsViewmodel.emailController,
                  isMandatory: false,
                  enabled: false,
                ),
                CustomTextFields(
                  labelText: viewDetailsViewmodel.phoneNo,
                  controller: viewDetailsViewmodel.phoneController,
                  isMandatory: true,
                  enabled: false,
                ),
                CustomTextFields(
                  labelText: viewDetailsViewmodel.address,
                  controller: viewDetailsViewmodel.addressController,
                  isMandatory: false,
                  enabled: false,
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
