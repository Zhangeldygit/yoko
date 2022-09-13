import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoko/constants/app_colors.dart';
import 'package:yoko/constants/app_styles.dart';
import 'package:yoko/models/activities.dart';

class ActivityDetails extends StatelessWidget {
  const ActivityDetails({Key? key, required this.activity}) : super(key: key);
  final Activities activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: Colors.transparent,
            pinned: true,
            expandedHeight: 200.h,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "${activity.nameEn}",
                style: const TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              expandedTitleScale: 2,
              background: Image.network(
                activity.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Дата посещения',
                    style: AppStyles.imgTitle
                        .copyWith(color: Colors.black, fontSize: 14),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Подзаголовок в одну строку',
                    style: AppStyles.appBarTitle
                        .copyWith(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFDADADA))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(
                          'Выберите дату',
                          style: AppStyles.signUp
                              .copyWith(fontSize: 16, color: Colors.black),
                        ),
                        horizontalTitleGap: 0,
                        leading: const Icon(
                          Icons.calendar_today,
                          color: AppColors.loginBg,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.loginBg,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.loginBg.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(
                          'Взрослый старше 23 лет',
                          style: AppStyles.imgTitle
                              .copyWith(fontSize: 16, color: Colors.black),
                        ),
                        horizontalTitleGap: 0,
                        subtitle: Text(
                            "${activity.tariffs?.first.priceInfo?.price?.toInt().toString()} ₸"),
                        trailing: const Icon(
                          Icons.add_circle_outline_sharp,
                          color: AppColors.loginBg,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 48.h,
                    decoration: BoxDecoration(
                        color: AppColors.loginBg,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Перейти к оплате',
                        style: AppStyles.imgTitle.copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Divider(
                    thickness: 1,
                  ),
                  ListTile(
                    title: Text(
                      'Правила поведения в сноу парке',
                      style: AppStyles.signUp
                          .copyWith(fontSize: 16, color: Colors.black),
                    ),
                    horizontalTitleGap: 0,
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.loginBg,
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  ListTile(
                    title: Text(
                      'Выберите дату',
                      style: AppStyles.imgTitle
                          .copyWith(fontSize: 16, color: AppColors.loginBg),
                    ),
                    horizontalTitleGap: 0,
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.loginBg,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
