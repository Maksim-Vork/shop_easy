abstract class CategoryEvent {}

class CategorySearchBySlug extends CategoryEvent {
  final String slug;

  CategorySearchBySlug({required this.slug});
}
