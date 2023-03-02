import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytask/utils/helper/date_checker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskText extends StatelessWidget {
  const TaskText({
    super.key,
    required this.title,
    required this.dueDate,
  });

  final String title;
  final String dueDate;

  @override
  Widget build(BuildContext context) {
    var appLoc = AppLocalizations.of(context)!;
    DateTime checkedTime= DateTime.parse(dueDate);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child:  Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),

        const SizedBox(
          height: 5,
        ),

        Align(
          alignment: Alignment.centerLeft,
          child: Text(
          checkedTime.isToday ? "Today"
              : checkedTime.isYesterday ? "Yesterday"
          : checkedTime.isTomorrow ? "Tomorrow"
              : DateFormat("dd MMM").format(checkedTime),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),

      ],
    );
  }
}


extension DateHelpers on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == day &&
        tomorrow.month == month &&
        tomorrow.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }
}
