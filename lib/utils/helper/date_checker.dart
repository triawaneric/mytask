import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DateFormatter {

  DateFormatter(this.localizations, this.date);


  AppLocalizations localizations;
  String date;


  String getVerboseDateTimeRepresentation(DateTime dateTime) {

    DateTime now = DateTime.now();

    DateTime justNow = now.subtract(const Duration(minutes: 1));

    DateTime localDateTime = dateTime.toLocal();


    if (!localDateTime.difference(justNow).isNegative) {

      return localizations.dateFormatter_today;

    }


    String roughTimeString = DateFormat('jm').format(dateTime);


    if (localDateTime.day == now.day && localDateTime.month == now.month && localDateTime.year == now.year) {

      return roughTimeString;

    }


    DateTime yesterday = now.subtract(Duration(days: 1));


    if (localDateTime.day == yesterday.day && localDateTime.month == now.month && localDateTime.year == now.year) {

      return localizations.dateFormatter_yesterday;

    }


    if (now.difference(localDateTime).inDays < 4) {

      String weekday = DateFormat('EEEE', localizations.localeName).format(localDateTime);


      return '$weekday, $roughTimeString';

    }


    return '${DateFormat('yMd', localizations.localeName).format(dateTime)}, $roughTimeString';

  }

}