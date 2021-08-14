import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'swap_event.dart';
part 'swap_state.dart';

class SwapBloc extends Bloc<SwapEvent, SwapState> {
  SwapBloc(PageController controller)
      : super(SwapState(
          isDonation: true,
          controller: controller,
          isDetail: false,
          isEmpty: false,
        ));

  @override
  Stream<SwapState> mapEventToState(
    SwapEvent event,
  ) async* {
    if (event is SetSwap) {
      yield SwapState(
        isDonation: event.isDonation,
        controller: state.controller,
        isDetail: state.isDetail,
        isEmpty: state.isEmpty,
      );
    }

    if (event is SetEmpty) {
      yield SwapState(
        isDonation: state.isDonation,
        controller: state.controller,
        isDetail: state.isDetail,
        isEmpty: event.isEmpty,
      );
    }

    if (event is SetDetail) {
      yield SwapState(
        isDonation: state.isDonation,
        controller: state.controller,
        isDetail: event.isDetail,
        isEmpty: state.isEmpty,
      );
    }
  }
}
