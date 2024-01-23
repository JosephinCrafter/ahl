part of '../newsletter.dart';

class NewsletterSubscriptionBloc
    extends Bloc<NewsletterSubscriptionEvent, NewsletterSubscriptionState> {
  /// in super we add initial state.
  ///
  /// You should add an initialization state to make it work.
  NewsletterSubscriptionBloc({
    required this.repo,
  }) : super(
          NewsletterSubscriptionState.initial(),
        ) {
    on<SubscriptionRequestEvent>(_onSubscriptionRequest);
    on<InitializeRequestEvent>(_onInitializeRequest);
  }

  /// The repo to be used when storing data.
  final NewsletterSubscriptionRepository repo;

  // Initialization Handler
  void _onInitializeRequest(
      InitializeRequestEvent event, Emitter<NewsletterSubscriptionState> emit) {
    /// emit initial state
    emit(NewsletterSubscriptionState.initial());

    // then, register a callback on subscribe event
    repo.status.listen(
      (event) {
        switch (event) {
          // Error
          case NewsletterSubscriptionStatus.error:
            emit(
              state.copyWith(
                  status: NewsletterSubscriptionStatus.error,
                  error: "Failed to register, verify your network"),
            );
            break;

          // Loading
          case NewsletterSubscriptionStatus.loading:
            emit(
              state.copyWith(status: NewsletterSubscriptionStatus.loading),
            );
            break;

          // Success
          case NewsletterSubscriptionStatus.success:
            emit(
              state.copyWith(
                  status: NewsletterSubscriptionStatus.success, error: null),
            );
          default:
        }
      },
    );
  }

  // Subscription event handler
  void _onSubscriptionRequest(SubscriptionRequestEvent event,
      Emitter<NewsletterSubscriptionState> emit) {
    emit(
      state.copyWith(
        email: event.email,
        status: NewsletterSubscriptionStatus.loading,
        error: null,
      ),
    );

    // Test if the email is working and acting according to it
    if (event.email != null && event.email!.isNotEmpty) {
      repo.subscribe(email: event.email!);
    } else {
      emit(
        state.copyWith(
          status: NewsletterSubscriptionStatus.error,
          error: "Invalid Email",
        ),
      );
    }
  }
}
