

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryScreen extends StatefulWidget{
  const HistoryScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HistoryScreenState();

}

class _HistoryScreenState  extends State<HistoryScreen>{

  void exportCsv() {
    List<List<String>> csvContent = [];
    List<String> csvHeaders = [];
    csvHeaders.add('Task');
    csvHeaders.add('Completion Date');
    csvHeaders.add('Time spent');
    csvContent.add(csvHeaders);
    // for (CompletedTask completedTask in pageStore.storage.completedTasks) {
    //   List<String> data = [
    //     completedTask.title,
    //     DateFormat.MMMMd().format(completedTask.completionDate),
    //     completedTask.timeSpent,
    //   ];
    //   csvContent.add(data);
    // }
    if (csvContent.isEmpty) {
      csvContent.add(['']);
    }
    // myCSV(csvHeaders, csvContent);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLoc.history,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.download),
              onPressed: () {
                // Download CSV

              }
          ),

        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      //Body
      // body: SafeArea(
      //   child: ListView.builder(
      //     itemBuilder:BuildContext(),
      //
      //   ),
      //
      // ),
    );
  }

}