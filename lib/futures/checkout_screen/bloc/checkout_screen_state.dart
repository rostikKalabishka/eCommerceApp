part of 'checkout_screen_bloc.dart';

class CheckoutScreenState extends Equatable {
  const CheckoutScreenState(
      {this.isLoading = false,
      // this.details = const CardFieldInputDetails(complete: false),
      this.error = '',
      this.totalPrice = 0.0});
  final bool isLoading;
  // final CardFieldInputDetails details;
  final Object error;
  final double totalPrice;

  @override
  List<Object> get props => [isLoading, error, totalPrice];

  CheckoutScreenState copyWith({
    bool? isLoading,
    CardFieldInputDetails? details,
    Object? error,
    double? totalPrice,
  }) {
    return CheckoutScreenState(
      isLoading: isLoading ?? this.isLoading,
      // details: details ?? this.details,
      error: error ?? this.error,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
