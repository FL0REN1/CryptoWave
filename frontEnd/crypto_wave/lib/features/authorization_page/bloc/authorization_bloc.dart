import 'package:crypto_wave/repositories/user_repository/abstract_user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AutorizationBloc extends Bloc<AutorizationEvent, AutorizationState> {
  AutorizationBloc(this.userRepository) : super(const AutorizationState()) {
    on<LoadAutorization>(_load);
  }

  final AbstractUserRepository userRepository;

  Future<void> _load(
    LoadAutorization event,
    Emitter<AutorizationState> emit,
  ) async {
    try {
      if (state is! AutorizationLoaded) {
        emit(const AutorizationLoading());
      }

      emit(const AutorizationLoaded());
    } catch (e, st) {
      emit(AutorizationLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    }
  }
}
