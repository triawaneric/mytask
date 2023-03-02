
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskMenu extends StatelessWidget {
  final Function deleteHandler;

  const TaskMenu({
    super.key,
    required this.deleteHandler,
  });

  @override
  Widget build(BuildContext context) {
    var appLoc = AppLocalizations.of(context)!;
    final double paddingBottom = MediaQuery.of(context).padding.bottom;
    return IntrinsicHeight(
      child: Column(
        children: [


          //Update
          Container(

            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 30, bottom: paddingBottom + 6),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
                deleteHandler();
              },
              child: SizedBox(
                height: 40,
                child: Text(
                  appLoc.update,
                  style:Theme.of(context).textTheme.titleMedium
                ),
              ),
            ),
          ),




          // Delete
          Container(

            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 30, bottom: paddingBottom + 6),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
                deleteHandler();
              },
              child: SizedBox(
                height: 40,
                child: Text(
                  appLoc.delete,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),

    );
  }
}
