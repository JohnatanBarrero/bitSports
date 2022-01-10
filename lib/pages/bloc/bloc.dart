import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwarsbitsports/models/doc.dart';
import 'package:starwarsbitsports/pages/repository.dart';

part 'event.dart';
part 'state.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Repository? repository;
  Bloc([this.repository]) : super(initialState) {
    repository ??= Repository();

    on<LoadStatusEvent>(_loadStatusEvent);
  }
  static State get initialState => const InitialState(
        Model(),
      );
  void _loadStatusEvent(LoadStatusEvent event, Emitter<State> emit) async {
    emit(
      LoadingState(
        state.model,
      ),
    );
    try {
      emit(
        LoadedState(
          state.model.copyWith(
            listbooks: await repository!.getBooksAuthor(),
          ),
        ),
      );
    } catch (e) {
      emit(
        ErrorState(
          state.model,
        ),
      );
    }
  }
}
