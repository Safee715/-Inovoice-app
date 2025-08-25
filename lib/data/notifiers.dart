import 'package:flutter/material.dart';

ValueNotifier<int> selected_page_notifier =
    ValueNotifier(0);
ValueNotifier<int> previous_page = ValueNotifier(
  0,
);
final ValueNotifier<int>
selected_widget_notifier = ValueNotifier(0);

ValueNotifier<int> client_page_index =
    ValueNotifier(0);
