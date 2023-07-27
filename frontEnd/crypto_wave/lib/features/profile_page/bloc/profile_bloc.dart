import 'dart:async';

import 'package:crypto_wave/repositories/coins_repository/coins_repository.dart';
import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:crypto_wave/repositories/wallet_repository/abstract_wallet_repository.dart';
import 'package:crypto_wave/repositories/wallet_repository/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this.profileRepository,
    this.coinsRepository,
  ) : super(const ProfileState()) {
    on<LoadProfile>(_load);
  }

  final AbstractWalletRepository profileRepository;
  final AbstractCoinsRepository coinsRepository;
  Timer? _timer;

  Future<void> _load(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      if (state is! ProfileLoaded) {
        emit(const ProfileLoading());
      }

      WalletGetAll walletGetAll = WalletGetAll(userId: event.userId);

      final coinsList = await coinsRepository.getCoinsList();
      final wallet = await profileRepository.getAllWallet(walletGetAll);

      emit(ProfileLoaded(wallet: wallet, coins: coinsList));
    } catch (e, st) {
      emit(ProfileLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }

  void startUpdatingWallet({required int userId}) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      add(LoadProfile(completer: null, userId: userId));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
