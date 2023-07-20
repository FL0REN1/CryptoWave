part of 'news_bloc.dart';

class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsLoading extends NewsState {
  const NewsLoading();

  @override
  List<Object?> get props => [];
}

class NewsLoaded extends NewsState {
  final List<NewsRead> news;

  const NewsLoaded({required this.news});

  @override
  List<Object?> get props => [news];
}

class NewsLoadingFailure extends NewsState {
  final Object exception;

  const NewsLoadingFailure(this.exception);

  @override
  List<Object?> get props => super.props..add(exception);
}
