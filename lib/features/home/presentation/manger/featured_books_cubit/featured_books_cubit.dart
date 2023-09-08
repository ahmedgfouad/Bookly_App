// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homerepo) : super(FeaturedBooksInitialState());

  final Homerepo homerepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());

    var result = await homerepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(
          FeaturedBooksFailureState(failure.errorMessage),
        );
      },
      (books) {
        emit(
          FeaturedBooksSuccessState(books),
        );
      },
    );
  }
}
