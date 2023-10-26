import 'package:articles/page0.dart';
import 'package:articles/tosho_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontFamily: ToshoTypography.familyIntegralCF,
            fontWeight: FontWeight.w700,
            fontSize: 34,
            color: lightToshoColors.oxfordBlue,
            height: 1.21,
            letterSpacing: 0.37,
          ),
          // displayMedium: ,
          titleLarge: TextStyle(
            fontFamily: ToshoTypography.familyIntegralCF,
            fontWeight: FontWeight.w700,
            fontSize: 28,
            color: lightToshoColors.oxfordBlue,
            height: 1.21,
            letterSpacing: 0.37,
          ),
          titleMedium: TextStyle(
            fontFamily: ToshoTypography.familyIntegralCF,
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: lightToshoColors.oxfordBlue,
            height: 1.27,
            letterSpacing: 0.35,
          ),
          titleSmall: TextStyle(
            fontFamily: ToshoTypography.familyIntegralCF,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: lightToshoColors.oxfordBlue,
            height: 1.25,
            letterSpacing: 0.38,
          ),
          //title4
          displaySmall: TextStyle(
            fontFamily: ToshoTypography.familyIntegralCF,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: lightToshoColors.oxfordBlue,
            letterSpacing: 0.38,
          ),

          //Headline
          headlineLarge: GoogleFonts.montserrat(
            // fontFamily: ToshoTypography.familyMontserrat,
            fontWeight: FontWeight.w400,
            fontSize: 17,
            color: lightToshoColors.oxfordBlue,
            height: 1.29,
            letterSpacing: -0.4,
          ),

          //Body
          headlineMedium: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 17,
            color: lightToshoColors.oxfordBlue,
            height: 1.29,
            letterSpacing: -0.4,
          ),

          //Callout
          headlineSmall: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: lightToshoColors.oxfordBlue,
            height: 1.31,
            letterSpacing: -0.32,
          ),

          //Subheadline
          bodyLarge: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: lightToshoColors.oxfordBlue,
            height: 1.33,
            letterSpacing: -0.24,
          ),

          //Footnote
          bodyMedium: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: lightToshoColors.oxfordBlue,
            height: 1.38,
            letterSpacing: -0.08,
          ),

          //Caption1
          labelLarge: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: lightToshoColors.oxfordBlue,
            height: 1.33,
          ),

          //Caption2
          labelMedium: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 11,
            color: lightToshoColors.oxfordBlue,
            height: 1.18,
            letterSpacing: -0.066,
          ),
        ),
        useMaterial3: true,
      ),
      home: const Page0(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ToshoTypography {
  const ToshoTypography._();

//fonts
  static const String familyIntegralCF = 'IntegralCF';
  static const String familyMontserrat = 'Montserrat';
}
