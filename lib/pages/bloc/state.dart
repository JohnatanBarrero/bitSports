part of 'bloc.dart';

abstract class State extends Equatable {
  final Model model;
  const State(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends State {
  const InitialState(Model model) : super(model);
}

class LoadingState extends State {
  const LoadingState(Model model) : super(model);
}

class LoadState extends State {
  const LoadState(Model model) : super(model);
}

class LoadedState extends State {
  const LoadedState(Model model) : super(model);
}
class ErrorState extends State {
  const ErrorState(Model model) : super(model);
}

class Model extends Equatable {
  final List<Doc> listbooks;
  const Model({this.listbooks= const []});
  Model copyWith({List<Doc>? listbooks})=> Model(listbooks: listbooks ?? this.listbooks);

  @override 
  List<Object?> get props =>[listbooks];
}
