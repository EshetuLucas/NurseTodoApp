import 'package:dexter_code_test/enums/task_status.dart';
import 'package:dexter_code_test/ui/dumb_widgets/dexter_app_bar.dart';
import 'package:dexter_code_test/ui/dumb_widgets/spinner.dart';
import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:dexter_code_test/ui/ui_helpers/shared_styles.dart';
import 'package:dexter_code_test/ui/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'calendar_viewmodel.dart';
import 'user_calendar_view.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({
    super.key,
    this.initialDate,
    this.showAppBar = false,
  });

  final DateTime? initialDate;
  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalendarViewModel>.reactive(
      viewModelBuilder: () => CalendarViewModel(initialDate),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcWhite,
        body: SafeArea(
            child: Stack(
          children: [
            Column(
              children: [
                verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        'Tasks',
                        style: ktsBoldTextStyle.copyWith(
                          fontSize: 20,
                          color: kcSecondaryColor,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: model.onShowCalendar,
                        child: const Icon(
                          Icons.notifications,
                          color: kcSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                UserCalendarView(
                  tasks: model.tasks,
                  onMonthChanged: (date) => null,
                ),
                verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      model.selectedDateText,
                      style: ktsBoldTextStyle.copyWith(
                        fontSize: 20,
                        color: kcSecondaryColor,
                      ),
                    ),
                  ),
                ),
                verticalSpaceMedium,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: model.tasks.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Nothing to show',
                              style: ktsMediumDarkTextStyle.copyWith(
                                fontSize: 16,
                                color: kcDarkGreyColor,
                              ),
                            ),
                          )
                        : ListView.separated(
                            separatorBuilder: (context, index) =>
                                verticalSpaceMedium,
                            itemCount: model.tasks.length,
                            itemBuilder: (BuildContext context, int index) {
                              final task = model.tasks[index];
                              return Card(
                                elevation: 4,
                                shadowColor: kcPrimaryColor.withOpacity(0.99),
                                margin: EdgeInsets.zero,
                                clipBehavior: Clip.antiAlias,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        task.title ?? '',
                                        style: ktsBoldMeidumDarkTextStyle
                                            .copyWith(color: kcPrimaryColor),
                                      ),
                                      verticalSpaceTiny,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        child: Text(
                                          task.description ?? '',
                                        ),
                                      ),
                                      verticalSpaceMedium,
                                      Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 0,
                                              ),
                                              child: GestureDetector(
                                                onTap: () =>
                                                    model.onMarkAdDone(task),
                                                child: Text(
                                                  task.taskStatus ==
                                                          TaskStatus.pending
                                                      ? 'Mark as Done'
                                                      : 'Completed',
                                                  style:
                                                      ktsBoldMeidumDarkTextStyle
                                                          .copyWith(
                                                    color: kcSecondaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 0,
                                              ),
                                              child: TextButton(
                                                onPressed: () =>
                                                    model.onTransferTask(task),
                                                child: Text(
                                                  'Transfer to the next shift',
                                                  style:
                                                      ktsBoldMeidumDarkTextStyle
                                                          .copyWith(
                                                    color: kcPrimaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                )
              ],
            ),
            if (model.isBusy)
              Container(
                height: MediaQuery.of(context).size.height,
                color: kcDarkGreyColor.withOpacity(0.001),
                child: const Spinner(
                  color: kcPrimaryColor,
                ),
              )
          ],
        )),
      ),
    );
  }
}
