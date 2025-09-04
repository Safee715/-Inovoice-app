import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/onboardingScreens/onboarding_page2.dart';
import 'package:DummyInvoice/widgets/custom_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage1 extends StatefulWidget {
  const OnboardingPage1({super.key});

  @override
  State<OnboardingPage1> createState() =>
      _OnboardingPage1State();
}

class _OnboardingPage1State
    extends State<OnboardingPage1> {
  @override
  Widget build(BuildContext context) {
    Constants constants=Constants();
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
          gradient:Theme.of(context).getOnboardingScreenBackGradient(),),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.getWidth(70),
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
                          bottom: 0,
                          child: ClipPath(
                            clipper:
                                ArcBottomCustomClipper(
                                  radius:
                                      safeRadius,

                                ),
                            child: Image.asset(
                              Assets.SurprisedMan,
                              width:
                                  safeRadius *
                                  2.5,
                              height:
                                  safeRadius *
                                  2.5,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          bottom: 20,
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 6,
                                ),
                            decoration: BoxDecoration(
                              color: Colors.white
                                  .withValues(
                                    alpha: 0.5,
                                  ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors
                                      .grey
                                      .withValues(
                                        alpha:
                                            0.1,
                                      ),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                  offset: Offset(
                                    5,
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
                                  .PaidInvoiceIcon1,
                              width: context
                                  .getWidth(119)
                                  .clamp(
                                    119,
                                    119,
                                  ),
                            ),
                          ),
                        ),Positioned(
                          right: 29,
                          bottom: 163,
                          child: Image.asset(
                            Assets.Intersect,
                            width: context.getWidth(28).clamp(28, 28),
                          ),
                        ),
                        Positioned(
                          right: 43,
                            bottom: 143,
                            child:SvgPicture.asset(Assets.Paid)

                        ),
                        Positioned(
                          right: 5,
                          bottom: 20,
                          child: SvgPicture.asset(
                            Assets.Trend,
                          ),
                        ), Positioned(
                          right: 0,
                          bottom: 140,
                          child: SvgPicture.asset(
                            Assets.Polygon,
                          ),
                        ),
                        Positioned(
                          right: -10,
                          bottom: 70,
                          child: SvgPicture.asset(
                            Assets.YellowDollor,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 80,
                          child: SvgPicture.asset(
                            Assets.YellowDollorObject,
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
                    constants.OnboardingPage1Text1,
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
                    constants.OnboardingPage1Text2,
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
                        backgroundColor: Color(0xff4082E3),
                      ),
                      SizedBox(width: context.getWidth(10)),
                      CircleAvatar(
                        radius: context.getWidth(8),
                        backgroundColor: Color(0xffD1D1D1),
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
                            return OnboardingPage2();
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
                      constants.Next,
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
