import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:crypto_wave/features/news_page/bloc/bloc.dart';
import 'package:crypto_wave/features/news_page/widgets/news_message.dart';
import 'package:crypto_wave/repositories/news_repository/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
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
              if (state is NewsLoaded) {
                return Column(
                  children: <Widget>[
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20),
                      itemCount: state.news.length,
                      itemBuilder: (BuildContext context, int index) {
                        final message = state.news[index];
                        bool isLastElement = index == state.news.length - 1;
                        return Container(
                          margin: isLastElement
                              ? EdgeInsets.zero
                              : const EdgeInsets.only(bottom: 20),
                          child: WaveMessage(
                            date: message.date,
                            text: message.text,
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    const NavigationBottom(
                      selectedIndex: 1,
                    ),
                  ],
                );
              }

              if (state is NewsLoadingFailure) {
                return LoadingFailure(
                  restart: () => _newsBloc.add(
                    const LoadNews(completer: null),
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
