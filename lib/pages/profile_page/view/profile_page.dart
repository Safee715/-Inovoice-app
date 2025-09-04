import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.constants});

  final Constants? constants;

  @override
  State<ProfilePage> createState() =>
      _ProfilePageState();
}

class _ProfilePageState
    extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFE7EBF2),
        title: Text(
          widget
              .constants!
              .profilePageAppBarTitle,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 500,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: Icon(
                    Icons.person_rounded,
                    color: Colors.grey,
                    size: 50,
                  ),
                ),
              ),
              Text(
                LanguageManager.translate('noProfileAvailableText'),
                  style: TextStyle(
                  color: Theme.of(
                  context,
                  ).getHintTextColor(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
