import 'package:DummyInvoice/pages/onboardingScreens/onboarding_page1.dart';
import 'package:DummyInvoice/pages/onboardingScreens/onboarding_page2.dart';
import 'package:flutter/cupertino.dart';

class OnboardingPageViewmodel extends ChangeNotifier{
int currentPage=0;
List<Widget> onBoardingContent=
    [const OnboardingPage1(),const OnboardingPage2()];
final PageController pageController=PageController();
int getCurrentPage()
{
  return currentPage;
}
void setCurrentPage(int value)
{
   currentPage=value;
   notifyListeners();

}
void nextPage()
{
  if(currentPage==0)
    {
pageController.nextPage(duration: const Duration(milliseconds: 300), curve:Curves.easeInOut);
    }
}
void previous()
{
  if(currentPage==1)
  {
    pageController.previousPage(duration: const Duration(milliseconds: 300), curve:Curves.easeInOut);
  }

}





}