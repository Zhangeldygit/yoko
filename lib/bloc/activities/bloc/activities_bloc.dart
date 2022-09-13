import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoko/api/activities_api.dart';
import 'package:yoko/models/activities.dart';

part 'activities_event.dart';
part 'activities_state.dart';

class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
  ActivitiesBloc() : super(ActivitiesInitial()) {
    on<ActivitiesEvent>((event, emit) async {
      emit(ActivitiesLoading());

      final result = await api.fetchActivities();
      print(result);
      if (result == null) {
        emit(ActivitiesError('Error'));
      } else {
        print(result);
        emit(ActivitiesSuccess(result.data!));
      }
    });
  }

  final ActivitiesApi api = ActivitiesApi();
}
