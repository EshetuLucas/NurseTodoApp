import 'package:dexter_code_test/ui/dumb_widgets/dexter_app_bar.dart';
import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:dexter_code_test/ui/views/account/account_view.dart';
import 'package:dexter_code_test/ui/views/add_task/add_task_view.dart';
import 'package:dexter_code_test/ui/views/calendar_view/calendar_view.dart';
import 'package:dexter_code_test/ui/views/landing/landing_view.dart';
import 'package:dexter_code_test/ui/views/residents/residents_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: const DexterAppBar(),
        body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          selectedItemColor: kcPrimaryColor,
          unselectedItemColor: kcDarkGreyColor.withOpacity(0.5),
          backgroundColor: kcWhite,
          items: [
            bottomNavigationBarItem('Home', CupertinoIcons.home),
            bottomNavigationBarItem('Add Task', CupertinoIcons.add),
            bottomNavigationBarItem('Account', CupertinoIcons.person),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(String label, IconData icon) {
    return BottomNavigationBarItem(
      label: label.toUpperCase(),
      icon: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
        child: Icon(icon),
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return CalendarView();
      case 1:
        return AddTaskView();

      default:
        return AccountView();
    }
  }
}
