import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/onboardingScreens/elevatedbutton.dart';
import 'package:DummyInvoice/pages/onboardingScreens/viewmodel/onboarding_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() =>
      _OnboardingPageState();
}

class _OnboardingPageState
    extends State<OnboardingPage> {
  Constants constants=Constants();

  @override
  Widget build(BuildContext context) {
    final onboardingPageViewmodel=context.watch<OnboardingPageViewmodel>();
    Constants constants = Constants();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).getContainerColor(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          bottom: 20,
          top: 20,
        ),
        decoration: BoxDecoration(
          gradient: Theme.of(
            context,
          ).getOnboardingScreenBackGradient(),
        ),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
           Expanded(flex: 2,
             child: PageView.builder(
               onPageChanged: (value) => onboardingPageViewmodel.setCurrentPage(value),
               controller: onboardingPageViewmodel.pageController,
               itemCount: 2,
               itemBuilder: (context, index) {
                return Container(
                   child: onboardingPageViewmodel.onBoardingContent[index],
                );
             },
             ),
           ),
      NavigationButton(
        text: onboardingPageViewmodel.getCurrentPage()==0
            ?constants.Next
            :constants.GetStarted)
          ],
        ),
      ),
    );
  }
}
