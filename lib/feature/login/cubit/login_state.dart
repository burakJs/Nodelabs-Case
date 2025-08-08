import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool hasError;

  const LoginState({
    this.isLoading = false,
    this.errorMessage,
    this.hasError = false,
  });

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? hasError,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, hasError];
}