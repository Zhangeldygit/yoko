part of 'activities_bloc.dart';

abstract class ActivitiesState {}

class ActivitiesInitial extends ActivitiesState {}

class ActivitiesLoading extends ActivitiesState {}

class ActivitiesSuccess extends ActivitiesState {
  final List<Activities> data;

  ActivitiesSuccess(this.data);
}

class ActivitiesError extends ActivitiesState {
  final String error;

  ActivitiesError(this.error);
}
