import 'package:flutter/cupertino.dart';
import 'package:DummyInvoice/data/notifiers.dart';


class HomePageViewmodel {
HomePageViewmodel ({ this.screenWidth, this.screenHeight});
  //variables
  final double ?screenWidth;
  final double ?screenHeight;
  final String appBar = 'Invoice Maker';
  final String recentInvoices = 'Recent Invoice';
  final String viewAll = 'View All';
  final String drafts = 'Drafts';

  //Draft Invoices data
final draftName='Peter Paul';
final draftStatus='No status';
final draftReceiptId='IN-01';
final draftIssueDate='00-00-2024';
final draftDueDate='00-00-2024';
final draftTotalAmount='34579';
final draftPaidAmount ='00.00';
final draftDueAmount='00.00';
// RecentInvoices data
  final recentInvoiceName='Jhon James';
  final recentInvoiceStatus='Unpaid';
  final recentInvoiceReceiptId='IN-01';
  final recentInvoiceIssueDate='05-15-2024';
  final recentInvoiceDueDate='13-12-2024';
  final recentInvoiceTotalAmount='34579';
  final recentInvoicePaidAmount ='00.00';
  final recentInvoiceDueAmount='457.45';




//address

  final String menuButtonAddress = 'assets/images/icons/menu-left-alt.svg';
  final String homePageDetailsAddress = 'assets/images/icons/homepage details.svg';
  final String BarChartAddress = 'assets/images/icons/chart-bar.svg';
  final String PieChartAddress = 'assets/images/icons/pie chart.svg';



  //functions

String getNotificationIcon(bool isDark)
{
  return isDark?'assets/images/icons/dark_bell-notification.svg':'assets/images/icons/bell-notification.svg';
}
  void setHomePageDetails() {
    selected_widget_notifier.value = 0;
  }

  void setBarChartDetails() {
    selected_widget_notifier.value = 1;
  }

  void setPieChartDetails() {
    selected_widget_notifier.value = 2;
  }


  Color  getBackColor(bool isDark)
  {
     Color color=isDark?Color(0xff090A0E):Color(0xffF0F3F7);
     return color;
  }
  Color  getTextColor(bool isDark)
  {
    return isDark?Color(0xffFFFFFF):Color(0xff303744);

  }
  Color  getContainerColor(bool isDark)
  {
    return isDark?Color(0xff0D0F14):Color(0xffFFFFFF);

  }
  Color  getTextFormFieldColor(bool isDark)
  {
    return isDark?Color(0xff171921):Color(0xFFD8DAE5);

  }

  Color  getBottomContainerColor(bool isDark)
  {
    return isDark?Color(0xff333747):Color(0xffFFFFFF);

  }
  Color  getNavbarColor(bool isDark)
  {
    return isDark?Color(0xff111319):Color(0xffFFFFFF);

  }
  Color  getNavbarIconColor(bool isDark)
  {
    return isDark?Color(0xff353A52):Color(0xff8D8F99);

  }
  Color  getHomePageIconColor(bool isDark)
  {
    return isDark?Color(0xff353A52):Color(0xffD6DAE0);

  }
  Color  getHintTextColor(bool isDark)
  {
    return isDark?Color(0xff353A4d):Color(0xffBEC0CC);

  }
String getIconAddress(bool isDark,String Dark,String Light)
{
  return isDark?Dark:Light;
}
//Bar chart data




  List<double> data1 = [
    370000,
    375000,
    350000,
    250000,
    300000,
    200000,
    330000,
    350000,
    320000,
    280000,
    380000,
    400000,
  ];
  List<double> data2 = [
    370070,
    375000,
    350000,
    400000,
    300000,
    200000,
    330000,
    350000,
    320000,
    580000,
    780000,
    400000,
  ];
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  double getMaxValue(List<double> data) {
    double maxValue = data.reduce((a, b) => a > b ? a : b);
    return maxValue;
  }

  double barGap() {
    double width = (7 / 412) * (screenWidth??0);
    return width;
  }

  double getBarWidth(List<double> data,double width) {
    double gap = barGap();
    int totalBars = data.length;
    double totalGap = totalBars * gap;
    double remainingWidth = width - totalGap - gap;
    double barWidth = remainingWidth / totalBars;
    return barWidth;
  }

