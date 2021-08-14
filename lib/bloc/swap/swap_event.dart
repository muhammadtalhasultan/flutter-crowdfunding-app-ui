part of 'swap_bloc.dart';

abstract class SwapEvent extends Equatable {
  const SwapEvent();
}

class SetSwap extends SwapEvent {
  final bool isDonation;

  const SetSwap(this.isDonation);
  @override
  List<Object> get props => [isDonation];
}

class SetEmpty extends SwapEvent {
  final bool isEmpty;

  const SetEmpty(this.isEmpty);
  @override
  List<Object> get props => [isEmpty];
}

class SetDetail extends SwapEvent {
  final bool isDetail;

  const SetDetail(this.isDetail);
  @override
  List<Object> get props => [isDetail];
}
