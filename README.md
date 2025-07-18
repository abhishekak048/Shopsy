# 🛍️ Shopsy - Flutter E-Commerce App

A modern, feature-rich e-commerce mobile application built with Flutter, following clean architecture principles and best practices.

## 📱 Features

### 🛒 Shopping Features
- **Product Catalog**: Browse through a comprehensive product catalog
- **Product Details**: View detailed product information, images, and specifications
- **Shopping Cart**: Add/remove items, update quantities, and manage cart
- **Cart Management**: Real-time cart total calculation and item management
- **Local Storage**: Persistent cart data using Hive database

### 🏗️ Architecture & Technical Features
- **Clean Architecture**: Well-structured code following clean architecture principles
- **State Management**: GetX for reactive state management
- **Local Database**: Hive for efficient local data storage
- **Error Handling**: Comprehensive error handling and exception management
- **Responsive Design**: Material Design 3 with responsive UI components
- **Caching**: Image caching for better performance

## 🏛️ Project Architecture

```
lib/
├── base/                          # Base layer - shared utilities and services
│   ├── constants/                 # App constants and configurations
│   ├── error_handling/           # Exception handling and error management
│   ├── local_db/                 # Local database services (Hive)
│   ├── service/                  # Business logic services
│   └── state_response/           # API response handling
├── feature/                      # Feature-based modules
│   ├── product/                  # Product feature module
│   │   ├── controller/           # GetX controllers
│   │   ├── model/               # Data models
│   │   ├── repo/                # Repository layer
│   │   └── view/                # UI components
│   └── cart/                    # Cart feature module
│       ├── controller/          # Cart controllers
│       ├── model/              # Cart models
│       ├── repo/               # Cart repositories
│       └── view/               # Cart UI components
└── main.dart                    # App entry point
```

## 🛠️ Tech Stack

- **Framework**: Flutter 3.8.1+
- **Language**: Dart
- **State Management**: GetX
- **Local Database**: Hive
- **UI Framework**: Material Design 3
- **Image Caching**: cached_network_image
- **Architecture**: Clean Architecture with Repository Pattern

## 📋 Prerequisites

Before running this project, make sure you have the following installed:

- **Flutter SDK**: 3.8.1 or higher
- **Dart SDK**: Latest stable version
- **Android Studio** / **VS Code** with Flutter extensions
- **Git** for version control

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/abhishekak048/Shopsy.git
cd shopsy
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the App

```bash
# For development
flutter run

# For specific platform
flutter run -d android
flutter run -d ios
```

### 4. Build the App

```bash
# Android APK
flutter build apk

# Android App Bundle
flutter build appbundle

# iOS
flutter build ios
```

## 📱 App Structure

### Base Layer (`lib/base/`)

#### Constants (`lib/base/constants/`)
- `product_json.dart` - Mock product data for development

#### Error Handling (`lib/base/error_handling/`)
- `exception_handling.dart` - Custom exception classes

#### Local Database (`lib/base/local_db/`)
- `local_hive_db_service.dart` - Hive database service for local storage

#### Services (`lib/base/service/`)
- `product_list_service.dart` - Product data service
- `local_cart_service.dart` - Cart management service

#### State Response (`lib/base/state_response/`)
- `api_response.dart` - API response wrapper and status management

### Feature Layer (`lib/feature/`)

#### Product Feature (`lib/feature/product/`)
- **Controller**: `product_controller.dart` - Product state management
- **Model**: `product_model.dart` - Product data model
- **Repository**: 
  - `product_repo.dart` - Product data repository
  - `product_blueprint.dart` - Product repository interface
- **Views**:
  - `product_view.dart` - Product listing page
  - `product_details_view.dart` - Product detail page
  - `product_card_view.dart` - Product card widget

#### Cart Feature (`lib/feature/cart/`)
- **Controller**: `cart_controller.dart` - Cart state management
- **Model**: `cart_model.dart` - Cart data model
- **Repository**:
  - `cart_repo.dart` - Cart data repository
  - `car_blueprint.dart` - Cart repository interface
- **View**: `cart_view.dart` - Cart page

## 🔧 Configuration

### Environment Setup

1. **Flutter Environment**: Ensure Flutter is properly configured
2. **Platform Setup**: Configure Android/iOS development environment
3. **Dependencies**: All dependencies are managed in `pubspec.yaml`

### Database Configuration

The app uses Hive for local storage. The database is automatically initialized when the app starts.

## 📊 Key Features Implementation

### Product Management
- Product listing with grid layout
- Product details with comprehensive information
- Product search and filtering (ready for implementation)

### Cart System
- Add products to cart
- Update product quantities
- Remove products from cart
- Real-time cart total calculation
- Persistent cart data

### State Management
- Reactive state management with GetX
- API response handling with loading states
- Error state management

## 📦 Dependencies

### Core Dependencies
- `flutter`: Flutter framework
- `get`: State management and navigation
- `hive`: Local database
- `hive_flutter`: Flutter integration for Hive
- `cached_network_image`: Image caching

### Development Dependencies
- `flutter_test`: Testing framework
- `flutter_lints`: Code linting

## 🚀 Deployment

### Android
1. Update `android/app/build.gradle.kts` with your app details
2. Generate signed APK or App Bundle
3. Upload to Google Play Store

### iOS
1. Update `ios/Runner/Info.plist` with your app details
2. Configure signing certificates
3. Archive and upload to App Store Connect

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 Code Style

This project follows Flutter's official style guide and uses `flutter_lints` for code quality:

- Use meaningful variable and function names
- Follow Dart naming conventions
- Write clean, readable code
- Add comments for complex logic
- Use proper error handling

## 🐛 Known Issues

- Currently using mock data for products
- Cart persistence works locally only
- No user authentication implemented yet

## 🔮 Future Enhancements

- [ ] User authentication and profiles
- [ ] Payment gateway integration
- [ ] Push notifications
- [ ] Offline mode support
- [ ] Product reviews and ratings
- [ ] Wishlist functionality
- [ ] Order tracking
- [ ] Multi-language support
- [ ] Dark mode theme
- [ ] Advanced search and filtering

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Abhishek Kumar**
- GitHub: [@abhishekak048](https://github.com/abhishekak048)
- Project: [Shopsy](https://github.com/abhishekak048/Shopsy)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- GetX team for state management solution
- Hive team for local database solution
- Material Design team for UI guidelines

---

⭐ **Star this repository if you found it helpful!**
