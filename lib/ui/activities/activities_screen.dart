import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoko/constants/app_styles.dart';
import 'package:yoko/ui/activities/single_activity.dart';

import '../../bloc/activities/bloc/activities_bloc.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Активности',
              style: AppStyles.appBarTitle.copyWith(color: Colors.black)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ActivitiesBloc, ActivitiesState>(
                builder: (context, state) {
                  if (state is ActivitiesLoading) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    );
                  }

                  if (state is ActivitiesSuccess) {
                    return ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        return SingleActivity(
                          activity: state.data[index],
                        );
                      },
                    );
                  }

                  if (state is ActivitiesError) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(state.error),
                        ),
                      ],
                    );
                  }
                  return const Offstage();
                },
              ),
            ),
          ],
        ));
  }
}
