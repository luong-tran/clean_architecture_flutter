import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/daily_news/data/data_sources/local/app_database.dart';
import 'features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'features/daily_news/data/repository/article_repository_impl.dart';
import 'features/daily_news/domain/repository/article_repository.dart';
import 'features/daily_news/domain/usecases/get_article.dart';
import 'features/daily_news/domain/usecases/get_saved_article.dart';
import 'features/daily_news/domain/usecases/remove_article.dart';
import 'features/daily_news/domain/usecases/save_article.dart';
import 'features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  /*<------ DATABASE LOCAL ------>*/
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  /*<------ CLOSE DATABASE LOCAL ------>*/

  /*<------ DIO ------>*/
  sl.registerSingleton<Dio>(Dio());
  /*<------ CLOSE DIO ------>*/

  /*<------ DEPENDENCIES ------>*/
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));
  //------ CLOSE DEPENDENCIES ------//

  /*<------ USECASES ------>*/
  // Remote
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // Local
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));
  //------ CLOSE USECASES ------//

  /*<------ BLOCS ------>*/
  // Remote
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));

  // Local
  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl()));
  /*<------ CLOSE BLOCS ------>*/
}
