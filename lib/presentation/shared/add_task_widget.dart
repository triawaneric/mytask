
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mytask/utils/constants/consts_variables.dart';
import 'package:mytask/utils/helper/colors.dart';

import 'button_widget.dart';

class AddTaskForm extends StatefulWidget {
  final Function addTaskHandler;
  const AddTaskForm({super.key, required this.addTaskHandler});

  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  late int _selectedcolor;

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  void initState() {
    // TODO: implement initState
    _selectedcolor = 0;
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appLoc = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(20)),
        child:Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              appLoc.add_task,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 25.0),
              child: TextFormField(

                decoration: InputDecoration(
                  hintText: appLoc.task_title,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                controller: _textController,
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 25.0),
              child: TextFormField(
                readOnly: true,
                decoration:  InputDecoration(
                  hintText: appLoc.task_due_date,
                  border: const OutlineInputBorder(),

                ),
                onTap: () async {
                    //datapicker show

                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), //get today's date
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );

                  if(pickedDate != null ){
                    print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                    print(formattedDate); //formatted date output using intl package =>  2022-07-04
                    //You can format date as per your need

                    setState(() {
                      _dueDateController.text = formattedDate; //set foratted date to TextField value.
                    });
                  }else{
                    print("Date is not selected");
                  }

                  },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a due date';
                  }
                  return null;
                },
                controller: _dueDateController,
              ),
            ),


            //Color Picker
            Wrap(

              children: List<Widget>.generate(
                  3,
                      (index) => Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedcolor = index;
                        });
                      },
                      child: CircleAvatar(
                          backgroundColor: colors[index],
                          child: _selectedcolor == index
                              ? const Icon(
                            Icons.done,
                            color: Appcolors.white,
                          )
                              : null),
                    ),
                  )),
            ),

            const SizedBox(height: 20,),

            ButtonGeneric(
              label: appLoc.save,
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  Navigator.of(context).pop();
                  widget.addTaskHandler(
                      _textController.text.trim(),
                    _dueDateController.text.trim(),
                      _selectedcolor.toString(),
                   true,


                  );
                }
              },
            ),
          ],
        ),
      ),
      ),
    );
  }
}