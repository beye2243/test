import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test/data/models/catagorie.dart';

import '../../../data/models/characters.dart';
import '../../../data/models/quote.dart';
import '../../../data/repository/catagorie_repository.dart';
import '../../../data/repository/characters_repository.dart';



part 'categories_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;
  List<Category> category = [];

  CategoryCubit(this.categoryRepository) : super(CategoryInitial());

  List<Category> getAllCategories() {
    categoryRepository.getAllCategories().listen((category) {
      emit(CategoryLoaded(category));
      this.category = category;
    });

    return category;
  }

  // void getQuotes(String charName) {
  //   charactersRepository.getCharacterQuotes(charName).then((quotes) {
  //     emit(QuotesLoaded(quotes));
  //   });
  // }
}
