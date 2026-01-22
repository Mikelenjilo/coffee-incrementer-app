import 'package:coffee_inctrementer/features/portoflio/blocs/name/name_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'core/controllers/initial_navigation_controller.dart';
import 'core/di/injection.dart';
import 'features/auth/blocs/auth_cubit.dart';
import 'features/auth/view/pages/login_page.dart';
import 'features/portoflio/blocs/cups/cups_cubit.dart';
import 'features/portoflio/view/pages/home_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  await getIt.allReady();
  runApp(const SetupApp());
}

class SetupApp extends StatelessWidget {
  const SetupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          getIt<InitialNavigationController>()..checkIfUserIsLoggedIn(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<AuthCubit>()),
          BlocProvider(create: (context) => getIt<CupsCubit>()),
          BlocProvider(create: (context) => getIt<NameCubit>()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: App(),
        ),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InitialNavigationController>(
      builder: (context, controller, child) {
        if (controller.isLoggedIn) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
