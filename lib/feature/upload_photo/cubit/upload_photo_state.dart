import 'package:equatable/equatable.dart';

class UploadPhotoState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool hasError;

  const UploadPhotoState({
    this.isLoading = false,
    this.errorMessage,
    this.hasError = false,
  });

  UploadPhotoState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? hasError,
    bool? isTermsAccepted,
  }) {
    return UploadPhotoState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, hasError];
}
