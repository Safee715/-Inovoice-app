import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/menu_widget.dart';

class ClientsDetails extends StatefulWidget {
  const ClientsDetails({super.key,
   required  this.name,required this.email});

  final String name;
  final String email;
  @override
  State<ClientsDetails> createState() => _ClientsDetailsState();
}

class _ClientsDetailsState extends State<ClientsDetails> {





  String getInitials(String name)
  {List<String> parts=name.trim().split(" ");
  String initials='';
  if(parts.length==1)
  {
    initials= parts[0][0].toUpperCase();

  }
  else
  {
    for (int i=0;i<parts.length;i++)
    {
      initials+= parts[i][0].toUpperCase();
    }
  }
  return initials;
  }
  HomePageViewmodel homePageViewmodel=HomePageViewmodel();

  @override
  Widget build(BuildContext context) {
    return ListTile(contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 8.0),
minLeadingWidth: 30,horizontalTitleGap: 5,
      dense: true,
      tileColor: Color(0xffffffff),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10),
      ),
      leading:CircleAvatar(maxRadius: 30,
        backgroundColor: Color(0xff4F94FB).withValues(alpha: 0.2),
        child: Text(getInitials(widget.name),
    style: TextStyle(
    color: Color(0xff4F94FB),
    fontWeight: FontWeight.bold,fontSize: 12),
      ),
      ),
      title: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name,style: TextStyle(
          color: Color(0xff303744),
          fontWeight: FontWeight.w400,fontSize: 14),),
          Text(widget.email, style: TextStyle(color: Color(0xffBEC0CC),fontSize: 12
          ),
          ),
        ],
      ),
      trailing: MenuWidget(),


    );
  }
}
