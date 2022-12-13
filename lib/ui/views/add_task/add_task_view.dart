import 'package:dexter_code_test/constants/app_constants.dart';
import 'package:dexter_code_test/enums/shift_type.dart';
import 'package:dexter_code_test/ui/dumb_widgets/app_button.dart';
import 'package:dexter_code_test/ui/dumb_widgets/input_field.dart';
import 'package:dexter_code_test/ui/dumb_widgets/resident_card.dart';
import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:dexter_code_test/ui/ui_helpers/shared_styles.dart';
import 'package:dexter_code_test/ui/ui_helpers/ui_helpers.dart';
import 'package:dexter_code_test/ui/views/add_task/add_task_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'add_task_view.form.dart';

@FormView(
  fields: [
    FormTextField(
      name: "title",
    ),
    FormTextField(
      name: "description",
    ),
    FormTextField(
      name: "residentName",
    ),
    FormTextField(
      name: "date",
    ),
  ],
)
class AddTaskView extends StatelessWidget with $AddTaskView {
  AddTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTaskViewModel>.reactive(
      viewModelBuilder: () => AddTaskViewModel(),
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) {
        return IgnorePointer(
          ignoring: model.isBusy,
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          verticalSpaceMedium,
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Add a new Task',
                                style: ktsWhiteMediumTextStyle.copyWith(
                                  fontSize: 23,
                                  color: kcPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Let\'s Add a new task for resident ',
                                style: ktsSmallWhiteTextStyle.copyWith(
                                  fontSize: 17,
                                  color: kcPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: model.hasResident
                                ? ResidentCard(resident: model.resident!)
                                : SizedBox(
                                    height: 120,
                                    child: GestureDetector(
                                      onTap: model.onAddResident,
                                      child: Card(
                                        elevation: 4,
                                        shadowColor:
                                            kcPrimaryColor.withOpacity(0.99),
                                        margin: EdgeInsets.zero,
                                        clipBehavior: Clip.antiAlias,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            children: [
                                              const Icon(
                                                Icons.add_circle_sharp,
                                                color: kcPrimaryColor,
                                                size: 60,
                                              ),
                                              Text(
                                                'Tap to Add Resident',
                                                style:
                                                    ktsBoldMeidumDarkTextStyle
                                                        .copyWith(
                                                  fontSize: 18,
                                                  color: kcPrimaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                      ),
                                    ),
                                  ),
                          ),
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                verticalSpaceSmall,
                                InputField(
                                  controller: titleController,
                                  maxLine: 1,
                                  hasFocusedBorder: true,
                                  textInputType: TextInputType.emailAddress,
                                  isReadOnly: model.isBusy,
                                  nextFocusNode: FocusScope.of(context),
                                  placeholder: 'Title',
                                  floatingPlaceholder: 'Task Title',
                                ),
                                if (model.showValidationMessage &&
                                    !model.hasTitle)
                                  const _ValidationMessage(
                                    title: 'Title $CantBeEmpty',
                                  ),
                                verticalSpaceMedium,
                                InputField(
                                  controller: descriptionController,
                                  maxLine: 6,
                                  hasFocusedBorder: true,
                                  isReadOnly: model.isBusy,
                                  nextFocusNode: FocusScope.of(context),
                                  placeholder: 'Description',
                                  floatingPlaceholder: 'Task Description',
                                ),
                                if (model.showValidationMessage &&
                                    !model.hasDescription)
                                  const _ValidationMessage(
                                    title: 'Description $CantBeEmpty',
                                  ),
                                verticalSpaceMedium,
                                GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    model.onSelecteDate();
                                  },
                                  child: AbsorbPointer(
                                    absorbing: true,
                                    child: InputField(
                                      controller: dateController,
                                      maxLine: 1,
                                      hasFocusedBorder: true,
                                      isReadOnly: model.isBusy,
                                      nextFocusNode: FocusScope.of(context),
                                      placeholder: model.hasDate
                                          ? model.selectedDate
                                          : 'Date',
                                      floatingPlaceholder: 'Task Date',
                                    ),
                                  ),
                                ),
                                if (model.showValidationMessage &&
                                    !model.hasDate)
                                  const _ValidationMessage(
                                    title: 'Description $CantBeEmpty',
                                  ),
                                verticalSpaceMedium,
                                verticalSpaceMedium,
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Select Shift'),
                            ),
                          ),
                          verticalSpaceSmall,
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 20,
                              children: [
                                for (var shiftType in ShiftType.values)
                                  GestureDetector(
                                    onTap: () =>
                                        model.onSelectShiftType(shiftType),
                                    child: Card(
                                      color: model.selectedShift == shiftType
                                          ? kcPrimaryColor
                                          : kcWhite,
                                      elevation: 4,
                                      shadowColor:
                                          kcPrimaryColor.withOpacity(0.99),
                                      margin: EdgeInsets.zero,
                                      clipBehavior: Clip.antiAlias,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      )),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 16),
                                        child: Text(
                                          shiftType.name.toUpperCase(),
                                          style: ktsDarkGreyTextStyle.copyWith(
                                            color:
                                                model.selectedShift == shiftType
                                                    ? kcWhite
                                                    : kcPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          verticalSpaceMedium,
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: AppButton(
                              title: 'Add Task',
                              busy: model.isBusy,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                model.onAddTask();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ValidationMessage extends StatelessWidget {
  const _ValidationMessage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceTiny,
          Text("$title",
              style: ktsSmallWhiteTextStyle.copyWith(
                color: Colors.red.withOpacity(0.7),
              ))
        ],
      ),
    );
  }
}
