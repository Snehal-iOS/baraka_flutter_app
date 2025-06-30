// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get portfolioTitle => 'محفظتي';

  @override
  String get switchLanguage => 'تبديل اللغة';

  @override
  String get welcomeMessage => 'مرحبًا بك في محفظتك!';

  @override
  String get qty => 'الكمية';

  @override
  String get avg => 'المتوسط';

  @override
  String get marketValue => 'القيمة السوقية';

  @override
  String get ltp => 'السعر الحالي';

  @override
  String get netValue => 'القيمة الصافية';

  @override
  String get pnl => 'الأرباح والخسائر';

  @override
  String get invested => 'المستثمر';

  @override
  String get totalValue => 'القيمة الإجمالية';

  @override
  String get yourHoldings => 'حيازاتك';

  @override
  String get selectedLocale => 'EN';

  @override
  String get usd => 'دولار أمريكي';
}
