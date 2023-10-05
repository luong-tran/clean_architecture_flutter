import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../domain/entities/article_entity.dart';
import '../../bloc/article/remote/remote_article_bloc.dart';
import '../../widgets/article_title.dart';

class DailyNews extends StatefulWidget {
  const DailyNews({Key? key}) : super(key: key);

  @override
  State<DailyNews> createState() => _DailyNewsState();
}

class _DailyNewsState extends State<DailyNews> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
        create: (context) => sl()..add(const GetArticleEvent()),
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(),
        ));
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticleLoading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }
      if (state is RemoteArticleError) {
        return const Center(child: Icon(Icons.refresh));
      }
      if (state is RemoteArticleDone) {
        return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (_, index) {
              return ArticleWidget(
                  article: state.articles![index],
                  onArticlePressed: (article) =>
                      _onArticlePressed(context, article));
            });
      }
      return const SizedBox();
    });
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
