import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_state.dart';
part 'loading_cubit.freezed.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(const InitialLoadingState());

  void loadingFailed(String errorMessage) => emit(LoadingState.loadingFailedState(errorMessage));
  void loadingSucceed() => emit(const LoadingState.loadingSuccessState());
  void loadingReset() => emit(const LoadingState.loadingCompletedState());
  void loadingStart() => emit(const LoadingState.loadingStartedState());

}
