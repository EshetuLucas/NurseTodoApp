import 'package:dexter_code_test/ui/bottom_sheet/frosted_bottom_sheet.dart';
import 'package:dexter_code_test/ui/dumb_widgets/app_button.dart';
import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:dexter_code_test/ui/ui_helpers/shared_styles.dart';
import 'package:dexter_code_test/ui/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:stacked_services/stacked_services.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDatePickerBottomSheetRequest {
  const CalendarDatePickerBottomSheetRequest({
    this.initialDate,
    this.firstDay,
    this.lastDay,
  });

  final DateTime? initialDate;
  final DateTime? firstDay;
  final DateTime? lastDay;
}

class CalendarDatePickerBottomSheet extends StatefulWidget {
  const CalendarDatePickerBottomSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  final Function(SheetResponse<DateTime>) completer;
  final SheetRequest<CalendarDatePickerBottomSheetRequest> request;

  @override
  _CalendarDatePickerBottomSheetState createState() =>
      _CalendarDatePickerBottomSheetState();
}

class _CalendarDatePickerBottomSheetState
    extends State<CalendarDatePickerBottomSheet> {
  late DateTime _selectedDate;

  late final data = widget.request.data;

  final _defaultFirstDate = DateTime.now();

  String dayFormat(DateTime day) {
    return DateFormat('d').format(day);
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      _selectedDate = data?.initialDate ?? DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.70,
      child: FrostedBottomSheet(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const ScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpaceMedium,
                TableCalendar(
                  currentDay: _selectedDate,
                  focusedDay: _selectedDate,
                  firstDay: widget.request.data?.firstDay ?? _defaultFirstDate,
                  lastDay: DateTime(_defaultFirstDate.year + 3),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDate = selectedDay;
                    });
                  },
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    leftChevronIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.chevron_left,
                          color: kcWhite,
                          size: 26,
                        ),
                      ],
                    ),
                    rightChevronIcon: const Icon(
                      Icons.chevron_right,
                      color: kcWhite,
                      size: 26,
                    ),
                    rightChevronPadding:
                        const EdgeInsets.only(top: 15, bottom: 15),
                    leftChevronPadding:
                        const EdgeInsets.only(top: 15, bottom: 15),
                    rightChevronMargin: const EdgeInsets.only(
                      right: 25,
                    ),
                    leftChevronMargin: const EdgeInsets.only(
                      left: 25,
                    ),
                  ),
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
                          style: ktsBoldMeidumDarkTextStyle.copyWith(
                              color: kcWhite),
                        ),
                      );
                    },
                    todayBuilder: (context, day, focusedDay) {
                      return Center(
                        child: Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            color: kcSecondaryColor,
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: Center(
                            child: Text(
                              dayFormat(day),
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
                          dayFormat(day),
                          style: ktsMediumDarkTextStyle.copyWith(
                            color: kcSecondaryColor,
                          ),
                        ),
                      );
                    },
                    defaultBuilder: (context, day, focusedDay) {
                      return Center(
                        child: Text(
                          dayFormat(day),
                          style:
                              ktsMediumDarkTextStyle.copyWith(color: kcWhite),
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
                verticalSpaceLarge,
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppButton(
              title: 'Done',
              onTap: () => widget.completer(
                SheetResponse(data: _selectedDate.toLocal()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
