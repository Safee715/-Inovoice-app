import 'package:flutter/material.dart';
import 'package:invoiceapp/pages/home_page.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(
        scaffoldBackgroundColor:  Color(0xFFF0F3F7)),
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
    return HomePage();
  }
}
