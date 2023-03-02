
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermServiceScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TermServiceScreenState();

}

class _TermServiceScreenState extends State<TermServiceScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLoc.term_service,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),

        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [


              //Content

              Container(
                alignment: Alignment.center,
                child: Html(data:appLoc.content_term_service)

              ),

            ],
          ),
        ),
      ),
    );
  }

}