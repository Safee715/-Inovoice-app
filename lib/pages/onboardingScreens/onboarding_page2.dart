import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage2 extends StatefulWidget {
  const OnboardingPage2({super.key});

  @override
  State<OnboardingPage2> createState() =>
      _OnboardingPage2State();
}

class _OnboardingPage2State
    extends State<OnboardingPage2> {
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();
    final circleRadius = context.getAdaptiveSizeLength(338/2);
    final safeRadius = circleRadius.clamp(
      80.0,
      147.0,
    );
    print('safeRadius$safeRadius');
    return  Container(
      width: double.infinity,
      height: double.infinity,
        child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(
                    context.getWidth(10),
                  ),
                  child: Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).getOnboardingCircleColor(),
                          radius: safeRadius,
                        ),
                        Positioned(
                          bottom: -5,
                          child: Image.asset(
                            Assets.SmilingMan,
                            width:
                                safeRadius * 2.6,
                            height:
                                safeRadius * 2.6,
                          ),
                        ),
                        Positioned(
                          left: 55,
                          bottom: 50,
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 6,
                                ),
                            decoration: BoxDecoration(
                              color: Colors.white
                                  .withValues(
                                    alpha: 0.4,
                                  ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors
                                      .grey
                                      .withValues(
                                        alpha:
                                            0.2,
                                      ),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                  offset: Offset(
                                    -5,
                                    0,
                                  ),
                                ),
                              ],
                              border: Border.all(
                                width: 0.51,
                                color:
                                    Colors.white,
                              ),
                              borderRadius:
                                  BorderRadiusGeometry.circular(
                                    17,
                                  ),
                            ),
                            child: SvgPicture.asset(
                              Assets
                                  .PaidInvoiceIcon2,
                                width: context
                                    .getAdaptiveSizeLength(135)

                            ),
                          ),
                        ),
                        Positioned(
                          right: 85,
                          bottom: 167,
                          child: Image.asset(
                            Assets.Intersect2,
                            width: context
                                .getAdaptiveSizeWidth(28)
                          ),
                        ),
                        Positioned(
                          bottom: 76,
                          right: 105,
                          child: SvgPicture.asset(
                            Assets.Paid,
                            width: context.getAdaptiveSizeWidth(37),
                          ),
                        ),
                        Positioned(
                          bottom: 185,
                          right: 80,
                          child: SvgPicture.asset(
                            Assets
                                .invoiceIconOfOnboardingPage,
                            width: context.getAdaptiveSizeWidth(29),
                          ),
                        ),
                        Positioned(
                          bottom: -15,
                          child: SvgPicture.asset(
                            Assets
                                .IconsOfSecondOnboardingPage,
                            width:context.getAdaptiveSizeWidth(277).clamp(270, 277) ,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    constants.OnboardingPage2Text1,
                    softWrap: true,
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w900,
                      color: Color(0xff4082E3),
                      fontSize: context.getTextSize(24),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 20,left: 20,right: 20
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    constants.OnboardingPage2Text2,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).getOnboardingTextColor(),
                      fontSize: context.getTextSize(18),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top:context.getAdaptiveSizeLength(67),
                      bottom: context.getAdaptiveSizeLength(100)),                  child:Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: context.getAdaptiveSizeWidth(6),
                        backgroundColor: Color(0xffD1D1D1),
                      ),
                      SizedBox(width:10),
                      CircleAvatar(
                        radius: context.getAdaptiveSizeWidth(6),
                        backgroundColor: Color(0xff4082E3),
                      ),
                    ],
                  ) ,
                ),
              ],
            ),
      );


  }
}
