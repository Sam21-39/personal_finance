import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_finance/Logic/Auth/auth_bloc.dart';
import 'package:personal_finance/Views/Screens/Auth/signup.dart';
import 'package:personal_finance/Views/Screens/Home/home.dart';
import 'package:personal_finance/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthBloc authBloc = AuthBloc();

  @override
  void initState() {
    super.initState();
    authBloc.getLoginState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: ScreenUtil.defaultSize,
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Personal Finance',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            home: StreamBuilder<bool>(
                initialData: false,
                stream: authBloc.loginCtrl.stream,
                builder: (context, snapshot) {
                  if (snapshot.data!) {
                    return const HomePage();
                  }
                  return const SignUpPage();
                }),
          );
        });
  }
}
