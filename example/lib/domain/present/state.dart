enum LoadState { initialize, loading, loaded, error }

class UIState<T> {
  final LoadState state;
  final T value;

  UIState({this.state, this.value});

  factory UIState.loaded(T value) => UIState(state: LoadState.loaded, value: value);

  factory UIState.loading() => UIState(state: LoadState.loading);

  factory UIState.initialize() => UIState(state: LoadState.initialize, value: null);
}
