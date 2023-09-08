// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.homerepo) : super(NewestBookInitial());

  final Homerepo homerepo;

  Future<void> fetchNewsetBooks() async {
    emit(NewestBookLoadingState());

    var result = await homerepo.fetchNewsetBooks();
    result.fold(
      (failure) {
        emit(
          NewsetBookFailureState(failure.errorMessage),
        );
      },
      (books) {
        emit(
          NewsetBookSuccessState(books),
        );
      },
    );
  }
}
