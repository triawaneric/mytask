import 'package:flutter/material.dart';

enum Language {
  ID,
  EN,
}

extension LanguageExtension on Language {
  Locale get xGetLocale {
    switch (this) {
      case Language.ID:
        return Locale("id", "ID");

      case Language.EN:
        return Locale("en", "US");
    }
  }
}