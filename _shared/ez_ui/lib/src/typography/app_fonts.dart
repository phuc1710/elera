// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'app_font_type.dart';

class AppFonts {
  static final appFontData = {
    AppFontType.base: null,
    AppFontType.roboto: GoogleFonts.robotoTextTheme(),
    AppFontType.oswald: GoogleFonts.oswaldTextTheme(),
  };
}
