# Firebase Orders App

## Overview
This is a simple Flutter application with five main features:

1. **Login Screen**
   - Fields for Email & Password
   - Input validation
   - Options for Register and Reset Password
   - Store login info locally (Firebase or mock storage)

2. **Orders Screen**
   - Display a list of orders
   - Each order contains: Client Name, Address, Status, and a Details button
   - Orders data is fetched from a mock API or local JSON file

3. **Order Details Screen**
   - Displays full order details
   - Button to update order status to "Delivered" or "Cancelled"

4. **Localization Support**
   - Users can switch between different languages

5. **Theme & UI Customization**
   - Ability to toggle between different UI themes (Light/Dark mode)

## Installation

### Prerequisites
- Flutter SDK installed
- Firebase setup (if using Firebase for authentication and data storage)

### Setup
1. Clone the repository:
   ```sh
   git clone <repository-url>
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run the application:
   ```sh
   flutter run
   ```


## Features
- **Firebase Authentication (if enabled)**
- **Local storage for login credentials**
- **Fetching and displaying order data**
- **Updating order status**
- **Localization & multi-language support**
- **Customizable theme (Light/Dark mode)**

## Future Enhancements
- Integrate a real API for fetching orders
- Implement user roles (Admin, Customer, etc.)
- UI improvements and animations

## License
This project is licensed under the MIT License.

