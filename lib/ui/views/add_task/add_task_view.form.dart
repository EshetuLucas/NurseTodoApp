// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String TitleValueKey = 'title';
const String DescriptionValueKey = 'description';
const String ResidentNameValueKey = 'residentName';
const String DateValueKey = 'date';

final Map<String, TextEditingController> _AddTaskViewTextEditingControllers =
    {};

final Map<String, FocusNode> _AddTaskViewFocusNodes = {};

final Map<String, String? Function(String?)?> _AddTaskViewTextValidations = {
  TitleValueKey: null,
  DescriptionValueKey: null,
  ResidentNameValueKey: null,
  DateValueKey: null,
};

mixin $AddTaskView on StatelessWidget {
  TextEditingController get titleController =>
      _getFormTextEditingController(TitleValueKey);
  TextEditingController get descriptionController =>
      _getFormTextEditingController(DescriptionValueKey);
  TextEditingController get residentNameController =>
      _getFormTextEditingController(ResidentNameValueKey);
  TextEditingController get dateController =>
      _getFormTextEditingController(DateValueKey);
  FocusNode get titleFocusNode => _getFormFocusNode(TitleValueKey);
  FocusNode get descriptionFocusNode => _getFormFocusNode(DescriptionValueKey);
  FocusNode get residentNameFocusNode =>
      _getFormFocusNode(ResidentNameValueKey);
  FocusNode get dateFocusNode => _getFormFocusNode(DateValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_AddTaskViewTextEditingControllers.containsKey(key)) {
      return _AddTaskViewTextEditingControllers[key]!;
    }
    _AddTaskViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddTaskViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddTaskViewFocusNodes.containsKey(key)) {
      return _AddTaskViewFocusNodes[key]!;
    }
    _AddTaskViewFocusNodes[key] = FocusNode();
    return _AddTaskViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    titleController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
    residentNameController.addListener(() => _updateFormData(model));
    dateController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          TitleValueKey: titleController.text,
          DescriptionValueKey: descriptionController.text,
          ResidentNameValueKey: residentNameController.text,
          DateValueKey: dateController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        TitleValueKey: _getValidationMessage(TitleValueKey),
        DescriptionValueKey: _getValidationMessage(DescriptionValueKey),
        ResidentNameValueKey: _getValidationMessage(ResidentNameValueKey),
        DateValueKey: _getValidationMessage(DateValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _AddTaskViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_AddTaskViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AddTaskViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddTaskViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddTaskViewTextEditingControllers.clear();
    _AddTaskViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get titleValue => this.formValueMap[TitleValueKey] as String?;
  String? get descriptionValue =>
      this.formValueMap[DescriptionValueKey] as String?;
  String? get residentNameValue =>
      this.formValueMap[ResidentNameValueKey] as String?;
  String? get dateValue => this.formValueMap[DateValueKey] as String?;

  bool get hasTitle =>
      this.formValueMap.containsKey(TitleValueKey) &&
      (titleValue?.isNotEmpty ?? false);
  bool get hasDescription =>
      this.formValueMap.containsKey(DescriptionValueKey) &&
      (descriptionValue?.isNotEmpty ?? false);
  bool get hasResidentName =>
      this.formValueMap.containsKey(ResidentNameValueKey) &&
      (residentNameValue?.isNotEmpty ?? false);
  bool get hasDate =>
      this.formValueMap.containsKey(DateValueKey) &&
      (dateValue?.isNotEmpty ?? false);

  bool get hasTitleValidationMessage =>
      this.fieldsValidationMessages[TitleValueKey]?.isNotEmpty ?? false;
  bool get hasDescriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey]?.isNotEmpty ?? false;
  bool get hasResidentNameValidationMessage =>
      this.fieldsValidationMessages[ResidentNameValueKey]?.isNotEmpty ?? false;
  bool get hasDateValidationMessage =>
      this.fieldsValidationMessages[DateValueKey]?.isNotEmpty ?? false;

  String? get titleValidationMessage =>
      this.fieldsValidationMessages[TitleValueKey];
  String? get descriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey];
  String? get residentNameValidationMessage =>
      this.fieldsValidationMessages[ResidentNameValueKey];
  String? get dateValidationMessage =>
      this.fieldsValidationMessages[DateValueKey];
}

extension Methods on FormViewModel {
  setTitleValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TitleValueKey] = validationMessage;
  setDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionValueKey] = validationMessage;
  setResidentNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ResidentNameValueKey] = validationMessage;
  setDateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DateValueKey] = validationMessage;
}
