// ignore_for_file: unnecessary_this, prefer_collection_literals, camel_case_types

class Initial_Setting_Model {
  String? appName;
  String? defaultTheme;
  LightTheme? lightTheme;
  LightTheme? darkTheme;
  String? googleMapKey;
  String? appLanguage;
  String? appVersion;
  String? enableVersion;
  String? fontFamily;

  Initial_Setting_Model(
      {this.appName,
      this.defaultTheme,
      this.lightTheme,
      this.darkTheme,
      this.googleMapKey,
      this.appLanguage,
      this.appVersion,
      this.enableVersion,
      this.fontFamily});

  Initial_Setting_Model.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    defaultTheme = json['default_theme'];
    lightTheme = json['light_theme'] != null
        ? LightTheme.fromJson(json['light_theme'])
        : null;
    darkTheme = json['dark_theme'] != null
        ? LightTheme.fromJson(json['dark_theme'])
        : null;
    googleMapKey = json['google_map_key'];
    appLanguage = json['app_language'];
    appVersion = json['app_version'];
    enableVersion = json['enable_version'];
    fontFamily = json['font_family'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['app_name'] = this.appName;
    data['default_theme'] = this.defaultTheme;
    if (this.lightTheme != null) {
      data['light_theme'] = this.lightTheme!.toJson();
    }
    if (this.darkTheme != null) {
      data['dark_theme'] = this.darkTheme!.toJson();
    }
    data['google_map_key'] = this.googleMapKey;
    data['app_language'] = this.appLanguage;
    data['app_version'] = this.appVersion;
    data['enable_version'] = this.enableVersion;
    data['font_family'] = this.fontFamily;
    return data;
  }
}

class LightTheme {
  String? primaryColor;
  String? primaryDarkColor;
  String? accentColor;
  String? accentDarkColor;
  String? scaffoldColor;
  String? textColor;
  String? liteGrayColor;

  LightTheme(
      {this.primaryColor,
      this.primaryDarkColor,
      this.accentColor,
      this.accentDarkColor,
      this.scaffoldColor,
      this.textColor,
      this.liteGrayColor});

  LightTheme.fromJson(Map<String, dynamic> json) {
    primaryColor = json['primary_color'];
    primaryDarkColor = json['primary_dark_color'];
    accentColor = json['accent_color'];
    accentDarkColor = json['accent_dark_color'];
    scaffoldColor = json['scaffold_color'];
    textColor = json['text_color'];
    liteGrayColor = json['lite_gray_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['primary_color'] = this.primaryColor;
    data['primary_dark_color'] = this.primaryDarkColor;
    data['accent_color'] = this.accentColor;
    data['accent_dark_color'] = this.accentDarkColor;
    data['scaffold_color'] = this.scaffoldColor;
    data['text_color'] = this.textColor;
    data['lite_gray_color'] = this.liteGrayColor;
    return data;
  }
}