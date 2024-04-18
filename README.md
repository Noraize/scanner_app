Sure! Here's the final README file incorporating all the sections:

---

# Festifyer Mobile App

## Overview
The Festifyer Mobile App is a cross-platform mobile application developed using Flutter. It provides users with features for event check-in using QR codes, user authentication, and navigation functionalities. The app also integrates Google Mobile Ads for displaying advertisements to users.

## Screenshots
Insert screenshots of the project to showcase its appearance and functionality. Placeholders have been added below for the screenshots.

### Splash Page

<img width="359" alt="Splash" src="https://github.com/Noraize/scanner_app/assets/67844202/bc121f80-ad54-4038-a8fb-ca04073897fe">


### Login Page

<img width="265" alt="Login" src="https://github.com/Noraize/scanner_app/assets/67844202/aedc7a82-5997-406c-a94c-437287fbfb15">


### QR Code Scanner Page

<img width="265" alt="Login" src="https://github.com/Noraize/scanner_app/assets/67844202/3e5b6347-eeb1-4991-83ba-5b1c47c1a670">


### Check-in Success Page

<img width="325" alt="Event Join " src="https://github.com/Noraize/scanner_app/assets/67844202/71cf57f5-2c50-4058-b3c3-b2663714f756">


### Check-in Failure Page

<img width="315" alt="Failure" src="https://github.com/Noraize/scanner_app/assets/67844202/9ca8109d-21df-400b-a88b-8f9841e7f8a0">


## Features
- **Splash Page**: Displays a splash screen with the app logo while the application loads its initial resources and assets.
- **Login Page**: Allows users to log in to the application using their email and password. Implements authentication using an API endpoint. Provides form validation and error handling.
- **QR Code Scanner Page**: Provides a QR code scanner functionality for checking in users. Utilizes the device's camera to scan QR codes. Validates scanned QR codes and communicates with a server-side API for check-in operations.
- **Check-in Success Page**: Displays a success message after a successful check-in operation. Allows users to navigate back to previous screens or perform other actions.
- **Navigation**: Utilizes custom app bars for navigation, including a logout option. Implements navigation logic to switch between different screens and handle user actions.

## Technologies Used
- **Flutter**: A cross-platform UI toolkit for building mobile applications using the Dart programming language. Flutter allows developers to create beautiful and fast user interfaces with a rich set of customizable widgets.
- **Dart**: The programming language used for developing Flutter applications. Dart is a modern, object-oriented language with features such as strong typing, asynchronous programming, and a familiar syntax.
- **Google Mobile Ads**: Used for integrating advertisements into the application. Google Mobile Ads provides a platform for displaying banner ads, interstitial ads, and rewarded ads to monetize mobile applications.
- **JSON**: Utilized for handling data exchange between the mobile app and the server-side API. JSON (JavaScript Object Notation) is a lightweight data interchange format that is easy for humans to read and write and easy for machines to parse and generate.

## Pages and Technical Implementation

### 1. Splash Page

#### Purpose
The splash page provides users with a visual indicator that the application is loading while initializing its resources and assets. It displays the app logo or branding and transitions to the main application interface once the loading process is complete.

#### Technical Implementation
- **Widget**: The splash page is implemented as a stateless widget (`Splash`) in Flutter.
- **Assets**: It displays the app logo or branding image as the background of the page, giving users a visual indication of the application's identity.
- **Duration**: The splash page is configured to display for a specific duration, typically a few seconds, using the `Timer` class or `Future.delayed` method. Once the duration elapses, the page navigates to the main application interface.
- **Navigation**: After the specified duration, the application transitions to the main interface using a navigator to navigate to the next page, typically the home page or login page.

#### Key Points
- The splash page provides users with a visual indicator that the application is loading and initializing its resources.
- It helps improve the user experience by providing a branded and consistent interface during the loading process.
- The splash page is typically displayed for a short duration before transitioning to the main application interface.

### 2. Login Page

#### Purpose
The login page enables users to authenticate themselves using their email address and password. It communicates with a server-side API endpoint to perform authentication and handles various scenarios such as successful login, invalid input, and unauthorized access.

