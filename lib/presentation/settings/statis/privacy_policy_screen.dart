
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacyPolicyScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PrivacyPolicyScreenState();

}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLoc.privacy_policy,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Title

              //Content

              Container(
                alignment: Alignment.center,
                child: Html(data:appLoc.content_privacy_policy,
                style: {
                  "body": Style(
                    color: Theme.of(context).hintColor
                  ),
                }

              ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}