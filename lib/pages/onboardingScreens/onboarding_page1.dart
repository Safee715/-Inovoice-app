import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
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
    Constants constants = Constants();
    final circleRadius = context.getAdaptiveSizeLength(338/2);
    print('circleRadius$circleRadius');
    final safeRadius = circleRadius.clamp(
      80.0,
      147.0,
    );
    print('safeRadius$safeRadius');
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return   Container(
      width: double.infinity,
      height: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            bottom: 20,
            top: 20,
          ),
          decoration: BoxDecoration(
            gradient: Theme.of(
              context,
            ).getOnboardingScreenBackGradient(),
          ),
          child: SingleChildScrollView(
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
                          backgroundColor: Theme.of(
                            context,
                          ).getOnboardingCircleColor(),
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
                                            0.2,
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
                                  .getAdaptiveSizeLength(119)

                            ),
                          ),
                        ),
                        Positioned(
                          right: 26,
                          bottom: 123,
                          child: Image.asset(
                            Assets.Intersect,
                            width: context
                                .getAdaptiveSizeLength(25)

                          ),
                        ),
                        Positioned(
                          bottom: 110 ,
                          right: 35,
                          child: SvgPicture.asset(
                            Assets.Paid,
                            width: context.getAdaptiveSizeWidth(37),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 12,
                          child: SvgPicture.asset(
                            Assets.Trend,
                            width: context.getAdaptiveSizeWidth(149),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          bottom: 115,
                          child: SvgPicture.asset(
                            Assets.Polygon,
                            width: context.getAdaptiveSizeWidth(14),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 60,
                          child: SvgPicture.asset(
                            Assets.YellowDollor,
                            width: context.getAdaptiveSizeWidth(62),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          bottom: 67,
                          child: SvgPicture.asset(
                            Assets
                                .YellowDollorObject,
                            width: context.getAdaptiveSizeWidth(49),
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
                    constants
                        .OnboardingPage1Text1,
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
                    top: context.getWidth(17),
                    left: 10,
                    right: 10,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    constants
                        .OnboardingPage1Text2,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w500,
                      color: Theme.of(
                        context,
                      ).getOnboardingTextColor(),
                      fontSize: context.getTextSize(18),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                  top:context.getAdaptiveSizeLength(67),
                  bottom: context.getAdaptiveSizeLength(100)),
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: context.getAdaptiveSizeWidth(6),
                        backgroundColor: Color(
                          0xff4082E3,
                        ),
                      ),
                      CircleAvatar(
                        radius: context.getAdaptiveSizeWidth(6),
                        backgroundColor: Color(
                          0xffD1D1D1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );

  }
}
