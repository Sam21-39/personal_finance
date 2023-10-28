import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget appBarIcon;
  final Function()? onBackPress;
  final List<Widget>? appBarActions;
  final BottomNavigationBar? bottomNavigationBar;
  final FloatingActionButton? fab;
  const BaseScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.appBarIcon,
    this.onBackPress,
    this.appBarActions,
    this.bottomNavigationBar,
    this.fab,
  });

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _generalAppBar(),
      backgroundColor: Colors.white,
      body: _connectivityCheckerBody(),
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.fab,
      resizeToAvoidBottomInset: false,
    );
  }

  _connectivityCheckerBody() => StreamBuilder(
      initialData: ConnectivityResult.wifi,
      stream: Connectivity().onConnectivityChanged.asBroadcastStream(),
      builder: (context, connc) {
        if (connc.data == ConnectivityResult.wifi ||
            connc.data == ConnectivityResult.mobile) {
          return widget.body;
        }
        return Container(
          color: Colors.black12,
          child: Center(
            child: Text(
              'No internet connection found. Try again later!',
              style: TextStyle(fontSize: 20.sp, color: Colors.red.shade300),
            ),
          ),
        );
      });

  _generalAppBar() => AppBar(
        backgroundColor: Colors.blue.shade50,
        centerTitle: true,
        title: Row(
          children: [
            widget.appBarIcon,
            SizedBox(width: 8.w),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade800,
              ),
            )
          ],
        ),
        leading: widget.onBackPress == null
            ? Container()
            : IconButton(
                onPressed: widget.onBackPress,
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                ),
              ),
        actions: widget.appBarActions,
      );
}
