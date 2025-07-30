import 'package:flutter/material.dart';
import 'package:invoiceapp/widgets/navbar_widget.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFE7EBF2),
        title: Text('Profile',
          style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,height: 500,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(backgroundColor: Colors.white,
              radius: 100,child: Icon(Icons.person_rounded,color: Colors.grey,
              size: 100,),)
        ],

        ),
      ),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.only(bottom: 30.0,left: 30,right: 30,),
        child: NavbarWidget(),
      ),

    );
  }
}
