part of 'details_page_bloc.dart';

@immutable
abstract class DetailsPageState {}

class DetailsPageInitial extends DetailsPageState {}

class DetailsPageLoading extends DetailsPageState {}

class DetailsPageLoaded extends DetailsPageState {}

class DetailsPageError extends DetailsPageState {}
