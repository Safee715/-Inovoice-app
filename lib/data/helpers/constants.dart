import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:flutter/cupertino.dart';

class Constants {
  Constants({this.addButtonText, this.context});

  final String? addButtonText;
  final BuildContext ?context;

  //Labels
  String TotalAmountsText = LanguageManager.translate('TotalAmountsText');
  String TotalPaidText = LanguageManager.translate('TotalPaidText');
  String TotalDueText = LanguageManager.translate('TotalDueText');
  String TotalClientsText = LanguageManager.translate('TotalClientsText');
  String TotalItemsText = LanguageManager.translate('TotalItemsText');
  String TotalInvoiceText = LanguageManager.translate('TotalInvoiceText');
  String PaidInvoiceText = LanguageManager.translate('PaidInvoiceText');
  String DueInvoiceText = LanguageManager.translate('DueInvoiceText');

  final String homePageAppBarTitle =
  LanguageManager.translate('homePageAppBarTitle');
  final String profilePageAppBarTitle =
  LanguageManager.translate('profilePageAppBarTitle');
  final String templatePageAppBarTitle =
  LanguageManager.translate('templatePageAppBarTitle');
  final String recentInvoicesLabel =
  LanguageManager.translate('recentInvoicesLabel');
  final String viewAllLabel = LanguageManager.translate('viewAllLabel');
  final String draftsLabel = LanguageManager.translate('draftsLabel');
  final addClientAppBarTitle = LanguageManager.translate('addClientAppBarTitle');
  final clientAppBarTitle = LanguageManager.translate('clientAppBarTitle');
  final itemsAppBarTitle = LanguageManager.translate('itemsAppBarTitle');
  final firstNameLabel = LanguageManager.translate('firstNameLabel');
  final lastNameLabel = LanguageManager.translate('lastNameLabel');
  final firstName = LanguageManager.translate('firstName');
  final lastName = LanguageManager.translate('lastName');
  final emailAddress = LanguageManager.translate('emailAddress');
  final phoneNo = LanguageManager.translate('phoneNo');
  final phoneNoHint = LanguageManager.translate('phoneNoHint');
  final emailAddressHint = LanguageManager.translate('emailAddressHint');
  final addressHint =
  LanguageManager.translate('addressHint');
  final address = LanguageManager.translate('address');
  final saveClientButtonText =
  LanguageManager.translate('saveClientButtonText');
  final String snackBarText =
  LanguageManager.translate('snackBarText');
  final String noDataAvailableText =
  LanguageManager.translate('noDataAvailableText');
  final String noProfileAvailableText =
  LanguageManager.translate('noProfileAvailableText');
  final String incomeOverviewText =
  LanguageManager.translate('incomeOverviewText');
  final String OnboardingPage1Text1=
  LanguageManager.translate('OnboardingPage1Text1');
  final String OnboardingPage1Text2=
  LanguageManager.translate('OnboardingPage1Text2');
  final String OnboardingPage2Text1=
  LanguageManager.translate('OnboardingPage2Text1');
  final String OnboardingPage2Text2=
  LanguageManager.translate('OnboardingPage2Text2');
  final String Next=
  LanguageManager.translate('Next');
  final String GetStarted=
  LanguageManager.translate('GetStarted');
final String idLabel='Id';
final String nameLabel='Name';
final String emailLabel='Email';
final String idHint='Enter id';
final String nameHint='Enter name';
final String emailHint='Enter email';
final String addProfileAppbarTitle='Add Profile';
final String editProfileAppbarTitle='Edit Profile';

  final List<String> dropDownMenuTexts = [
    LanguageManager.translate('ThisWeek'),
    LanguageManager.translate('LastWeek'),
  ];

  List<String> popMenuText = [
    LanguageManager.translate('Edit'),
    LanguageManager.translate('ViewDetails'),
    LanguageManager.translate('Delete'),

  ];

  String getElevatedButtonText() =>
      addButtonText ?? '';

  LinearGradient gradient = const LinearGradient(
    colors: [
      Color(0xFF9CD9FF),
      Color(0xFF4082E3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );


}
