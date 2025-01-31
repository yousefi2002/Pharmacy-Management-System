import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatLocalTime(String? utcTime,{bool justMonth = false}) {
    if (utcTime == null || utcTime.isEmpty) return "";
    DateTime dateTime = DateTime.parse(utcTime).toLocal(); // Convert to local
    return justMonth ? DateFormat('yyyy-MM-dd').format(dateTime) : DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
}

Future<DateTime?> myDatePicker(BuildContext context){
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
    );
}