import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demoapp/main.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  // Singleton setup
  static final ConnectivityService _instance = ConnectivityService._internal();
  factory ConnectivityService() => _instance;
  ConnectivityService._internal();

  final Connectivity _connectivity = Connectivity();

  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  bool _isDialogVisible = false;

  /// Initialize connectivity monitoring
  void initialize() {
    // Listen to connectivity changes (WiFi, Mobile, None)
    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      _handleConnectivityChange(results);
    });
  }

  /// Cancel connectivity subscription when not needed
  void dispose() {
    _subscription.cancel();
  }

  /// Handle connectivity changes and show/hide no-internet dialog
  void _handleConnectivityChange(List<ConnectivityResult> results) {
    // Check if any network is available (ignores actual internet access)
    final hasNetwork = results.any((r) => r != ConnectivityResult.none);

    if (!hasNetwork) {
      _showNoInternetDialog();
    } else {
      _dismissDialog();
    }
  }

  /// Show no-internet dialog if not already visible
  void _showNoInternetDialog() {
    if (_isDialogVisible) return;

    _isDialogVisible = true;

    showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      barrierDismissible: false,
      builder: (_) => const AlertDialog(
        title: Text("No Internet"),
        content: Text("Please check your connection."),
      ),
    );
  }

  /// Dismiss the no-internet dialog if visible
  void _dismissDialog() {
    if (_isDialogVisible) {
      navigatorKey.currentState?.pop();
      _isDialogVisible = false;
    }
  }
}
