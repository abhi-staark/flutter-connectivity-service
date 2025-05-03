
# 📶 Flutter Connectivity Service

A clean, scalable solution to monitor internet connectivity across your Flutter app using the singleton design pattern.

This repository contains **two versions** of the connectivity monitoring service — each showcasing different levels of adherence to the **Single Responsibility Principle (SRP)** from the SOLID principles.

---

## 🚀 What’s Inside

### 🔹 App 1 – Partial SRP

* Uses a `ConnectivityService` that both:

  * Listens to internet changes **and**
  * Shows the "No Internet" dialog directly
* ✅ Simple and practical
* ⚠️ Slightly violates SRP because it mixes logic (network + UI)

### 🔹 App 2 – Complete SRP

* `ConnectivityService` **only handles network status**
* UI handling (dialog) is passed in as a **callback** from `main.dart`
* ✅ Fully separates concerns (network vs UI)
* ✅ 100% SRP-compliant and easier to test or customize UI


## 📦 Installation

Add `connectivity_plus` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  connectivity_plus: ^4.0.1
```

## 💡 Why Two Versions?

To help you understand:

* How practical, real-world code sometimes bends rules (App 1)
* And how you can refactor it to follow clean architecture principles (App 2)

Choose what works best for your project!
