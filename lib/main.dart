import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/widget_tree_page.dart';

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
      home: DummyInvoice() ,

    );
  }
}

class DummyInvoice extends StatefulWidget {
  const DummyInvoice({super.key});

  @override
  State<DummyInvoice> createState() => _DummyInvoiceState();
}

class _DummyInvoiceState extends State<DummyInvoice> {
  @override
  Widget build(BuildContext context) {
    return WidgetTreePage();
  }
}
