import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/entities/article_entity.dart';
import '../../../../domain/usecases/get_article.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticleEvent>(_onGetArticles);
  }

  void _onGetArticles(
      GetArticleEvent event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
