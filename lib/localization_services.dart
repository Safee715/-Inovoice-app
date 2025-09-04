import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;

const String sheetUrl='https://docs.google.com/spreadsheets/d/e/2PACX-1vS0EJViTo2QF2OfVcQ0-g1BDIMHWfx0XXvjehB88nMFa5XdGb0NVXJJ_N9uQEcD18W9R96brxWktRro/pub?output=csv';


Future<void> main()async
{
final response= await http.get(Uri.parse(sheetUrl),);
if(response.statusCode!=200)
  {
    print('fetching failed');
    return;
  }
final decodedBody=utf8.decode(response.bodyBytes);
final rows=const  CsvToListConverter().convert(decodedBody,eol: '\n');
final headers=rows.first.map((e) => e.toString()).toList();

Map<String ,Map<String,String>> languages={};
  for(var header in headers.skip(1))
    {
    languages[header.trim()]={};

    }

  for(var row in rows.skip(1))
    {
      final  values=row.map((e) => e.toString()).toList();
      if(values.isEmpty)continue;
      final key=values[0].trim();
      for(int i=1;i<headers.length;i++)
        {
          final lang=headers[i].trim();
          languages[lang]?[key]=values[i].toString().trim();

        }





    }
print(languages['Urdu']);

languages.forEach((languageKey, value) {
final buffer=StringBuffer();
buffer.writeln("const Map<String,String> ${languageKey}Strings={ ");
value.forEach((stringKey, stringValue) {
  buffer.writeln("'$stringKey':'${stringValue
      .replaceAll("'", "\\'")}' ,");

},
);
buffer.writeln("};");
final outfile=File('D:/dummyinvoice/lib/data/languages/${languageKey}.dart');
outfile.createSync(recursive: true);
outfile.writeAsStringSync(buffer.toString(),encoding: utf8);
print('${languageKey}.dart file generated');

},
);
//
// LanguageManager.setLanguage('Urdu');
// print(LanguageManager.translate('TotalAmountsText'));

}