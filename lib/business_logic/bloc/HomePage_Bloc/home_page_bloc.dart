import 'package:bloc/bloc.dart';
import 'package:bloc_with_restapi/Data/Models/author_model.dart';
import 'package:bloc_with_restapi/Data/Repository/author_repo.dart';
import 'package:bloc_with_restapi/business_logic/bloc/HomePage_Bloc/home_page_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Data/SharedPref/onboard_page.dart';

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
        await OnboardPref().saveisFav(event.id, event.isFav);
        emit(HomePageLoaded(author));
      } else if (event is DeleteData) {
        author.removeAt(event.index);

        if (author.isNotEmpty) {
          emit(HomePageLoaded(author));
        } else {
          await clearSharedPref();
          emit(NoDataState());
        }
      } else if (event is ShowDetailedView) {
        emit(DetailedView(author, event.index));
      } else {
        emit(HomePageError());
      }
    });
  }

  clearSharedPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
