# 📶 Flutter Connectivity Service

A clean, scalable solution to monitor internet connectivity across your entire Flutter app using a singleton service.

This service listens to real-time connectivity changes (WiFi, Mobile, or Offline) and shows a global "No Internet" dialog when disconnected. Designed with the **Single Responsibility Principle** in mind (part of SOLID principles) — it does one thing and does it well.

---

## 🚀 Features

- ✅ One-time initialization in `main.dart`
- ✅ Global internet monitoring using `connectivity_plus`
- ✅ "No Internet" alert dialog displayed globally
- ✅ Singleton pattern for easy access across the app
- ✅ Clean separation of concerns (SRP — S of SOLID)

---

## 📦 Installation

Add `connectivity_plus` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  connectivity_plus: ^4.0.1
