import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoko/constants/app_styles.dart';
import 'package:yoko/models/activities.dart';

import 'activity_details.dart';

class SingleActivity extends StatelessWidget {
  const SingleActivity({Key? key, required this.activity}) : super(key: key);

  final Activities activity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ActivityDetails(
                    activity: activity,
                  ))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: Image.network(
                activity.imageUrl!,
                colorBlendMode: BlendMode.softLight,
                fit: BoxFit.cover,
                height: 226.h,
                width: 343.w,
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      activity.nameRu,
                      style: AppStyles.imgTitle,
                    ),
                    Text(
                      "${activity.createdDate}",
                      style: AppStyles.imgTitle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
