part of "configs.dart";

class GFont{
  static Text out({String title, double fontSize, FontWeight fontWeight, Color color}){
    return Text(
      title,
      style: GoogleFonts.nunito(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Palette.blackColor
      )
    );
  }

  static TextStyle style({double fontSize, FontWeight fontWeight, Color color, double height}){
    return GoogleFonts.nunito(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Palette.blackColor,
      height: height ?? 0
    );
  }
}