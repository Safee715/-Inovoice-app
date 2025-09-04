import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/navigation_pages/view/main_navigation_page.dart';
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
    final size = MediaQuery.of(context).size;
    final circleRadius = size.width * 0.4;
    print('circleRadius$circleRadius');
    final safeRadius = circleRadius.clamp(
      80.0,
      144.0,
    );
    print('safeRadius$safeRadius');
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.only(
          bottom: 20,
          top: 20,
        ),
        decoration: BoxDecoration(
          gradient:Theme.of(context).getOnboardingScreenBackGradient(),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
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
                          left: 65,
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
                                  .getWidth(130)
                                  .clamp(
                                    130,
                                    130,
                                  ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 86,
                          bottom: 204,
                          child: Image.asset(
                            Assets.Intersect2,
                            width: context
                                .getWidth(32)
                                .clamp(32, 32),
                          ),
                        ),
                        Positioned(
                          bottom: 83,
                          right: 110,
                          child: SvgPicture.asset(
                            Assets.Paid,
                          ),
                        ),
                        Positioned(
                          bottom: 230,
                          right: 85,
                          child: SvgPicture.asset(
                            Assets
                                .invoiceIconOfOnboardingPage,
                          ),
                        ),
                        Positioned(
                          bottom: -15,
                          child: SvgPicture.asset(
                            Assets
                                .IconsOfSecondOnboardingPage,
                            width:context.getWidth(277).clamp(270, 277) ,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 20,left: 20,right: 20
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
                      fontSize: 24,
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
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child:Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: context.getWidth(8),
                        backgroundColor: Color(0xffD1D1D1),
                      ),
                      SizedBox(width: context.getWidth(10)),
                      CircleAvatar(
                        radius: context.getWidth(8),
                        backgroundColor: Color(0xff4082E3),
                      ),
                    ],
                  ) ,
                ),
                SizedBox(height: context.getWidth(20),),
                Container(
                  width: context.getWidth(360),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff9CD9FF),
                        Color(0xff4082E3),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainNavigationPage(
                              constant: constants,
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      overlayColor:
                          Colors.transparent,
                      shadowColor:
                          Colors.transparent,
                      backgroundColor:
                          Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadiusGeometry.circular(
                              context.getWidth(
                                10,
                              ),
                            ),
                      ),
                    ),
                    child: Text(
                      constants.GetStarted,
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontFamily: 'Satoshi',
                        fontSize: 22,letterSpacing: 1,
                        fontWeight:
                            FontWeight.w900,
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
