// ignore_for_file: must_be_immutable

part of 'newest_book_cubit.dart';

sealed class NewestBookState extends Equatable {
  const NewestBookState();

  @override
  List<Object> get props => [];
}

final class NewestBookInitial extends NewestBookState {}

final class NewestBookLoadingState extends NewestBookState {}

final class NewsetBookSuccessState extends NewestBookState {
  final List <BookModel> books;
  const NewsetBookSuccessState(this.books);
}

final class NewsetBookFailureState extends NewestBookState {
  String errorMessage;
  NewsetBookFailureState(this.errorMessage);
}
