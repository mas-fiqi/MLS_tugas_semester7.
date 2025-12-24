import 'package:flutter/material.dart';

enum AppLanguage {
  indonesian,
  english,
}

class LanguageService {
  // Singleton pattern
  static final LanguageService _instance = LanguageService._internal();
  static LanguageService get instance => _instance;

  LanguageService._internal();

  final ValueNotifier<AppLanguage> languageNotifier = ValueNotifier(AppLanguage.indonesian);

  AppLanguage get currentLanguage => languageNotifier.value;

  void switchLanguage(AppLanguage language) {
    languageNotifier.value = language;
  }

  // Simple dictionary for translations
  final Map<String, Map<AppLanguage, String>> _localizedStrings = {
    'dashboard': {
      AppLanguage.indonesian: 'Papan Informasi',
      AppLanguage.english: 'Dashboard',
    },
    'welcome': {
      AppLanguage.indonesian: 'Selamat Datang,',
      AppLanguage.english: 'Welcome,',
    },
    'student': {
      AppLanguage.indonesian: 'Mahasiswa',
      AppLanguage.english: 'Student',
    },
    'priority_task': {
      AppLanguage.indonesian: 'Tugas Prioritas',
      AppLanguage.english: 'Priority Tasks',
    },
    'class_progress': {
      AppLanguage.indonesian: 'Progres Kelas',
      AppLanguage.english: 'Class Progress',
    },
    'see_all': {
      AppLanguage.indonesian: 'Lihat Semua',
      AppLanguage.english: 'See All',
    },
    'tomorrow': {
      AppLanguage.indonesian: 'Besok',
      AppLanguage.english: 'Tomorrow',
    },
    'detail': {
      AppLanguage.indonesian: 'Detail',
      AppLanguage.english: 'Detail',
    },
    'ui_design': {
      AppLanguage.indonesian: 'Desain Antarmuka Pengguna',
      AppLanguage.english: 'User Interface Design',
    },
    'change_language': {
      AppLanguage.indonesian: 'Ubah Bahasa',
      AppLanguage.english: 'Change Language',
    },
     'cancel': {
      AppLanguage.indonesian: 'Batal',
      AppLanguage.english: 'Cancel',
    },
  };

  String getString(String key) {
    return _localizedStrings[key]?[currentLanguage] ?? key;
  }
}
