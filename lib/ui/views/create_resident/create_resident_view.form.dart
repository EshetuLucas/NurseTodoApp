// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String FullNameValueKey = 'fullName';
const String AgeValueKey = 'age';
const String GenderValueKey = 'gender';
const String RoomNumberValueKey = 'roomNumber';

final Map<String, TextEditingController>
    _CreateResidentViewTextEditingControllers = {};

final Map<String, FocusNode> _CreateResidentViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _CreateResidentViewTextValidations = {
  FullNameValueKey: null,
  AgeValueKey: null,
  GenderValueKey: null,
  RoomNumberValueKey: null,
};

mixin $CreateResidentView on StatelessWidget {
  TextEditingController get fullNameController =>
      _getFormTextEditingController(FullNameValueKey);
  TextEditingController get ageController =>
      _getFormTextEditingController(AgeValueKey);
  TextEditingController get genderController =>
      _getFormTextEditingController(GenderValueKey);
  TextEditingController get roomNumberController =>
      _getFormTextEditingController(RoomNumberValueKey);
  FocusNode get fullNameFocusNode => _getFormFocusNode(FullNameValueKey);
  FocusNode get ageFocusNode => _getFormFocusNode(AgeValueKey);
  FocusNode get genderFocusNode => _getFormFocusNode(GenderValueKey);
  FocusNode get roomNumberFocusNode => _getFormFocusNode(RoomNumberValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_CreateResidentViewTextEditingControllers.containsKey(key)) {
      return _CreateResidentViewTextEditingControllers[key]!;
    }
    _CreateResidentViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreateResidentViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreateResidentViewFocusNodes.containsKey(key)) {
      return _CreateResidentViewFocusNodes[key]!;
    }
    _CreateResidentViewFocusNodes[key] = FocusNode();
    return _CreateResidentViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    fullNameController.addListener(() => _updateFormData(model));
    ageController.addListener(() => _updateFormData(model));
    genderController.addListener(() => _updateFormData(model));
    roomNumberController.addListener(() => _updateFormData(model));
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
          FullNameValueKey: fullNameController.text,
          AgeValueKey: ageController.text,
          GenderValueKey: genderController.text,
          RoomNumberValueKey: roomNumberController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        FullNameValueKey: _getValidationMessage(FullNameValueKey),
        AgeValueKey: _getValidationMessage(AgeValueKey),
        GenderValueKey: _getValidationMessage(GenderValueKey),
        RoomNumberValueKey: _getValidationMessage(RoomNumberValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _CreateResidentViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_CreateResidentViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _CreateResidentViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreateResidentViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CreateResidentViewTextEditingControllers.clear();
    _CreateResidentViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get fullNameValue => this.formValueMap[FullNameValueKey] as String?;
  String? get ageValue => this.formValueMap[AgeValueKey] as String?;
  String? get genderValue => this.formValueMap[GenderValueKey] as String?;
  String? get roomNumberValue =>
      this.formValueMap[RoomNumberValueKey] as String?;

  bool get hasFullName =>
      this.formValueMap.containsKey(FullNameValueKey) &&
      (fullNameValue?.isNotEmpty ?? false);
  bool get hasAge =>
      this.formValueMap.containsKey(AgeValueKey) &&
      (ageValue?.isNotEmpty ?? false);
  bool get hasGender =>
      this.formValueMap.containsKey(GenderValueKey) &&
      (genderValue?.isNotEmpty ?? false);
  bool get hasRoomNumber =>
      this.formValueMap.containsKey(RoomNumberValueKey) &&
      (roomNumberValue?.isNotEmpty ?? false);

  bool get hasFullNameValidationMessage =>
      this.fieldsValidationMessages[FullNameValueKey]?.isNotEmpty ?? false;
  bool get hasAgeValidationMessage =>
      this.fieldsValidationMessages[AgeValueKey]?.isNotEmpty ?? false;
  bool get hasGenderValidationMessage =>
      this.fieldsValidationMessages[GenderValueKey]?.isNotEmpty ?? false;
  bool get hasRoomNumberValidationMessage =>
      this.fieldsValidationMessages[RoomNumberValueKey]?.isNotEmpty ?? false;

  String? get fullNameValidationMessage =>
      this.fieldsValidationMessages[FullNameValueKey];
  String? get ageValidationMessage =>
      this.fieldsValidationMessages[AgeValueKey];
  String? get genderValidationMessage =>
      this.fieldsValidationMessages[GenderValueKey];
  String? get roomNumberValidationMessage =>
      this.fieldsValidationMessages[RoomNumberValueKey];
}

extension Methods on FormViewModel {
  setFullNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FullNameValueKey] = validationMessage;
  setAgeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AgeValueKey] = validationMessage;
  setGenderValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[GenderValueKey] = validationMessage;
  setRoomNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[RoomNumberValueKey] = validationMessage;
}