  void drawBars(List<double> data,Canvas canvas, double height, double width) {
    final paint = Paint()
      ..color = Color(0xffC7D7FE)
      ..style = PaintingStyle.fill;
    double barWidth = getBarWidth( data,width);
    double gap = barGap();
    for (int i = 0; i < data.length; i++) {
      double barHeight = (data[i] / getMaxValue(data)) * height;
      double starting = getWidth(37);

      Rect bar = Rect.fromLTWH(
        starting + i * (gap + barWidth),
        height - barHeight,
        barWidth,
        barHeight,
      );
      final rRect = RRect.fromRectAndCorners(
        bar,
        topLeft: Radius.circular(3),
        topRight: Radius.circular(3),
      );
      canvas.drawRRect(rRect, paint);
    }
  }
  void drawPolyLine(List<double> data,Canvas canvas,double height, double width)
  {double barWidth=getBarWidth(data,width);
  double gap=barGap();

  final paint=Paint()
    ..strokeWidth=3
    ..color=Color(0xff4F60F6).withValues(alpha: 0.7)
    ..style=PaintingStyle.stroke;
  final path=Path();



  for (int i=0;i<data.length;i++)
  {
    double starting=getWidth(37);
    double x=starting+i*(gap+barWidth);
    double y=height-(data[i]/getMaxValue(data))*height;
    i==0?path.moveTo(x, y):
    path.lineTo(x, y);

  }

  canvas.drawPath(path, paint);
  }


  void drawLabels1(List<double> data,Canvas canvas, double height, double width) {
    double ySteps = 4;

    double maxValue = getMaxValue(data);
    double yFraction = maxValue / ySteps;

    for (int i = 1; i <= ySteps; i++) {
      final yLabel = yFraction * i;
      String digit = yLabel.toStringAsFixed(0)[0];
      final textPainter = TextPainter(
        text: TextSpan(
          text: digit,
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Biennale',
            color: Color(0xff8D8F99),
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(20, height - (yLabel / maxValue) * height),
      );
    }
  }

  String formattedNumber(double num) {
    if (num >= 1000) {
      return '${(num / 1000).toStringAsFixed(0)}K';
    } else {
      return num.toString();
    }
  }

  void drawLabels2(List<double> data,Canvas canvas, double height, double width) {
    double ySteps = 4;

    double maxValue = getMaxValue(data);
    double yFraction = maxValue / ySteps;

    for (int i = 1; i <= ySteps; i++) {
      final yLabel = (yFraction * i);
      final number = formattedNumber(yLabel);
      final textPainter = TextPainter(
        text: TextSpan(
          text: number,
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Biennale',
            color: Color(0xff8D8F99),
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          width - textPainter.width,
          height - (yLabel / maxValue) * height,
        ),
      );
    }
  }

  void drawXLabels(List<double> data,Canvas canvas, double width, double height) {
    double gap = barGap();
    double barWidth = getBarWidth(data,width);
    for (int i = 1; i <= months.length; i += 2) {
      final textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: months[i],
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Biennale',
            color: Color(0xff8D8F99),
          ),
        ),
      );
      textPainter.layout();
      double starting=getWidth(20);
      textPainter.paint(canvas, Offset(starting + i * (gap + barWidth), height));
    }
  }

  void horizontalGrid(Canvas canvas, double width, double height) {
    final paint = Paint()
      ..color = Color(0xffEBECF2)
      ..strokeWidth = 1;
    int yLines = 4;
    for (int i = 1; i <= yLines; i++) {
      double y = height - (i / yLines * height);
      canvas.drawLine(Offset(0, y+20), Offset(width, y+20), paint);
    }

  }
  void verticalGrid(Canvas canvas, double width, double height) {
    final paint = Paint()
      ..color = Color(0xffEBECF2)
      ..strokeWidth = 1;
    int xLines = 7;
    for (int i = 7; i > 1; i--) {
      double x = width - (i / xLines * width);
      canvas.drawLine(Offset(x+40, -35), Offset(x+40, height+20), paint);
    }

  }
  double getHeight(double figmaHeight) {
    double height = (figmaHeight / 1046) * (screenHeight??0);
    return height;
  }

  double getWidth(double figmaWidth) {
    double width = (figmaWidth / 412) * (screenWidth??0);
    return width;
  }
  //Pie Chart LogicData
  Map<String, double> dataMap1 = {
    'Paid': 10508048.00,
    'Due': 5005876.00,
  };

  Map<String, double> dataMap2 = {'Paid': 10508048.00, 'Due': 505876.00};
  final chartRadius = 276.59;

  List<Color> colorsList = [Color(0xffFFBD2E), Color(0xffFE9696)];

  double getPieChartMaxValue(Map<String, double> dataMap) {
    double maxValue = dataMap.values.reduce((value, element) {
      return value > element ? value : element;
    });
    return maxValue;
  }


}


