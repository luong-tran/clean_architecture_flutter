import '../../../../core/usecases/usecase.dart';
import '../entities/article_entity.dart';
import '../repository/article_repository.dart';

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    // TODO: implement call
    return _articleRepository.saveArticle(params!);
  }
}
