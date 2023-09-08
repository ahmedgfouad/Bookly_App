// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homerepo) : super(SimilarBooksInitial());

  final Homerepo homerepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoadingState()); 
    var result = await homerepo.fetchSimilarBooks(category: category);
    result.fold(
      (failure) {
        emit(
          SimilarBooksFailureState(failure.errorMessage),
        );
      },
      (books) {
        emit(
          SimilarBooksSuccessState(books),
        );
      },
    );
  }
}
