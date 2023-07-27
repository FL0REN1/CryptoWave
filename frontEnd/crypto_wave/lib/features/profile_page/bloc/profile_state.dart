part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();

  @override
  List<Object?> get props => [];
}

class ProfileLoaded extends ProfileState {
  final List<WalletRead> wallet;
  final List<Coins> coins;

  const ProfileLoaded({required this.wallet, required this.coins});

  @override
  List<Object?> get props => [wallet, coins];
}

class ProfileLoadingFailure extends ProfileState {
  final Object exception;

  const ProfileLoadingFailure(this.exception);

  @override
  List<Object?> get props => super.props..add(exception);
}
