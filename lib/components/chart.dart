import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalValue = 0.0;
      var forIndex = 0;
      for (; forIndex < recentTransactions.length; forIndex++) {
        bool sameDay = recentTransactions[forIndex].date.day == weekDay.day;
        bool sameMonth =
            recentTransactions[forIndex].date.month == weekDay.month;
        bool sameYear = recentTransactions[forIndex].date.year == weekDay.year;

        if (sameYear && sameMonth && sameDay) {
          totalValue += recentTransactions[forIndex].productValue;
        }
      }

      return {'day': DateFormat.E().format(weekDay)[0], 'value': totalValue};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
