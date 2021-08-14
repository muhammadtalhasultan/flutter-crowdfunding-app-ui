part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final int index;
  const PaymentState(this.index);

  @override
  List<Object> get props => [index];
}
