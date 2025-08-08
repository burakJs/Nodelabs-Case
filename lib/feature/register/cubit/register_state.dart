import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool hasError;
  final bool isTermsAccepted;

  const RegisterState({
    this.isLoading = false,
    this.errorMessage,
    this.hasError = false,
    this.isTermsAccepted = false,
  });

  RegisterState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? hasError,
    bool? isTermsAccepted,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      hasError: hasError ?? this.hasError,
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, hasError, isTermsAccepted];
}