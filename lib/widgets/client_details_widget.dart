import 'package:flutter/material.dart';
import 'package:invoiceapp/widgets/menu_widget.dart';

class ClientDetailsWidget extends StatefulWidget {
  const ClientDetailsWidget({super.key,required this.name,required this.email});

  final String name;
  final String email;



  @override
  State<ClientDetailsWidget> createState() => _ClientDetailsWidgetState();
}

class _ClientDetailsWidgetState extends State<ClientDetailsWidget> {

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(maxRadius: 40,child: Text(getInitials(widget.name),
                style: TextStyle(
                    color: Color(0xff4F94FB),
                    fontWeight: FontWeight.w700,fontSize: 12),
              ),
                backgroundColor:Color(0xff4F94FB).withValues(alpha: 0.2),),
              SizedBox(width: 15,),
              Text(widget.name,style: TextStyle(
                  color: Color(0xff4F94FB),
                  fontWeight: FontWeight.w400,fontSize: 14),),
              Spacer(),
              MenuWidget(),

            ],
          ),
          Container(padding: EdgeInsets.only(left: 50),
              child: Text(widget.email,style: TextStyle(color: Colors.grey[600]),),
          ),
        ],
      ),
    );
  }
}
