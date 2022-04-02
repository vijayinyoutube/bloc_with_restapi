import 'package:bloc/bloc.dart';
import 'package:bloc_with_restapi/Data/Repository/author_repo.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final AuthorRepo _authorRepo;

  HomePageBloc(this._authorRepo) : super(HomePageInitial()) {
    on<HomePageEvent>((event, emit) async {
      if (event is LoadData) {
        emit(HomePageLoading());
        await Future.delayed(const Duration(seconds: 2), () async {
          final author = await _authorRepo.fetchAuthor();
          print("author $author");
          for (var i = 0; i < 10; i++) {
            print(author[i].id);
          }
          emit(HomePageLoaded());
        });
      }
    });
  }
}
