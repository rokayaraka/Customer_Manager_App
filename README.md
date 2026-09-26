# Customer Manager – Flutter Task

A clean and responsive Flutter customer management application built as a take home assignment for **Hisab Plus**.

The application provides authenticated access to customer data, paginated customer listing, customer images, customer details, refresh support, error handling, and a simple user friendly interface.

## 📱 Screenshots

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/a6653900-2eb2-407e-8b87-d19eb64f7c34" />


## ✨ Features

- 🔐 User authentication with API login
- 💾 Persistent authentication using `SharedPreferences`
- 🔑 Authorization token handling
- 👥 Customer list fetched from REST API
- 📄 Button-based pagination
- 🔄 Pull to refresh customer list
- 🖼️ Customer profile/image support
- 👤 Detailed customer information
- 💰 Customer sales and balance information
- ⚠️ API error handling
- 🔁 Retry functionality
- 🚪 Logout functionality
- 📱 Responsive and user-friendly Flutter UI
- 🧩 Reusable widgets
- 🏗️ Provider based state management
- 🧹 Clean and readable project structure

## 🛠️ Technology Stack

| Technology | Usage |
|---|---|
| Flutter | Application development |
| Dart | Programming language |
| Provider | State management |
| HTTP | REST API communication |
| SharedPreferences | Local authentication persistence |
| FlutterToast | User feedback messages |
| Logger | Network request/response logging |

## 🏗️ Architecture

The project follows a simple layered structure without an unnecessary repository layer.

```text
UI / Screens
     ↓
Provider
     ↓
NetworkCaller
     ↓
REST API
     ↓
Model
```

Main flow:

```text
User Action
    ↓
Screen / Widget
    ↓
Provider
    ↓
NetworkCaller
    ↓
Hisab Plus API
    ↓
JSON Response
    ↓
Model
    ↓
Provider
    ↓
UI Update
```

## 📂 Project Structure

```text
lib/
│
├── app/
│   └── get_network_caller.dart
    └── app_colors.dart     
│
├── core/
│   ├── constants/
│   │   └── urls.dart
│   └── service/
│       └── network/
│           ├── network_caller.dart
│           └── network_response.dart
│
├── features/
│   ├── auth/
│   │   ├── data/model/
│   │   │   ├── auth_model.dart
│   │   │   └── login_params.dart
│   │   ├── providers/
│   │   │   ├── auth_controller.dart
│   │   │   └── login_providers.dart
│   │   └── screens/
│   │       └── login_screen.dart
│   │
│   └── customer/
│       ├── data/model/
│       │   └── customer_model.dart
│       ├── providers/
│       │   ├── customer_list_provider.dart
│       │   └── customer_details_provider.dart
│       ├── screens/
│       │   ├── customer_list_screen.dart
│       │   └── customer_details_screen.dart
│       └── widgets/
│           ├── build_error_view.dart
│           ├── customer_card.dart
│           ├── customer_details_header.dart
│           ├── customer_image.dart
│           ├── customer_information.dart
│           └── customer_sales_details.dart
│
└── main.dart
```

## 🔐 Authentication

After successful login:

1. The API returns an authentication token.
2. The token is stored in `SharedPreferences`.
3. The token is kept in memory for authenticated requests.
4. The application checks the saved token when starting.
5. Authenticated users are taken directly to the Customer List.
6. Otherwise, the Login screen is displayed.

Credentials should **not** be committed to a public Git repository.

## 🌐 API Integration

### Base URL

```text
https://www.hisabplus.com/Values/
```

### Login

```text
GET /LogIn
```

Parameters:

```text
UserName
Password
ComId
```

### Customer List

```text
GET /GetCustomerList
```

Parameters:

```text
searchquery
pageNo
pageSize
SortyBy
```

The application uses the API's pagination metadata to determine the current page, total pages, and total customer records.

## 👤 Customer Details

Selecting a customer opens the Customer Details screen.

### Customer Information

- Customer name
- Email
- Phone number
- Primary address
- Secondary address
- Customer type
- Active/inactive status

### Sales Details

- Total due
- Total sales value
- Total sales return value
- Total amount back
- Total collection
- Last sales date
- Last invoice number
- Last sold product
- Last transaction date

The details UI is divided into reusable widgets to keep the screen clean and maintainable.

## 🖼️ Customer Images

Customer images are loaded from the image path returned by the API.

If an image is unavailable or fails to load, the application displays a default customer icon instead of a broken image.

## ⚠️ Error Handling

The application handles:

- Loading states
- Successful responses
- Empty customer lists
- API errors
- Unauthorized responses
- Invalid responses
- Network exceptions

When a request fails, the user receives an error message with a **Try Again** action.

## 🔄 Refresh

The customer list supports pull to refresh. The currently selected page is requested again instead of automatically returning to the first page.

## 🚪 Logout

The logout action:

1. Clears the saved authentication token.
2. Clears stored authentication data.
3. Resets the login provider.
4. Returns the user to the Login screen.

## 📦 Dependencies

Typical dependencies used by the project:

```yaml
dependencies:
  flutter:
    sdk: flutter

  provider: ^6.1.2
  http: ^1.2.2
  shared_preferences: ^2.3.2
  fluttertoast: ^8.2.8
  logger: ^2.4.0
```

> Use the package versions already configured in your project if they differ.

## 🚀 Getting Started

### 1. Clone the project

```bash
git clone <your-repository-url>
```

### 2. Open the project

```bash
cd <project-folder>
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the application

```bash
flutter run
```

## 🔒 Security Note

This project was created for a take home assignment from `gtr` using the provided API credentials.

For production applications:

- Do not hardcode usernames/passwords.
- Do not commit credentials to GitHub.
- Store sensitive configuration securely.
- Use environment specific configuration.
- Handle token expiration securely.
- Follow appropriate API security practices.

## 🎯 Assignment Requirements Covered

| Requirement | Implementation |
|---|---|
| User authorization | Login API + token persistence |
| State management | Provider |
| Customer list | REST API |
| Pagination | Previous / Next pagination |
| Customer image | Network image with fallback |
| Customer details | Dedicated details screen |
| Error handling | Error widget + retry |
| User-friendly UI | Reusable widgets + loading/empty states |
| Clean code | Feature-based structure |
| API communication | Reusable `NetworkCaller` |

## 👩‍💻 Author

**Rokaya Sultana Raka**

Flutter Developer / CSE Student

## 📄 License

This project was developed as a take-home assignment and is intended for evaluation purposes.
