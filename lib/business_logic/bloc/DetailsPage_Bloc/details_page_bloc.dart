import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Data/Models/author_model.dart';
import '../../../Data/Repository/author_repo.dart';

part 'details_page_event.dart';
part 'details_page_state.dart';

class DetailsPageBloc extends Bloc<DetailsPageEvent, DetailsPageState> {

   final AuthorRepo _authorRepo;
  late List<AuthorModel> author;

  
  DetailsPageBloc(this._authorRepo) : super(DetailsPageInitial()) {
    on<DetailsPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
