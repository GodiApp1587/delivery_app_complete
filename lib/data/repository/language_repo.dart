import 'package:flutter/material.dart';

import '../../util/app_constants.dart';
import '../model/response/language_model.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages({required BuildContext context}) {
    return AppConstants.languages;
  }
}
