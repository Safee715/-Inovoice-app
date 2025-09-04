import 'package:DummyInvoice/data/languages/Chinese.dart';
import 'package:DummyInvoice/data/languages/English.dart';
import 'package:DummyInvoice/data/languages/French.dart';
import 'package:DummyInvoice/data/languages/Spanish.dart';
import 'package:DummyInvoice/data/languages/Turkish.dart';
import 'package:DummyInvoice/data/languages/Urdu.dart';

class LanguageManager {



 static Map<String,Map<String,String>> languages={
    'en':EnglishStrings,
    'ur':UrduStrings,
    'fr':FrenchStrings,
    'es':SpanishStrings,
    'tr':TurkishStrings,
    'zh':ChineseStrings
  };
static String currentLanguage='en';

static void init(String langCode)
{
  if(languages.containsKey(langCode))
    {
      currentLanguage=langCode;
    }
}

static String translate(String key)
{
  return languages[currentLanguage]?[key]??key;

}


}
