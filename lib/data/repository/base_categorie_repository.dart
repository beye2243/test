import 'package:test/data/models/catagorie.dart';

abstract class BaseCategoryRepository{
  Stream<List<Category>> getAllCategories();
}