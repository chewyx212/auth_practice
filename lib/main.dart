import 'package:auth_practice/screens/home_screen.dart';
import 'package:auth_practice/screens/onboard_screen.dart';
import 'package:auth_practice/screens/login_screen.dart';
import 'package:auth_practice/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = GoRouter(
    refreshListenable:
        GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()),
    redirect: (GoRouterState state) {
      bool isLoggedIn =
          FirebaseAuth.instance.currentUser != null ? true : false;
      print(isLoggedIn);
      print(!isLoggedIn);
      print('inside router listen');
      print(state.location);
      if (isLoggedIn && state.location == '/login') return '/';
      if (!isLoggedIn && state.location == '/') return '/login';
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/onbaord',
        builder: (context, state) => const OnboardScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      title: 'Flutter Login Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'SFProDisplay')
          .copyWith(
              inputDecorationTheme: InputDecorationTheme(
        filled: true,
        floatingLabelStyle: TextStyle(color: Colors.grey.shade400),
        fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) {
            return Colors.transparent;
          }
          return Colors.grey.shade100;
        }),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelAlignment: FloatingLabelAlignment.start,
      )),
    );
  }
}
