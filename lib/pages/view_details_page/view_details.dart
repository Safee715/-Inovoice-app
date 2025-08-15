import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/pages/view_details_page/view_details_viewmodel.dart';
import 'package:DummyInvoice/widgets/text_form_fields_mandatory.dart';
import 'package:flutter/material.dart';


class ViewDetails extends StatefulWidget {
  const ViewDetails({super.key});

  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  bool _toggeled = false;
  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    ViewDetailsViewmodel viewDetailsViewmodel=ViewDetailsViewmodel();
    bool isDark=Theme.of(context).brightness==Brightness.dark;
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
                  hintText: viewDetailsViewmodel.firstName,
                  isMandatory: true,
                ),
                TextFormFieldsMandatory(
                  labelText: viewDetailsViewmodel.lastNameLabel,
                  hintText: viewDetailsViewmodel.lastName,
                  isMandatory: true,
                ),
                TextFormFieldsMandatory(
                  labelText: viewDetailsViewmodel.emailAddress,
                  hintText: viewDetailsViewmodel.emailAddressHint,
                  isMandatory: false,
                ),
                TextFormFieldsMandatory(
                  labelText: viewDetailsViewmodel.phoneNo,
                  hintText: viewDetailsViewmodel.phoneNoHint,
                  isMandatory: true,
                ),
                TextFormFieldsMandatory(
                  labelText: viewDetailsViewmodel.address,
                  hintText: viewDetailsViewmodel.addressHint,
                  isMandatory: false,
                ),
        
                SizedBox(height: 30),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      viewDetailsViewmodel.saveClientButtonText,
                      style: TextStyle(fontFamily: 'Biennale',fontSize: 14,
                        color: homePageViewmodel.getTextColor(isDark),
                      ),
                    ),
        
                    Switch(
                      value: _toggeled,
                      onChanged: (bool value) {
                        setState(() {
                          _toggeled = value;
                        });
                      },
        
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: homePageViewmodel.getWidth(context, 297),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                      colors: [Color(0xFF9CD9FF), Color(0xFF4082E3)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {},
                    child: Text(
                      viewDetailsViewmodel.addButtonText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
