import 'package:flutter/material.dart';

class BarChartViewmodel {


  BarChartViewmodel({required this.context});
  final context;
List<double> data=[370000,375000,350000,250000,300000,200000,330000,350000,320000,280000,380000,400000];
List <String> months=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];

double getMaxValue(List<double> data) {
  double maxValue = data.reduce((a, b) => a > b ? a : b);
  return maxValue;
}
  double barGap()
  {
    double width = (7 / 412) * MediaQuery
        .of(context)
        .size
        .width;
    return width;
  }


double getBarWidth(double width)
{
  double gap=barGap();
  int totalBars=data.length;
  double totalGap=totalBars*gap;
  double remainingWidth=width-totalGap-gap;
  double barWidth=remainingWidth/totalBars;
  return barWidth;

}
void drawBars(Canvas canvas,double height,double width)
{
    final paint=Paint()
    ..color=Color(0xffC7D7FE)
    ..style=PaintingStyle.fill;

double barWidth=getBarWidth(width);
double gap=barGap();
for(int i=0;i<data.length;i++)
  {
    double barHeight=(data[i]/getMaxValue(data))*height;
    Rect bar=Rect.fromLTWH(gap+i*(gap+barWidth),
        height-barHeight,barWidth, barHeight);
    final rRect=RRect.fromRectAndCorners(bar,topLeft: Radius.circular(3),topRight: Radius.circular(3),);
    canvas.drawRRect(rRect, paint);

  }
}
void drawLabels1(Canvas canvas,double height,double width)
{
  double ySteps=4;
  double maxValue=getMaxValue(data);
  double yFraction=maxValue/ySteps;

for (int i=1;i<=ySteps;i++) {
  final  yLabel = yFraction * i;
 String digit=yLabel.toStringAsFixed(0)[0];
  final textPainter = TextPainter(

      text: TextSpan(text: digit,
        style: TextStyle(fontSize: 12,fontFamily: 'Biennale',color: Color(0xff8D8F99),),

      ),
      textDirection: TextDirection.ltr
  );
  textPainter.layout();
  textPainter.paint(canvas, Offset(width-textPainter.width,height-(yLabel/maxValue) * height)
  );
}

}
String formattedNumber(double num)
{
  if(num>=1000)
    {
     return '${(num/1000).toStringAsFixed(0)}K';

    }
  else
    {
return num.toString();
    }
}


  void drawLabels2(Canvas canvas,double height,double width)
  {

    double ySteps=4;
    double maxValue=getMaxValue(data);
    double yFraction=maxValue/ySteps;

    for (int i=1;i<=ySteps;i++) {
      final yLabel = (yFraction * i);
      final number=formattedNumber(yLabel);
      final textPainter = TextPainter(
          text: TextSpan(text: number,
            style: TextStyle(fontSize: 12,fontFamily: 'Biennale',color: Color(0xff8D8F99),),

          ),
          textDirection: TextDirection.ltr
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(width-textPainter.width,height-(yLabel/maxValue) * height)
      );
      
      
    }

  }


void drawXLabels(Canvas canvas ,double width)
{
  double gap=barGap();
double barWidth=getBarWidth(width);
  for (int i=1;i<=months.length;i+=2) {
    final textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text:TextSpan(
          text: months[i],
            style: TextStyle(fontSize: 12,fontFamily: 'Biennale',color: Color(0xff8D8F99),
            ),
        ),
    );
textPainter.layout();
i==1?gap=0:gap=barGap();
textPainter.paint(canvas, Offset(gap+i*(gap+barWidth), 0));

  }
}

void drawGridLines(Canvas canvas,double width,double height)
{

final paint=Paint()
    ..color=Color(0xffEBECF2)
..strokeWidth=1;
int yLines=4;
for(int i=0;i<=yLines;i++)
  {
    double y=height-(i/yLines*height);
    canvas.drawLine(Offset(0,y ), Offset(width, y), paint);
    
    
  }
}


}