
---

# To-Do App

## Overview

The Todo App is a simple mobile application designed to help users manage their tasks efficiently. Users can add and delete tasks, making it a handy tool for staying organized.

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Features](#features)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

### Prerequisites

Make sure you have the following installed on your machine:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [Firebase](https://console.firebase.google.com/)

### Installation

Follow these steps to get the Todo App up and running:

```bash
# Clone the repository
git clone [https://github.com/your-username/todo-app.git](https://github.com/sakthi2943/To-Do-App.git)

# Navigate to the project directory
cd todo-app

# Install dependencies
flutter pub get

# Run the app
flutter run
```

- **Firebase:** Create your firebase project with email authentication.
- Find this code in main.dart and replace with your firebase credentials

 ```bash
#Replace the credentials of your firebase project
 await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'API-key',
      projectId: 'ProectID',
      appId: 'APPID',
      messagingSenderId: 'SenderID',
    ),
  );
```

Refer this [link](https://firebase.google.com/docs/flutter/setup?platform=android) for Firebase-Flutter configuration

## Features

- **Task Management:** Add, delete and see the description of tasks.
- **Simple Interface:** User-friendly design for easy navigation.

## Usage

1. **Add a Task:**
   - Tap the '+' button to add a new task.
   - Enter task details and tap 'Add Task.'

2. **Description:**
   - Tap on a task description to its details.
   - Modify the information and tap 'Save Changes.'

3. **Delete a Task:**
   - Tap on the delete icon to delete the task.
   - Confirm deletion.

## Contributing

Contributions are welcome! If you'd like to contribute to the Todo App, please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature`)
3. Make your changes and commit them (`git commit -m 'Add your feature'`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a pull request

## Documentation

- [Development document](https://docs.google.com/document/d/1_ZTrhMK0H42QvLtw-BIocEFVWUqTq8gR9uEP3MTmrFw/edit?usp=sharing)

## License

This Todo App is licensed under the [MIT License](LICENSE).

---
