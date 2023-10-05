import '../../../../core/usecases/usecase.dart';
import '../entities/article_entity.dart';
import '../repository/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    // TODO: implement call
    return _articleRepository.removeArticle(params!);
  }
}
