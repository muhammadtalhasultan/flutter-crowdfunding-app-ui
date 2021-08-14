part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
}

class ChangePayment extends PaymentEvent {
  final int index;
  const ChangePayment(this.index);
  @override
  List<Object> get props => [index];
}
