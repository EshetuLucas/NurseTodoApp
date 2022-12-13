import 'package:dexter_code_test/datamodels/task_model/task_model.dart';
import 'package:dexter_code_test/ui/dumb_widgets/app_button.dart';
import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:dexter_code_test/ui/ui_helpers/shared_styles.dart';
import 'package:dexter_code_test/ui/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendar_viewmodel.dart';

class UserCalendarView extends ViewModelWidget<CalendarViewModel> {
  const UserCalendarView({
    Key? key,
    required this.tasks,
    this.onMonthChanged,
  }) : super(key: key);
  final List<TaskModel> tasks;
  final Function(DateTime)? onMonthChanged;

  @override
  Widget build(BuildContext context, CalendarViewModel model) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TableCalendar(
            rowHeight: 38,
            currentDay: model.selectedDate,
            focusedDay: model.selectedDate,
            firstDay: DateTime(model.selectedDate.year),
            lastDay: DateTime(model.selectedDate.year + 3),
            onDaySelected: (selectedDay, focusedDay) {
              model.onSelectedDateChange(selectedDay);
            },
            headerStyle: HeaderStyle(
              titleCentered: true,
              decoration: const BoxDecoration(),
              formatButtonVisible: false,
              leftChevronIcon: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    width: 80,
                    child: AppButton(
                      title: "Today",
                      onTap: () => {
                        model.onSelectedDateChange(DateTime.now()),
                      },
                    ),
                  ),
                  verticalSpaceMedium,
                  const Icon(
                    Icons.chevron_left,
                    color: kcPrimaryColor,
                    size: 26,
                  ),
                ],
              ),
              rightChevronIcon: const Icon(
                Icons.chevron_right,
                color: kcPrimaryColor,
                size: 26,
              ),
              rightChevronPadding: const EdgeInsets.only(top: 15, bottom: 15),
              leftChevronPadding: const EdgeInsets.only(top: 15, bottom: 15),
              rightChevronMargin: const EdgeInsets.all(0).copyWith(
                right: 50,
              ),
              leftChevronMargin: const EdgeInsets.all(0).copyWith(
                left: 20,
              ),
            ),
            eventLoader: (DateTime dateTime) {
              List<Widget> list = [];
              for (var task in model.tasks) {
                dateTime.day == task.createdAt!.day &&
                        dateTime.year == task.createdAt!.year &&
                        dateTime.month == task.createdAt!.month
                    ? list.add(const CircleAvatar(
                        maxRadius: 1,
                        foregroundColor: kcPrimaryColor,
                        backgroundColor: kcSecondaryColor,
                      ))
                    : Container();
              }
              return list;
            },
            calendarBuilders: CalendarBuilders(
              singleMarkerBuilder: (context, date, event) {
                return Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kcSecondaryColor,
                  ),
                  width: 7.0,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(horizontal: 1.5),
                );
              },
              headerTitleBuilder: (context, day) {
                return Center(
                  child: Text(
                    DateFormat('MMMM yyyy').format(day),
                    style: ktsBoldMeidumDarkTextStyle,
                  ),
                );
              },
              todayBuilder: (context, day, focusedDay) {
                return Center(
                  child: Container(
                    height: 35.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                      color: kcPrimaryColor,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Center(
                      child: Text(
                        model.dayFormat(day),
                        style: ktsBoldMeidumDarkTextStyle.copyWith(
                          color: kcWhite,
                        ),
                      ),
                    ),
                  ),
                );
              },
              outsideBuilder: (context, day, focusedDay) {
                return Center(
                  child: Text(
                    model.dayFormat(day),
                    style: ktsMediumDarkTextStyle.copyWith(
                      color: kcWhite.withOpacity(0.4),
                    ),
                  ),
                );
              },
              defaultBuilder: (context, day, focusedDay) {
                return Center(
                  child: Text(
                    model.dayFormat(day),
                    style: ktsMediumDarkTextStyle,
                  ),
                );
              },
              dowBuilder: (context, day) {
                final text = DateFormat.E().format(day);

                return Center(
                  child: Text(
                    text.toUpperCase(),
                    style: ktsSmallDarkTextStyle.copyWith(
                      fontSize: 11,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        verticalSpaceTiny,
      ],
    );
  }
}
