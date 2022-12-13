import 'package:dexter_code_test/app/app.locator.dart';
import 'package:dexter_code_test/enums/bottom_sheet_type.dart';
import 'package:stacked_services/stacked_services.dart';
import 'date_picker_bottomsheet.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();
  final builders = {
    BottomSheetType.calendar: (context, sheetRequest, completer) =>
        CalendarDatePickerBottomSheet(
          completer: completer,
          request: sheetRequest,
        ),
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
