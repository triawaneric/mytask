import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mytask/data/model/models.dart';

class DetailTaskScreen extends StatefulWidget{

  DetailTaskScreen({ super.key, this.task});
  final KTask? task ;


  @override
  State<StatefulWidget> createState() => _DetailTaskScreenSatet();

}

class _DetailTaskScreenSatet extends State<DetailTaskScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLoc.task_detail,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      body: SafeArea(
        
        child: SingleChildScrollView(

            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Title
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.task!.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),


              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.calendar_month),
                  ),
                  subtitle: Text(widget.task!.due_date),
                  title: Text(appLoc.task_due_date,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),


                ),
              ),

              const SizedBox(height: 10,),
              Text(widget.task!.lastIndex.toString())



              // Due Date


              
            ],
          ),
        ),
      ),
    );
  }

}