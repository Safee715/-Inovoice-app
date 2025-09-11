import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/navigation_pages/view/main_navigation_page.dart';
import 'package:DummyInvoice/pages/onboardingScreens/viewmodel/onboarding_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationButton extends StatefulWidget {
  const NavigationButton({super.key,required this.text});
final String text;
  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  Constants constants=Constants();
  @override
  Widget build(BuildContext context) {
    final onboardingPageViewmodel=context.watch<OnboardingPageViewmodel>();
    return
      Container(
        width: context.getWidth(360),
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(10),
          gradient: const LinearGradient(
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
            if(onboardingPageViewmodel.getCurrentPage()==0)
              {
                onboardingPageViewmodel.pageController.nextPage(
                    duration: const Duration(
                    milliseconds: 300),
                    curve: Curves.easeInOut);

              }
            else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MainNavigationPage(constant: constants);
                  },
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            padding:
            EdgeInsets.symmetric(
              vertical: context.getAdaptiveSizeLength(10),
            ),
            overlayColor:
            Colors.transparent,
            shadowColor:
            Colors.transparent,
            backgroundColor:
            Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadiusGeometry.circular(
                  context.getWidth(10)
              ),
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: const Color(0xffffffff),
              fontFamily: 'Satoshi',
              fontSize: context.getAdaptiveSizeLength(22),
              letterSpacing: 1,
              fontWeight:
              FontWeight.bold,
            ),
          ),
        ),
      );
  }
}
