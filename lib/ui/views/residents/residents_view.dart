import 'package:dexter_code_test/datamodels/resident_model/resident_model.dart';
import 'package:dexter_code_test/ui/dumb_widgets/app_divider.dart';
import 'package:dexter_code_test/ui/dumb_widgets/dexter_app_bar.dart';
import 'package:dexter_code_test/ui/dumb_widgets/image_builder.dart';
import 'package:dexter_code_test/ui/dumb_widgets/input_field.dart';
import 'package:dexter_code_test/ui/dumb_widgets/resident_card.dart';
import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:dexter_code_test/ui/ui_helpers/shared_styles.dart';
import 'package:dexter_code_test/ui/ui_helpers/ui_helpers.dart';
import 'package:dexter_code_test/ui/views/residents/residents_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';

class ResidentsView extends HookWidget {
  const ResidentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    return ViewModelBuilder<ResidentsViewModel>.reactive(
      viewModelBuilder: () => ResidentsViewModel(),
      builder: (
        BuildContext context,
        ResidentsViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: model.onCreateResident,
              child: const Icon(Icons.person_add),
            ),
            appBar: const DexterAppBar(
              size: 50,
              title: "Residents",
            ),
            body: Padding(
              padding: appSymmetricEdgePadding,
              child: Column(
                children: [
                  verticalSpaceSmall,
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Card(
                      elevation: 15,
                      shadowColor: kcPrimaryColor.withOpacity(0.99),
                      margin: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: InputField(
                          controller: searchController,
                          onChanged: model.onSearchTextChange,
                          placeholder: 'Search for resident'),
                    ),
                  ),
                  verticalSpaceMedium,
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => verticalSpaceMedium,
                      itemCount: model.isBusy ? 5 : model.residents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final resident = model.isBusy
                            ? fakeResident
                            : model.residents[index];
                        return GestureDetector(
                          onTap: () => model.onResidentTap(resident),
                          child: ResidentCard(resident: resident),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
