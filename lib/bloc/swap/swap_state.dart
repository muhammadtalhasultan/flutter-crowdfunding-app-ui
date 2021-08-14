part of 'swap_bloc.dart';

class SwapState extends Equatable {
  final bool isDonation;
  final bool isEmpty;
  final bool isDetail;
  final PageController controller;
  const SwapState(
      {required this.isDonation,
      required this.controller,
      required this.isDetail,
      required this.isEmpty});

  @override
  List<Object> get props => [isDonation, controller, isDetail, isEmpty];
}
