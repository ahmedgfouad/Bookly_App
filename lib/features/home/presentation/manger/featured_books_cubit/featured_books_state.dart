// ignore_for_file: must_be_immutable

part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitialState extends FeaturedBooksState {}

final class FeaturedBooksLoadingState extends FeaturedBooksState {}

final class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookModel> books;
  const FeaturedBooksSuccessState(this.books);
}

final class FeaturedBooksFailureState extends FeaturedBooksState {
  String errorMessage;
  FeaturedBooksFailureState(this.errorMessage);
}
