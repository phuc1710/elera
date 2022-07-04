abstract class DataState<T> {
  const DataState({this.data, this.error});

  final T? data;
  final T? error;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(T error) : super(error: error);
}
