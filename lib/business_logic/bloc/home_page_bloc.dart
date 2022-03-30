import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageEvent>((event, emit) async {
      if (event is LoadData) {
        emit(HomePageLoading());
        await Future.delayed(const Duration(seconds: 4), () {
          emit(HomePageLoaded());
        });
      }
    });
  }
}
