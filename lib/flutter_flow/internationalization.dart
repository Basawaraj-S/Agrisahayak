import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'kn'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? knText = '',
  }) =>
      [enText, knText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Signup_page
  {
    'xgjcruvv': {
      'en': 'Agri Sahayak',
      'kn': 'ಕೃಷಿ ಸಹಾಯಕ್',
    },
    'ammmo8y8': {
      'en': 'Get Started',
      'kn': 'ಪ್ರಾರಂಭಿಸಲು ಒತ್ತಿ',
    },
    '5nw5yl2a': {
      'en': 'Let\'s get started by filling out the form below.',
      'kn': 'ಕೆಳಗಿನ ಫಾರ್ಮ್ ಅನ್ನು ಭರ್ತಿ ಮಾಡುವ ಮೂಲಕ ಪ್ರಾರಂಭಿಸೋಣ.',
    },
    'udsoexpo': {
      'en': 'Email',
      'kn': 'ಇಮೇಲ್',
    },
    'd3cd9pyx': {
      'en': 'Password',
      'kn': 'ಪಾಸ್ವರ್ಡ್',
    },
    'k72dfrkq': {
      'en': 'Create Account',
      'kn': 'ಖಾತೆ ರಚಿಸಿ',
    },
    'gx1kewas': {
      'en': 'Don\'t have an account?  ',
      'kn': 'ಖಾತೆ ಇಲ್ಲವೇ?',
    },
    '8j8gs3sf': {
      'en': 'Sign Up here',
      'kn': 'ಇಲ್ಲಿ ಸೈನ್ ಅಪ್ ಮಾಡಿ',
    },
    '0b3b95n0': {
      'en': 'Home',
      'kn': 'ಮರಳಿ ಪ್ರಥಮ ಪುಟಕ್ಕೆ',
    },
  },
  // Homepage
  {
    'u13nfafp': {
      'en': 'Good Morning , Vachan ',
      'kn': 'ಶುಭೋದಯ, ವಚನ್.',
    },
    '6dktk00k': {
      'en': 'kalaburagi , Karnataka ',
      'kn': 'ಕಲಬುರಗಿ, ಕರ್ನಾಟಕ',
    },
    'jen8vtzr': {
      'en': 'Today\'s Weather',
      'kn': 'ಇಂದಿನ ಹವಾಮಾನ',
    },
    'bdbqr6wa': {
      'en': 'Sunny, 28°C',
      'kn': 'ಬಿಸಿಲು, 28°C',
    },
    '6s0iftes': {
      'en': '10%',
      'kn': '10%',
    },
    'sbv8uptw': {
      'en': 'Rain',
      'kn': 'ಮಳೆ',
    },
    'buo4rswh': {
      'en': 'Wind',
      'kn': 'ಗಾಳಿ',
    },
    'qoc70ep3': {
      'en': 'Humidity',
      'kn': 'ಆರ್ದ್ರತೆ',
    },
    'zle1zvsv': {
      'en': '16 m/s',
      'kn': '16 ಮೀ/ಸೆ',
    },
    '2xp8somx': {
      'en': '44%',
      'kn': '44%',
    },
    '0jk35u6q': {
      'en': 'Tom',
      'kn': 'ಟಾಮ್',
    },
    '0jr7jxig': {
      'en': 'Thu',
      'kn': 'ಗುರು',
    },
    'sum0n6pc': {
      'en': 'Fri',
      'kn': 'ಶುಕ್ರ',
    },
    'xqnimefs': {
      'en': 'Sat',
      'kn': 'ಶನಿ',
    },
    's6gfc4on': {
      'en': '3 Acr',
      'kn': '3 ಎಕರೆ',
    },
    'poxu5f60': {
      'en': '3,564/kg',
      'kn': '3,564/ಕೆಜಿ',
    },
    '8etmx57z': {
      'en': '^',
      'kn': '^',
    },
    'lvfgiqhb': {
      'en': 'Filed 1',
      'kn': 'ಸಲ್ಲಿಸಿದ 1',
    },
    'gv8fxsbq': {
      'en': 'Scan Plant',
      'kn': 'ಸ್ಕ್ಯಾನ್ ಪ್ಲಾಂಟ್',
    },
    'c8mnpzga': {
      'en': 'Near By\nShops',
      'kn': 'ಹತ್ತಿರದಲ್ಲಿರುವ ಅಂಗಡಿಗಳು',
    },
    'tx30tg3y': {
      'en': 'Near By\nstorage ',
      'kn': 'ಹತ್ತಿರದ \nಸಂಗ್ರಹಣೆ',
    },
    'sv9zlacf': {
      'en': 'Item price                                     25/10/2025',
      'kn': 'ಐಟಂ ಬೆಲೆ 25/10/2025',
    },
    'aq91d0va': {
      'en': 'Tomatoes',
      'kn': 'ಟೊಮ್ಯಾಟೋಸ್',
    },
    'g3mizs4q': {
      'en': '₹1,800/q',
      'kn': '₹1,800/ಕ್ವಾ',
    },
    'x4v6l9zn': {
      'en': 'Rice',
      'kn': 'ಭತ್ತ',
    },
    '7dw4mpc6': {
      'en': 'Wheat',
      'kn': 'ಗೋಧಿ',
    },
    'lg1c9dc2': {
      'en': '₹2,450/q',
      'kn': '₹2,450/ಕ್ವಾ',
    },
    'qt94ept3': {
      'en': '₹3,200/q',
      'kn': '₹3,200/ಕ್ವಾಟರ್',
    },
    'hq0u4o8i': {
      'en': 'Home',
      'kn': 'ಮರಳಿ ಪ್ರಥಮ ಪುಟಕ್ಕೆ',
    },
  },
  // field
  {
    'hgzzer3z': {
      'en': 'My Field ',
      'kn': 'ನನ್ನ ಕ್ಷೇತ್ರ',
    },
    'bjpvgox9': {
      'en': 'Home',
      'kn': 'ಮರಳಿ ಪ್ರಥಮ ಪುಟಕ್ಕೆ',
    },
  },
  // storagefinder
  {
    '1h369wz6': {
      'en': 'Storage ',
      'kn': 'ಸಂಗ್ರಹಣೆ',
    },
    'z2g0yn37': {
      'en': 'Kalaburagi',
      'kn': 'ಕಲಬುರಗಿ',
    },
    '2lqz0wst': {
      'en': 'Dry Storage ',
      'kn': 'ಒಣ ಸಂಗ್ರಹಣೆ',
    },
    'csyla6mc': {
      'en': 'Cold Storage ',
      'kn': 'ಕೋಲ್ಡ್ ಸ್ಟೋರೇಜ್',
    },
    'viut84k8': {
      'en': 'All Storage',
      'kn': 'ಎಲ್ಲಾ ಸಂಗ್ರಹಣೆ',
    },
    '9vsx2gvy': {
      'en': 'Orange Cold Store',
      'kn': 'ಆರೆಂಜ್ ಕೋಲ್ಡ್ ಸ್ಟೋರ್',
    },
    'b6rqtz0g': {
      'en': 'More..',
      'kn': 'ಇನ್ನಷ್ಟು..',
    },
    '0y7ps59s': {
      'en': '2.3 km away',
      'kn': '2.3 ಕಿ.ಮೀ ದೂರ',
    },
    'jd95jbal': {
      'en': '4.5 ( 128 reviwes)',
      'kn': '4.5 ( 128 ವಿಮರ್ಶೆಗಳು)',
    },
    'scjz7or9': {
      'en': 'Vacant',
      'kn': 'ಖಾಲಿ',
    },
    '6yf8710n': {
      'en': 'Call',
      'kn': 'ಕರೆ ಮಾಡಿ',
    },
    'ksjhbcb7': {
      'en': 'Chat',
      'kn': 'ಚಾಟ್ ಮಾಡಿ',
    },
    'crsrxu0w': {
      'en': 'Al Taj',
      'kn': 'ಅಲ್ ತಾಜ್',
    },
    'adgz8zxs': {
      'en': 'More..',
      'kn': 'ಇನ್ನಷ್ಟು..',
    },
    'rrzn49ty': {
      'en': '4 km away',
      'kn': '4 ಕಿ.ಮೀ ದೂರ',
    },
    'jzphg6ou': {
      'en': '4.2 (102 reviwes)',
      'kn': '4.2 (102 ವಿಮರ್ಶೆಗಳು)',
    },
    '39vnewrz': {
      'en': 'Vacant',
      'kn': 'ಖಾಲಿ',
    },
    'tdvpti3j': {
      'en': 'Call',
      'kn': 'ಕರೆ ಮಾಡಿ',
    },
    'e940ts5r': {
      'en': 'Chat',
      'kn': 'ಚಾಟ್ ಮಾಡಿ',
    },
    '03f3zx8p': {
      'en': 'Mahalaxmi shop\n\n',
      'kn': 'ಮಹಾಲಕ್ಷ್ಮಿ ಅಂಗಡಿ',
    },
    'nmz8vagl': {
      'en': 'More..\n',
      'kn': 'ಇನ್ನಷ್ಟು..',
    },
    'jr5suxao': {
      'en': '4 km away\n',
      'kn': '4 ಕಿ.ಮೀ ದೂರ',
    },
    'x7r6ib6n': {
      'en': '3.8 ( 158 reviwes)\n',
      'kn': '3.8 ( 158 ವಿಮರ್ಶೆಗಳು)',
    },
    'p87762x1': {
      'en': 'full',
      'kn': 'ಪೂರ್ಣ',
    },
    '9weh6g1i': {
      'en': 'Call',
      'kn': 'ಕರೆ ಮಾಡಿ',
    },
    'gx01i5xy': {
      'en': 'Chat',
      'kn': 'ಚಾಟ್ ಮಾಡಿ',
    },
    '39g4znxa': {
      'en': 'Home',
      'kn': 'ಮರಳಿ ಪ್ರಥಮ ಪುಟಕ್ಕೆ',
    },
  },
  // nearbyshops
  {
    'iegj37li': {
      'en': 'Shopes',
      'kn': 'ಅಂಗಡಿಗಳು',
    },
    'pmmlicm6': {
      'en': 'Seeds',
      'kn': 'ಬೀಜಗಳು',
    },
    '0a8t3618': {
      'en': 'Fertilizer',
      'kn': 'ಗೊಬ್ಬರ',
    },
    'i3lobrek': {
      'en': 'Pesticides',
      'kn': 'ಕೀಟನಾಶಕಗಳು',
    },
    's9a4xh7l': {
      'en': 'Tools',
      'kn': 'ಪರಿಕರಗಳು',
    },
    'zqoay14d': {
      'en': 'Irrigation',
      'kn': 'ನೀರಾವರಿ',
    },
    'lrcgs3ev': {
      'en': 'organic',
      'kn': 'ಸಾವಯವ',
    },
    '4nk8s04l': {
      'en': 'Nearest',
      'kn': 'ಹತ್ತಿರದ',
    },
    'ruucxnhv': {
      'en': 'Best Price',
      'kn': 'ಅತ್ಯುತ್ತಮ ಬೆಲೆ',
    },
    '2m8mjltk': {
      'en': 'Top Rated',
      'kn': 'ಅತ್ಯುತ್ತಮ ರೇಟಿಂಗ್',
    },
    'h6o8i0f1': {
      'en': 'Kalika Agro',
      'kn': 'ಆರೆಂಜ್ ಕೋಲ್ಡ್ ಸ್ಟೋರ್',
    },
    'v31yi7od': {
      'en': 'More..',
      'kn': 'ಇನ್ನಷ್ಟು..',
    },
    'nt3e7uwq': {
      'en': '2.3 km away',
      'kn': '2.3 ಕಿ.ಮೀ ದೂರ',
    },
    'qsxocmsg': {
      'en': '4.5 ( 128 reviwes)',
      'kn': '4.5 ( 128 ವಿಮರ್ಶೆಗಳು)',
    },
    'vqnlxrw8': {
      'en': 'Open',
      'kn': 'ಖಾಲಿ',
    },
    'jg720eh0': {
      'en': 'Call',
      'kn': 'ಕರೆ ಮಾಡಿ',
    },
    '0nexbgzw': {
      'en': 'Chat',
      'kn': 'ಚಾಟ್ ಮಾಡಿ',
    },
    'swzwdnjp': {
      'en': 'Sri Om Agri Mart',
      'kn': 'ಆರೆಂಜ್ ಕೋಲ್ಡ್ ಸ್ಟೋರ್',
    },
    'i81qnumx': {
      'en': 'More..',
      'kn': 'ಇನ್ನಷ್ಟು..',
    },
    'rtb1e603': {
      'en': '4 km away',
      'kn': '2.3 ಕಿ.ಮೀ ದೂರ',
    },
    'k9wj4nts': {
      'en': '4.2 (150 reviwes)',
      'kn': '4.5 ( 128 ವಿಮರ್ಶೆಗಳು)',
    },
    'obfi3fj1': {
      'en': 'Open',
      'kn': 'ಖಾಲಿ',
    },
    '40e2m539': {
      'en': 'Call',
      'kn': 'ಕರೆ ಮಾಡಿ',
    },
    '2plmwj0q': {
      'en': 'Chat',
      'kn': 'ಚಾಟ್ ಮಾಡಿ',
    },
    'sr3js2li': {
      'en': 'Vijaya Agro Trades',
      'kn': 'ಆರೆಂಜ್ ಕೋಲ್ಡ್ ಸ್ಟೋರ್',
    },
    'htq9uspp': {
      'en': 'More..',
      'kn': 'ಇನ್ನಷ್ಟು..',
    },
    '71vi1383': {
      'en': '3.2 km away',
      'kn': '2.3 ಕಿ.ಮೀ ದೂರ',
    },
    '71mfc7ej': {
      'en': '3.8 (156 reviwes)',
      'kn': '4.5 ( 128 ವಿಮರ್ಶೆಗಳು)',
    },
    '5yd7gd6e': {
      'en': 'Close',
      'kn': 'ಖಾಲಿ',
    },
    'fmchawqa': {
      'en': 'Call',
      'kn': 'ಕರೆ ಮಾಡಿ',
    },
    'al4rhi54': {
      'en': 'Chat',
      'kn': 'ಚಾಟ್ ಮಾಡಿ',
    },
    'sjtens5e': {
      'en': 'Home',
      'kn': 'ಮರಳಿ ಪ್ರಥಮ ಪುಟಕ್ಕೆ',
    },
  },
  // phonenumber
  {
    'xogu2c6y': {
      'en': 'Agri Sahayak',
      'kn': 'ಕೃಷಿ ಸಹಾಯಕ್',
    },
    'cv0seljh': {
      'en': 'Log in through your phone number',
      'kn': 'ನಿಮ್ಮ ಫೋನ್ ಸಂಖ್ಯೆಯ ಮೂಲಕ ಲಾಗಿನ್ ಮಾಡಿ',
    },
    'fu6oxqy4': {
      'en': 'Country',
      'kn': 'ಪೂರ್ಣ ಹೆಸರು',
    },
    'h0hbtnym': {
      'en': 'India ',
      'kn': 'ಭಾರತ',
    },
    'amimmgxp': {
      'en': 'Phone Number',
      'kn': 'ದೂರವಾಣಿ ಸಂಖ್ಯೆ',
    },
    'ssrmh561': {
      'en': '+91',
      'kn': '',
    },
    'vfgfiyde': {
      'en': 'Enter your phone number',
      'kn': 'ನಿಮ್ಮ ಫೋನ್ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ',
    },
    'czmzlu41': {
      'en': 'Option 1',
      'kn': '',
    },
    'b399y7lu': {
      'en':
          'We\'ll send a one-time password to verify your phone number. Standard message rates may apply.',
      'kn':
          'ನಿಮ್ಮ ಫೋನ್ ಸಂಖ್ಯೆಯನ್ನು ಪರಿಶೀಲಿಸಲು ನಾವು ಒಂದು ಬಾರಿಯ ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ಕಳುಹಿಸುತ್ತೇವೆ. ಪ್ರಮಾಣಿತ ಸಂದೇಶ ದರಗಳು ಅನ್ವಯಿಸಬಹುದು.',
    },
    '1wvpxuuq': {
      'en': 'Get OTP',
      'kn': 'ಒಟಿಪಿ ಪಡೆಯಿರಿ',
    },
    'muthfihq': {
      'en':
          'By continuing, you agree to our Terms of Service and Privacy Policy',
      'kn':
          'ಮುಂದುವರಿಯುವ ಮೂಲಕ, ನೀವು ನಮ್ಮ ಸೇವಾ ನಿಯಮಗಳು ಮತ್ತು ಗೌಪ್ಯತಾ ನೀತಿಗೆ ಸಮ್ಮತಿಸುತ್ತೀರಿ.',
    },
  },
  // otp
  {
    '1g2oyh4g': {
      'en': 'Verify Your Number',
      'kn': '',
    },
    'wqpd8x8s': {
      'en':
          'Enter the OTP sent to your phone number. If you haven\'t received it, wait a few seconds or tap \'Resend OTP\'.',
      'kn': '',
    },
    'l9nf0o1d': {
      'en': 'Enter OTP',
      'kn': '',
    },
    'tmpdp8w8': {
      'en': 'Didn\'t receive the code?',
      'kn': '',
    },
    'ujfq8avk': {
      'en': 'Resend OTP',
      'kn': '',
    },
    'rkgkqp8s': {
      'en': ' in ',
      'kn': '',
    },
    '69fx7gg0': {
      'en': 'Verify & Continue',
      'kn': '',
    },
  },
  // storagefind
  {
    'kpb5wy1i': {
      'en': 'Page Title',
      'kn': '',
    },
    'kg7i4hzs': {
      'en': 'Home',
      'kn': 'ಮರಳಿ ಪ್ರಥಮ ಪುಟಕ್ಕೆ',
    },
  },
  // Home2
  {
    'o5qo0mc2': {
      'en': 'Good Morning , vachan',
      'kn': '',
    },
    'gn0y458h': {
      'en': 'Kalburagi , Karnataka',
      'kn': '',
    },
    '998cif16': {
      'en': 'Home',
      'kn': 'ಮರಳಿ ಪ್ರಥಮ ಪುಟಕ್ಕೆ',
    },
  },
  // searchbar
  {
    'va4kcku2': {
      'en': 'TextField',
      'kn': '',
    },
  },
  // Miscellaneous
  {
    '5ugk5w6o': {
      'en': '',
      'kn': '',
    },
    'omgni2qh': {
      'en': '',
      'kn': '',
    },
    'ozoen61v': {
      'en': '',
      'kn': '',
    },
    'zvf76pqh': {
      'en': '',
      'kn': '',
    },
    'vy8kzttv': {
      'en': '',
      'kn': '',
    },
    'j2but46i': {
      'en': '',
      'kn': '',
    },
    '5lgayiod': {
      'en': '',
      'kn': '',
    },
    'xv1jhwqx': {
      'en': '',
      'kn': '',
    },
    '7cueupim': {
      'en': '',
      'kn': '',
    },
    'hkhun7fc': {
      'en': '',
      'kn': '',
    },
    'fm8929jm': {
      'en': '',
      'kn': '',
    },
    'wr075hw9': {
      'en': '',
      'kn': '',
    },
    'xshuwbsn': {
      'en': '',
      'kn': '',
    },
    '6jg5zukm': {
      'en': '',
      'kn': '',
    },
    'vd5ryi2p': {
      'en': '',
      'kn': '',
    },
    'v2yv86h0': {
      'en': '',
      'kn': '',
    },
    'zkv70rry': {
      'en': '',
      'kn': '',
    },
    'gtkji3v3': {
      'en': '',
      'kn': '',
    },
    'izt6wz75': {
      'en': '',
      'kn': '',
    },
    'c9asfg6f': {
      'en': '',
      'kn': '',
    },
    'xy6ivubg': {
      'en': '',
      'kn': '',
    },
    'jhgoqps3': {
      'en': '',
      'kn': '',
    },
    'm22o91gi': {
      'en': '',
      'kn': '',
    },
    'p4aoxy4o': {
      'en': '',
      'kn': '',
    },
    'boex9yib': {
      'en': '',
      'kn': '',
    },
  },
].reduce((a, b) => a..addAll(b));
