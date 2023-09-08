// ignore_for_file: must_be_immutable

part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoadingState extends SimilarBooksState {}

final class SimilarBooksSuccessState extends SimilarBooksState {
  final List<BookModel> books;
  const SimilarBooksSuccessState(this.books);
}

final class SimilarBooksFailureState extends SimilarBooksState {
  String errorMessage;
  SimilarBooksFailureState(this.errorMessage);
}
