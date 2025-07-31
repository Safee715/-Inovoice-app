import 'package:flutter/material.dart';
import 'package:invoiceapp/pages/widget_tree_page.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(
        scaffoldBackgroundColor:  Color(0xffF0F3F7),
      fontFamily: 'Biennale',
    ),
      debugShowCheckedModeBanner: false,
      home: InvoiceApp() ,

    );
  }
}

class InvoiceApp extends StatefulWidget {
  const InvoiceApp({super.key});

  @override
  State<InvoiceApp> createState() => _InvoiceAppState();
}

class _InvoiceAppState extends State<InvoiceApp> {
  @override
  Widget build(BuildContext context) {
    return WidgetTreePage();
  }
}
