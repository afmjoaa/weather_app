abstract class BaseUseCase<TOut, TIn> {
  BaseUseCase();
  Future<TOut> call(TIn input);
}