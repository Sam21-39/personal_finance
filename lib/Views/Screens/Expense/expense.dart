import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_finance/Logic/Expense/expense_bloc.dart';
import 'package:personal_finance/Models/category_model.dart';
import 'package:personal_finance/Views/Widgets/base_scaffold.dart';
import 'package:personal_finance/Views/Widgets/common_widgets.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  ExpenseBloc expenseBloc = ExpenseBloc();

  @override
  void initState() {
    super.initState();
    expenseBloc.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Add Expense',
      body: Stack(children: [_ui()]),
      appBarIcon: Container(),
    );
  }

  _ui() {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        children: [
          CommonWidgets.customTextField(TextEditingController(), "Amount"),
          SizedBox(
            height: 16.h,
          ),
          CommonWidgets.customTextField(
            TextEditingController(),
            "Category",
            readOnly: true,
            onTap: () {
              showAdaptiveDialog(
                context: context,
                builder: (context) => Dialog(
                  child: StreamBuilder<List<CategoryModel>>(
                    initialData: const [],
                    stream: expenseBloc.categoryCtrl.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                         return Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: snapshot.data!
                                .map(
                                  (e) => Text(
                                    e.name!,
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                )
                                .toList());
                      }
                      return const CircularProgressIndicator.adaptive();
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
