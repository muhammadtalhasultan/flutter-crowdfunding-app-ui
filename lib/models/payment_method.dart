import 'package:equatable/equatable.dart';

class PaymentMethod extends Equatable {
  final String name;
  final String assetName;

  PaymentMethod({
    required this.name,
    required this.assetName,
  });

  @override
  List<Object?> get props => [name, assetName];
}
