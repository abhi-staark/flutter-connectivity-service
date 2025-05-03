import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static ConnectivityService? _instance;
  ConnectivityService._internal();

  static ConnectivityService get instance {
    _instance ??= ConnectivityService._internal();
    return _instance!;
  }

  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  // Callback for when there's no connectivity
  void Function()? _onDisconnected;

  // Optional: Callback for when internet is restored
  void Function()? _onReconnected;

  bool _hasNetwork = true;

  /// Initialize with optional UI handlers
  void initialize({
    void Function()? onDisconnected,
    void Function()? onReconnected,
  }) {
    _onDisconnected = onDisconnected;
    _onReconnected = onReconnected;

    _subscription = _connectivity.onConnectivityChanged.listen(
      _handleConnectivityChange,
    );
  }

  void dispose() => _subscription.cancel();

  void _handleConnectivityChange(List<ConnectivityResult> results) {
    final hasNetwork = results.any((r) => r != ConnectivityResult.none);

    if (hasNetwork != _hasNetwork) {
      _hasNetwork = hasNetwork;

      if (hasNetwork) {
        _onReconnected?.call();
      } else {
        _onDisconnected?.call();
      }
    }
  }
}
