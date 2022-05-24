part of 'categories_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}


class CategoryLoaded extends CategoryState {
  final List<Category> category;

  CategoryLoaded(this.category);
}

// class QuotesLoaded extends CharactersState {
//   final List<Quote> quotes;
//
//   QuotesLoaded(this.quotes);
// }


