part of 'remote_article_bloc.dart';

abstract class RemoteArticleEvent extends Equatable {
  const RemoteArticleEvent();

  @override
  List<Object> get props => [];
}

class GetArticleEvent extends RemoteArticleEvent {
  const GetArticleEvent();
}
