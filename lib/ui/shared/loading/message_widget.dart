import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/shared/loading/loading_cubit.dart';

class MessageWidget extends StatefulWidget {
  final LoadingCubit loadingCubit;

  const MessageWidget({super.key, required this.loadingCubit});

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
            child: Row(
              children: [
                BlocBuilder(
                  bloc: widget.loadingCubit,
                  builder: (context, state) {
                    var message = "An error occurred";
                    if (state is LoadingFailedState)
                      message = state.errorMessage;
                    return Flexible(
                      child: Text(
                        message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                IconButton(
                    onPressed: () {
                      widget.loadingCubit.loadingReset();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 15), (){
      setState(() {
        _visible = false;
      });
    });
  }
}
