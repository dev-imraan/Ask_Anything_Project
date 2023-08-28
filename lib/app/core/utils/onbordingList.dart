


// ignore_for_file: file_names

import 'package:ask_anything_app/app/core/assets/app_images.dart';

class OnbordingList {
  String title;
  String discription;
  String img;

  OnbordingList(
      {required this.discription, required this.img, required this.title});
}

List<OnbordingList> onbordingslider = [
  OnbordingList(
    discription:
        "All doctor’s care for their patients, so for those that are uninsured or under insured many doctor’s will recommend our card to save people on prescriptions.",
    img: AppImages.slider1,
    title: "Uninsured Individuals",
  ),
  OnbordingList(
    discription:
        "All doctor’s care for their patients, so for those that are uninsured or under insured many doctor’s will recommend our card to save people on prescriptions.",
    img:AppImages.slider2,
    title: "Uninsured Individuals",
  ),
  OnbordingList(
    discription:
        "All doctor’s care for their patients, so for those that are uninsured or under insured many doctor’s will recommend our card to save people on prescriptions.",
    img:AppImages.slider3,
    title: "Uninsured Individuals",
  ),
];
