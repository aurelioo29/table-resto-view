part of 'appsetting_cubit.dart';

@immutable
sealed class AppsettingState {}

final class AppsettingInitial extends AppsettingState {}

final class AppsettingAuthenticated extends AppsettingState {}

final class AppsettingUnAuthenticated extends AppsettingState {}
