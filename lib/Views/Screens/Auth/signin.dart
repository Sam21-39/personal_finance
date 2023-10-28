import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_finance/Views/Screens/Auth/signup.dart';
import 'package:personal_finance/Views/Widgets/base_scaffold.dart';

import '../../../Logic/Auth/auth_bloc.dart';
import '../../../Utils/constatns.dart';
import '../../Widgets/common_widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  AuthBloc authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: 'Sign In',
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
                onPressed: () => authBloc.onSubmit(context, false),
                child: Text(
                  'Sign In',
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
                    builder: (context) => const SignUpPage(),
                  ));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
            ],
          ),
        ),
        appBarIcon: Container());
  }
}
