import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mytask/bloc/kanban/kanban_bloc.dart';
import 'package:mytask/bloc/language/language_bloc.dart';
import 'package:mytask/bloc/theme/theme_bloc.dart';
import 'package:mytask/presentation/homenav/home_nav.dart';
import 'package:mytask/presentation/signin/sign_in_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mytask/utils/services/firestore_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'bloc/auth/auth_bloc.dart';
import 'data/repositories/auth_repository.dart';
import 'utils/helper/theme.dart';
import 'utils/services/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPref.init();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  final FireStoreService fireStoreService = FireStoreService();
  @override
  Widget build(BuildContext context) {


    return RepositoryProvider(
      create: (context) => AuthRepository(),
        child: MultiBlocProvider(
        providers: [
            BlocProvider<AuthBloc>(
    create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context),
          ),
            ),
            BlocProvider<KanbanBloc>(
              create: (_) {
                final bloc = KanbanBloc(fireStoreService);
                bloc.add(const KanbanEvent.getColumns());
                return bloc;
              },
            ),
            BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
            BlocProvider<LanguageBloc>(create: (context) => LanguageBloc()),
        ],

         child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, stateLan) {
            return BlocBuilder<ThemeBloc, ThemeMode>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,


                  title: 'My Task',
                  theme: lightTheme(context),
                  darkTheme: darkTheme(context),
                  themeMode: state,
                  localizationsDelegates:
                  AppLocalizations.localizationsDelegates, // important
                  supportedLocales:AppLocalizations.supportedLocales,
                  locale:Locale(stateLan.language),
                  home: StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, snapshot) {
                        // If the snapshot has user data, then they're already signed in. So Navigating to the Dashboard.
                        if (snapshot.hasData) {
                          return HomeNavScreen();
                        }
                        // Otherwise, they're not signed in. Show the sign in page.
                        return const SignIn();
                      }),
                );
              },
            );

          }
          )
        )
    );

  }
}
