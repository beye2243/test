

import '../models/pretstion_de_service.dart';

abstract class BasePrestationRepository{
  Stream<List<PerstationDeService>> getAllPersonnes();
}