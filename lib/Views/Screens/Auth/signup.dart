import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_finance/Views/Screens/Auth/signin.dart';
import 'package:personal_finance/Views/Widgets/base_scaffold.dart';

import '../../../Logic/Auth/auth_bloc.dart';
import '../../../Utils/constatns.dart';
import '../../Widgets/common_widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthBloc authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: 'Sign Up',
        body: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              Container(
                width: 200.w,
                height: 200.w,
                padding: EdgeInsets.all(8.sp),
                child: Image.asset(APP_LOGO),
              ),
              CommonWidgets.customTextField(
                authBloc.emailCtrl,
                'Email',
              ),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.customTextField(
                authBloc.passCtrl,
                'Password',
                passWord: true,
              ),
              SizedBox(
                height: 16.h,
              ),
              CommonWidgets.customTextField(
                authBloc.confPassCtrl,
                'Confirm Password',
                passWord: true,
              ),
              const Spacer(),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  minimumSize: MaterialStatePropertyAll(
                    Size(MediaQuery.of(context).size.width * 0.7, 40.h),
                  ),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(4.sp)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () => authBloc.onSubmit(context, true),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(
                    Size(MediaQuery.of(context).size.width * 0.7, 40.h),
                  ),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(4.sp)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ));
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
            ],
          ),
        ),
        appBarIcon: Container());
  }
}
