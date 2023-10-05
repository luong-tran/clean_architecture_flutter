import '../../../../core/usecases/usecase.dart';
import '../entities/article_entity.dart';
import '../repository/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({params}) {
    // TODO: implement call
    return _articleRepository.getSavedArticles();
  }
}
