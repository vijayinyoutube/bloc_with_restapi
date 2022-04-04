import 'package:bloc/bloc.dart';
import 'package:bloc_with_restapi/Data/Models/author_model.dart';
import 'package:bloc_with_restapi/Data/Repository/author_repo.dart';
import 'package:meta/meta.dart';

import '../../Data/SharedPref/onboard_page.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final AuthorRepo _authorRepo;
  late List<AuthorModel> author;

  HomePageBloc(this._authorRepo) : super(HomePageInitial()) {
    on<HomePageEvent>((event, emit) async {
      if (event is LoadData) {
        emit(HomePageLoading());
        await Future.delayed(const Duration(seconds: 2), () async {
          author = await _authorRepo.fetchAuthor();
          emit(HomePageLoaded(author));
        });
      } else if (event is FavData) {
        print("Inside bloc");
        await OnboardPref().saveisFav(event.id, event.isFav);
        
        emit(HomePageLoaded(author));
      }
    });
  }
}
