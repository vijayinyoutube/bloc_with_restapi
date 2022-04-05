part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class LoadData extends HomePageEvent {}

class FavData extends HomePageEvent {
  final int id;
  final bool isFav;

  FavData(this.id, this.isFav);
}

class DeleteData extends HomePageEvent {
  final int index;

  DeleteData(this.index);
}

class ShowDetailedView extends HomePageEvent {
   final int index;

  ShowDetailedView(this.index);
}
