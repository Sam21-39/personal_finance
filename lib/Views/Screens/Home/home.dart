import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_finance/Logic/Home/home_bloc.dart';
import 'package:personal_finance/Models/expense_model.dart';
import 'package:personal_finance/Models/user_model.dart';
import 'package:personal_finance/Views/Screens/Expense/expense.dart';
import 'package:personal_finance/Views/Widgets/base_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Home',
      body: Stack(
        children: [
          _ui(),
        ],
      ),
      appBarIcon: Container(),
      fab: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ExpensePage(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.blue.shade400,
        ),
      ),
    );
  }

  _ui() {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              StreamBuilder<UserModel>(
                  stream: homeBloc.userCtrl.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            snapshot.data!.userName!,
                            style: TextStyle(
                              fontSize: 30.sp,
                              color: Colors.blue.shade800,
                            ),
                          ),
                          Text(
                            'Monthly Budget: ${snapshot.data!.budget!.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: Colors.teal.shade600,
                            ),
                          ),
                        ],
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'User',
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        Text(
                          'Monthly Budget: 0.00',
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.teal.shade600,
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
          const Divider(),
          Expanded(
              child: StreamBuilder<List<ExpenseModel>>(
            initialData: const [],
            stream: homeBloc.expensesCtrl.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container();
                  },
                );
              }
              return Container();
            },
          ))
        ],
      ),
    );
  }
}
