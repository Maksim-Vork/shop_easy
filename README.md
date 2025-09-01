# 📌 ShopEase

**Мобильное приложение для заказа товаров.**  
Простая и удобная платформа для покупки одежды, транспорта и других товаров с интуитивно понятным интерфейсом.

---

## 🚀 Функционал  

✨ **Основные возможности:**  
- 🔐 Аутентификация по email и паролю  
- 📦 Получение списка товаров с сервера через REST API  
- 🗂 Сортировка товаров по категориям  
- 🛒 Добавление товаров в корзину с возможностью изменения количества  
- ⚙️ Настройки приложения, включая переключение темы  
- 💾 Локальное хранение данных с использованием Hive  
- 🔑 Сохранение токена аутентификации в SharedPreferences  

📱 **Платформы:**  
- Android  
- iOS  

---

## 🛠️ Технологии  

- **Flutter / Dart**  
- **Flutter Bloc (State Management)**  
- **Dio (HTTP-клиент для работы с REST API)**  
- **GetIt (Dependency Injection)**  
- **Device Preview**  
- **Flutter ScreenUtil**  
- **GoRouter (Навигация)**  
- **SharedPreferences (Сохранение токена)**  
- **Hive (Локальное хранилище)**  
- **PathProvider**  
- **Clean Architecture**  
- **SOLID**  

---

## 📂 Установка и запуск  

1️⃣ **Клонирование репозитория**  
```bash
git clone https://github.com/username/shopease.git
cd shopease
```

2️⃣ **Установка зависимостей**  
```bash
flutter pub get
```

3️⃣ **Запуск проекта**  
```bash
flutter run
```

---

## 📌 Структура проекта  

```plaintext
lib/
 ├── main.dart
 ├── core/
 │   ├── services/
 │   ├── bloc_auth/
 │   ├── exceptions/
 ├── features/
 │   ├── auth/
 │   ├── cart/
 │   ├── catalog/
 │   ├── profile/
 └── pubspec.yaml
```

---

## 🤝 Контрибьюция  

Если хотите предложить изменения:  

1. Сделайте форк репозитория  
2. Создайте новую ветку  
   ```bash
   git checkout -b feature/my-feature
   ```
3. Сделайте коммит  
   ```bash
   git commit -m "Add my feature"
   ```
4. Запушьте ветку  
   ```bash
   git push origin feature/my-feature
   ```

---

## 🧑‍💻 Автор  

**Chillowi coder**

[![GitHub](https://img.shields.io/badge/GitHub-000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Chillowi_coder)  [![Telegram](https://img.shields.io/badge/Telegram-26A5E4?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/l_2b2t_l)
