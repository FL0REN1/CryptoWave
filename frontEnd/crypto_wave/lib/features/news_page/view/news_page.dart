import 'dart:async';

import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:crypto_wave/features/news_page/bloc/bloc.dart';
import 'package:crypto_wave/repositories/news_repository/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final _newsBloc = NewsBloc(GetIt.I<AbstractNewsRepository>());

  @override
  void initState() {
    _newsBloc.add(const LoadNews(completer: null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _newsBloc.add(LoadNews(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<NewsBloc, NewsState>(
              bloc: _newsBloc,
              builder: (context, state) {
                if (state is NewsLoaded) {}

                if (state is NewsLoadingFailure) {
                  return LoadingFailure(
                    restart: () => _newsBloc.add(
                      const LoadNews(completer: null),
                    ),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
