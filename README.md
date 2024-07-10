# tryterra_ios_crash

This Flutter app demonstrates the issue we are facing while authorizing Apple HealthKit with list of scopes using terra sdk and retrieve historical health data. Follow the steps below to run the project and reproduce the issue.

## Prerequisites

- **Flutter v3.22.2**
- **Dart v3.4.3**

## Steps to Install Flutter

1. **Download Flutter**:
   - Download the Flutter SDK from the [official Flutter website](https://flutter.dev/docs/get-started/install).

2. **Install Flutter**:
   - Extract the downloaded zip file and add the Flutter bin directory to your system's PATH.

   ```sh
   export PATH="$PATH:`pwd`/flutter/bin"
   ```

3. **Verify Installation**:
   - Run the following command to verify that Flutter is installed correctly:

   ```sh
   flutter doctor
   ```

## Steps to Run the Flutter Project

1. **Clone the Repository**:
   ```sh
   git clone https://github.com/lohith-CC/tryterra_IOS_crash_issue
   cd tryterra_IOS_crash_issue
   ```

2. **Install Dependencies**:
   ```sh
   flutter pub get
   ```
3. **Update Pod file**:
  ```sh
   cd ios
   pod update
   ```

4. **Run the App**:
   ```sh
   flutter run
   ```

## Using the App

1. **Authorize Apple Health**:
   - On the home screen, you will see a button labeled **"Authorize Apple Health"**.
   - Please click on that button to initiate the authorization process for Apple HealthKit.

2. **App Crash**:
   - After a few seconds, the app crashes.
