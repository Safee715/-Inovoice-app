import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:DummyInvoice/pages/home_page/widgets/bar_charts_widget.dart';
import 'package:DummyInvoice/pages/home_page/widgets/data_widget.dart';
import 'package:DummyInvoice/pages/home_page/widgets/pie_chart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:DummyInvoice/data/notifiers.dart';

class HomePageViewmodel {
  HomePageViewmodel({required this.context,
    required this.constant
  });

  final BuildContext context;
  final Constants constant;
  List<Widget>get widgets => [
    DataWidget(constants: constant,),
    BarChartsWidget(constants: constant),
    PieChartWidget(constant: constant,),
  ];

  //Draft Invoices data
  final draftName = LanguageManager.translate('draftName');
  final draftStatus = LanguageManager.translate('draftStatus');
  final draftReceiptId = LanguageManager.translate('draftReceiptId');
  final draftIssueDate = LanguageManager.translate('draftIssueDate');
  final draftDueDate = LanguageManager.translate('draftDueDate');
  final draftTotalAmount = LanguageManager.translate('draftTotalAmount');
  final draftPaidAmount = LanguageManager.translate('draftPaidAmount');
  final draftDueAmount = LanguageManager.translate('draftDueAmount');

  // RecentInvoices data
  final recentInvoiceName = LanguageManager.translate('recentInvoiceName');
  final recentInvoiceStatus = LanguageManager.translate('recentInvoiceStatus');
  final recentInvoiceReceiptId = LanguageManager.translate('recentInvoiceReceiptId');
  final recentInvoiceIssueDate = LanguageManager.translate('recentInvoiceIssueDate');
  final recentInvoiceDueDate = LanguageManager.translate('recentInvoiceDueDate');
  final recentInvoiceTotalAmount = LanguageManager.translate('recentInvoiceTotalAmount');
  final recentInvoicePaidAmount = LanguageManager.translate('recentInvoicePaidAmount');
  final recentInvoiceDueAmount = LanguageManager.translate('recentInvoiceDueAmount');

  //address

  //functions

  void setHomePageDetails() {
    selected_widget_notifier.value = 0;
  }

  void setBarChartDetails() {
    selected_widget_notifier.value = 1;
  }

  void setPieChartDetails() {
    selected_widget_notifier.value = 2;
  }

  double getWidth(double figmaWidth) {
    double width =
        (figmaWidth / 412) *
            (MediaQuery.of(context).size.width);
    return width;
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
    LanguageManager.translate('Jan'),
    LanguageManager.translate('Feb'),
    LanguageManager.translate('Mar'),
    LanguageManager.translate('Apr'),
    LanguageManager.translate('May'),
    LanguageManager.translate('Jun'),
    LanguageManager.translate('Jul'),
    LanguageManager.translate('Aug'),
    LanguageManager.translate('Sep'),
    LanguageManager.translate('Oct'),
    LanguageManager.translate('Nov'),
    LanguageManager.translate('Dec'),
  ];

  double getMaxValue(List<double> data) {
    double maxValue = data.reduce(
      (a, b) => a > b ? a : b,
    );
    return maxValue;
  }

  double barGap() {
    return getWidth(7);
  }

  double getBarWidth(
    List<double> data,
    double width,
  ) {
    double gap = barGap();
    int totalBars = data.length;
    double totalGap = totalBars * gap;
    double remainingWidth =
        width - totalGap - gap;
    double barWidth = (remainingWidth / totalBars);
    return barWidth;
  }

  void drawBars(
    List<double> data,
    Canvas canvas,
    double height,
    double width,
  ) {
    final paint = Paint()
      ..color = Color(0xffC7D7FE)
      ..style = PaintingStyle.fill;
    double barWidth = getBarWidth(data, width);
    double gap = barGap();
    for (int i = 0; i < data.length; i++) {
      double barHeight =
          (data[i] / getMaxValue(data)) * height;
      double starting = context.getWidth(37);

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

  void drawPolyLine(
    List<double> data,
    Canvas canvas,
    double height,
    double width,
  ) {
    double barWidth = getBarWidth(data, width);
    double gap = barGap();

    final paint = Paint()
      ..strokeWidth = 3
      ..color = Color(
        0xff4F60F6,
      ).withValues(alpha: 0.7)
      ..style = PaintingStyle.stroke;
    final path = Path();

    for (int i = 0; i < data.length; i++) {
      double starting = context.getWidth(37);
      double x = starting + i * (gap + barWidth);
      double y =
          height -
          (data[i] / getMaxValue(data)) * height;
      i == 0
          ? path.moveTo(x, y)
          : path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  void drawLabels1(
    List<double> data,
    Canvas canvas,
    double height,
    double width,
  ) {
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
        Offset(
          20,
          height - (yLabel / maxValue) * height,
        ),
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

  void drawLabels2(
    List<double> data,
    Canvas canvas,
    double height,
    double width,
  ) {
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

  void drawXLabels(
    List<double> data,
    Canvas canvas,
    double width,
    double height,
  ) {
    double gap = barGap();
    double barWidth = getBarWidth(data, width);
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
      double starting = context.getWidth(37);
      textPainter.paint(
        canvas,
        Offset(
          starting + i * (gap + barWidth),
          height,
        ),
      );
    }
  }

  void horizontalGrid(
    Canvas canvas,
    double width,
    double height,
  ) {
    final paint = Paint()
      ..color = Color(0xffEBECF2)
      ..strokeWidth = 1;
    int yLines = 4;
    for (int i = 1; i <= yLines; i++) {
      double y = height - (i / yLines * height);
      canvas.drawLine(
        Offset(0, y + 20),
        Offset(width, y + 20),
        paint,
      );
    }
  }

  void verticalGrid(
    Canvas canvas,
    double width,
    double height,
  ) {
    final paint = Paint()
      ..color = Color(0xffEBECF2)
      ..strokeWidth = 1;
    int xLines = 7;
    for (int i = 7; i > 1; i--) {
      double x = width - (i / xLines * width);
      canvas.drawLine(
        Offset(x + 40, -35),
        Offset(x + 40, height + 20),
        paint,
      );
    }
  }

  //Pie Chart LogicData
  Map<String, double> dataMap1 = {
    LanguageManager.translate('Paid'): 10508048.00,
    LanguageManager.translate('Due'): 5005876.00,
  };

  Map<String, double> dataMap2 = {
    LanguageManager.translate('Paid'): 10508048.00,
    LanguageManager.translate('Due'): 505876.00,
  };
  final chartRadius = 276.59;

  List<Color> colorsList = [
    Color(0xffFFBD2E),
    Color(0xffFE9696),
  ];

  double getPieChartMaxValue(
    Map<String, double> dataMap,
  ) {
    double maxValue = dataMap.values.reduce((
      value,
      element,
    ) {
      return value > element ? value : element;
    });
    return maxValue;
  }
}
