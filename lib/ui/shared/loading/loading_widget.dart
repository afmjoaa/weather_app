import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather_app/ui/shared/loading/loading_cubit.dart';
import 'package:weather_app/ui/shared/loading/message_widget.dart';
import 'package:weather_app/ui/shared/loading/overlay_widget.dart';

class LoadingWidget extends StatefulWidget {
  final LoadingCubit loadingCubit;
  final Widget child;

  const LoadingWidget(
      {super.key, required this.loadingCubit, required this.child});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, LoadingState>(
      bloc: widget.loadingCubit,
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: widget.child,
              ),
              Visibility(
                visible: state is LoadingStartedState ? true : false,
                child: const OverlayWidget(),
              ),
              Visibility(
                visible: state is LoadingStartedState ? true : false,
                child: Center(
                  child: LoadingAnimationWidget.twistingDots(
                    leftDotColor: const Color(0xFF13B9FF),
                    rightDotColor: const Color(0xFFEA3799),
                    size: 200,
                  ),
                ),
              ),
              Visibility(
                visible: state is LoadingFailedState,
                child: MessageWidget(
                  loadingCubit: widget.loadingCubit,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