#### Technical Implementation
- **Widget**: The login page is implemented as a stateful widget (`loginscreen`) in Flutter.
- **App Bar**: It includes a custom app bar (`NewAppBar`) with no additional buttons.
- **Form Inputs**: The body of the page contains two text fields (`TextField`) for entering the email address and password.
- **Login Button**: An elevated button (`ElevatedButton`) is provided for users to submit their login credentials.
- **API Integration**: When the login button is pressed, the application sends a POST request to a specified API endpoint (`https://festifyer.com/api/login`) with the entered email and password.
- **Response Handling**: Upon receiving a response from the API, the application checks the response status code to determine the outcome of the login attempt.
  - If the status code is `200`, it indicates a successful login. The application stores the authentication token received from the server in the device's shared preferences (`SharedPreferences`) for future authenticated requests.
  - If the status code is `400`, it indicates invalid input, and the application displays an appropriate error message to the user.
  - If the status code

 is `401`, it indicates unauthorized access, and the application displays an appropriate error message to the user.
- **Form Validation**: The login form performs validation on the email and password fields to ensure they are not empty before sending the login request.
- **Error Handling**: The application handles errors such as network errors or server-side errors gracefully by displaying relevant error messages to the user.

#### Key Points
- The login functionality involves interaction with a server-side API endpoint for authentication.
- The Flutter application handles different scenarios such as successful login, invalid input, and unauthorized access based on the response received from the API.
- Form validation and error handling are implemented to provide a smooth user experience and feedback during the login process.

### 3. Home Page

#### Purpose
The home page serves as the main interface of the application, providing users with access to various features and functionalities. It typically displays navigation options, relevant information, and interactive elements.

#### Technical Implementation
- **Widget**: The home page is implemented as a stateful widget (`homepage`) in Flutter.
- **App Bar**: It includes a custom app bar (`NewAppBar`) with buttons for navigation and other actions.
- **Content**: The body of the page contains widgets for displaying content and interactive elements such as buttons or lists.
- **Navigation**: The home page allows users to navigate to other pages or perform specific actions by interacting with the app bar buttons or other UI elements.
- **Integration**: Depending on the application's requirements, the home page may integrate with other features such as ads, notifications, or user-specific data.

#### Key Points
- The home page serves as the central hub of the application, providing users with access to various features and functionalities.
- It typically includes navigation options, interactive elements, and relevant information to guide users through the application.
- The design and layout of the home page may vary based on the application's specific use case and user interface guidelines.

### 4. QR Code Scanner Page

#### Purpose
The QR code scanner page allows users to scan QR codes for performing specific actions or accessing information. It utilizes the device's camera to capture QR code images and processes them to extract relevant data.

#### Technical Implementation
- **Widget**: The QR code scanner page is implemented as a stateful widget (`ScanQrPage`) in Flutter.
- **QR Scanner**: It utilizes the `qr_code_scanner` package to integrate QR code scanning functionality into the application.
- **Camera Access**: The page requests permission to access the device's camera to capture QR code images.
- **QR Code Processing**: When a QR code is detected, the page processes the scanned data to extract relevant information or perform specific actions.
- **Integration**: Depending on the application's requirements, the QR code scanner page may integrate with other features such as authentication, data retrieval, or navigation.

#### Key Points
- The QR code scanner page provides users with a convenient way to interact with QR codes using their mobile devices.
- It utilizes the device's camera and QR code scanning libraries to capture and process QR code images.
- The page can be customized to perform various actions based on the scanned QR code data, such as navigating to a specific location, performing a check-in operation, or accessing additional information.

### 5. Check-in Success Page

#### Purpose
The check-in success page displays a success message to users after a successful check-in operation. It provides feedback to users and allows them to navigate back to previous screens or perform other actions.

#### Technical Implementation
- **Widget**: The check-in success page is implemented as a stateful widget in Flutter.
- **UI Elements**: It includes UI elements such as text widgets and buttons to display the success message and provide navigation options.
- **Navigation**: The page allows users to navigate back to previous screens using a back button or perform other actions such as returning to the home page or scanning another QR code.

Success and Failure Sounds
In addition to visual indicators, the application also provides auditory feedback to users for successful and failed operations. The tick and cross icons, indicating success and failure respectively, are accompanied by corresponding sounds.

Success Sound: A pleasant notification sound is played when a successful operation, such as a check-in or login, is completed successfully. This sound provides positive reinforcement to the user and enhances the user experience.

Failure Sound: In case of a failed operation, such as an invalid input or unauthorized access, a distinct error sound is played to alert the user about the issue. This sound helps communicate the error effectively and prompts the user to take corrective actions.
These sounds contribute to a more immersive and engaging user experience by providing additional sensory feedback alongside visual cues.

#### Key Points
- The check-in success page provides users with feedback on the successful completion of a check-in operation.
- It enhances the user experience by acknowledging the user's action and providing clear guidance on next steps.
- The page may include additional functionality or options based on the application's specific requirements, such as displaying related information or offering further actions.

