part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<AuthorModel> author;
  HomePageLoaded(this.author);
}

class HomePageError extends HomePageState {}

class NoDataState extends HomePageState {}

class DetailedView extends HomePageState {
  final List<AuthorModel> author;
  final int index;
  DetailedView(this.author, this.index);
}
