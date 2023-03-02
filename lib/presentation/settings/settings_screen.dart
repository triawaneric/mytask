import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/auth/auth_bloc.dart';
import 'package:mytask/bloc/language/language_bloc.dart';
import 'package:mytask/bloc/theme/theme_bloc.dart';
import 'package:mytask/presentation/settings/statis/privacy_policy_screen.dart';
import 'package:mytask/presentation/settings/statis/term_of_service_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:package_info_plus/package_info_plus.dart';

class SettingScreen extends StatefulWidget{
  const SettingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingScreenState();

}

const List<Widget> lang = <Widget>[
  Padding(padding: EdgeInsets.all(5),
    child:Text('ENG'),
  ),

  Padding(padding: EdgeInsets.all(5),
    child: Text('ID'),
  )
];

const List<Widget> themes = <Widget>[
  Padding(padding: EdgeInsets.all(5),
    child:Text('DARK'),
  ),

  Padding(padding: EdgeInsets.all(5),
  child: Text('LIGHT'),
  )



];


class _SettingScreenState  extends State<SettingScreen>{

  final List<bool> _selectedLanguage = <bool>[false, true];
  final List<bool> _selectedThemes = <bool>[true, false];


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }


  @override
  Widget build(BuildContext context) {
    var appLoc = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser!;
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          appLoc.appTitleSettings,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(
                height: 30,
              ),


              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.brown.shade800,
                  child:  Text(
                    user.email![0].toString(),
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Container(

                alignment: Alignment.center,
                child: Text(
                  user.email.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                  ),
                ),
              ),




              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(20),
                elevation: 2,
                child: Column(
                  children: [


                    //Change Theme
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: const Icon(Icons.color_lens),
                        title: Text(
                            appLoc.themes
                        ),
                        trailing: BlocBuilder<ThemeBloc, ThemeMode>(
                          builder: (context, themeMode) => CupertinoSwitch(
                            value: themeMode == ThemeMode.dark,
                            onChanged: (value) {

                              BlocProvider.of<ThemeBloc>(context).changeThame();
                            },
                          ),
                        ),

                      ),
                    ),

                    //Divider
                    const Divider(
                      height: 10,
                    ),

                    //Language
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: const Icon(Icons.language),
                        title: Text(appLoc.language),

                        trailing: ToggleButtons(
                          direction: false ? Axis.vertical : Axis.horizontal,
                          onPressed: (int index) {
                            setState(() {
                              for (int i = 0; i < _selectedLanguage.length; i++) {
                                _selectedLanguage[i] = i == index;

                                if(_selectedLanguage[i]){
                                  print(_selectedLanguage[i].toString() + " data 1");
                                  context.read<LanguageBloc>().add(LanguageChangeRequested(language: "de",
                                  ));
                                }else{
                                  print(_selectedLanguage[i].toString() + " data 2");
                                  context.read<LanguageBloc>().add(LanguageChangeRequested(language: "en",
                                  ));
                                }

                              }
                            });
                          },
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          selectedBorderColor: Colors.red[700],
                          selectedColor: Colors.white,
                          fillColor: Colors.red[200],
                          color: Colors.red[400],
                          constraints: const BoxConstraints(
                            minHeight: 20.0,
                            minWidth: 40.0,
                          ),
                          isSelected: _selectedLanguage,
                          children: lang,
                        ),
                      ),
                    ),

                  ],
                ),
              ),


              const SizedBox(
                height: 10,
              ),


              //Apps About
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(20),
                elevation: 2,
                child: Column(
                  children: [
                    //Privacy Policy
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
                        );
                      },
                      child:  Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child:  ListTile(
                          leading: const Icon(Icons.privacy_tip_outlined),
                          title: Text(
                              appLoc.privacy_policy
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),


                    //Divider
                    const Divider(
                      height: 10,
                    ),


                    //Term of Service

                   GestureDetector(
                     onTap: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => TermServiceScreen()),
                       );
                     },
                     child:  Container(
                       margin: const EdgeInsets.symmetric(vertical: 5),
                       child: ListTile(
                         leading: const Icon(Icons.settings),
                         title: Text(
                             appLoc.term_service
                         ),
                         trailing: const Icon(Icons.arrow_forward_ios),
                       ),
                     ),
                   ),

                    //Divider
                    const Divider(
                      height: 10,
                    ),


                    //Verison
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: const Icon(Icons.phone_android),
                        title: Text(
                            appLoc.version
                        ),
                        trailing: FutureBuilder<PackageInfo>(
                          future: _getPackageInfo() ,
                          builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
                            if (snapshot.hasError) {
                              return const Text('ERROR');
                            } else if (!snapshot.hasData) {
                              return const Text('Loading...');
                            }

                            final data = snapshot.data!;

                            return Text(data.version);
                          },
                        ),
                        ),
                      ),
                  ],
                ),

              ),



              const SizedBox(
                height: 10,
              ),

              GestureDetector(
                onTap: (){
                  context.read<AuthBloc>().add(SignOutRequested());
                },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(20),
                  elevation: 2,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      appLoc.sign_out,
                      style: const TextStyle(
                          color: Colors.red
                      ),
                    ),
                  ),
                ),
              ),






            ],
          ),
        ),
      ),
    );
  }

}