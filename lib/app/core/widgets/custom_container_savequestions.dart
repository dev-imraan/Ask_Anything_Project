// ignore_for_file: depend_on_referenced_packages

import 'package:ask_anything_app/app/core/utils/app_colors.dart';
import 'package:ask_anything_app/app/core/utils/app_textstyles.dart';

import 'package:flutter/material.dart';

import '../utils/size_utils.dart';

// ignore: camel_case_types
class custom_container extends StatelessWidget {
  final String title;
  final String discription;
  final String date;
  final String time;
  final bool isResponseShow;
  final VoidCallback? ontap;
  final TextOverflow textOverflow;
  final int maxlines;
  const custom_container({
    Key? key,
    required this.date,
    this.discription = "",
    required this.time,
    required this.title,
    this.ontap,
    this.textOverflow = TextOverflow.ellipsis,
    this.maxlines = 3,
    this.isResponseShow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          width: getHorizontalSize(375),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getSize(12)),
                bottomLeft: Radius.circular(getSize(12)),
                bottomRight: Radius.circular(getSize(12))),
            boxShadow: const [
              BoxShadow(
                  color: AppColors.shadowColor,
                  offset: Offset(0, 6),
                  blurRadius: 15,
                  spreadRadius: 0)
            ],
          ),
          child: Padding(
              padding: getPadding(
                top: getVerticalSize(11),
                left: getHorizontalSize(16),
                right: getHorizontalSize(16),
                bottom: getVerticalSize(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyles.miniMediumText.copyWith(
                          fontSize: getFontSize(16),
                          color: AppColors.primaryColor)),
                  SizedBox(
                    height: getVerticalSize(11),
                  ),
                  isResponseShow
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: getHorizontalSize(375),
                              height: getVerticalSize(1),
                              decoration: BoxDecoration(
                                color: AppColors.liteGrayColor,
                              ),
                            ),
                            SizedBox(
                              height: getVerticalSize(10),
                            ),
                            Text(discription,
                                overflow: textOverflow,
                                maxLines: maxlines,
                                textAlign: TextAlign.justify,
                                style: AppTextStyles.miniMediumText.copyWith(
                                    fontSize: getFontSize(16),
                                    color: AppColors.blackColor)),
                            SizedBox(
                              height: getVerticalSize(10),
                            ),
                          ],
                        )
                      : const  SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("$date  |  ",
                          style: AppTextStyles.miniSmallText
                              .copyWith(color: AppColors.accentColor)),
                      Text(time,
                          style: AppTextStyles.miniSmallText
                              .copyWith(color: AppColors.accentColor))
                    ],
                  ),
                ],
              ))),
    );
  }
}
