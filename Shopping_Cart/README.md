# Awazon Frontend Project

## Introduction

Welcome to the Awazon Frontend Project! This project is an e-commerce platform built with Vue.js. It supports three types of users: non-users, users, and admins, each with different levels of access and functionality.

## User Types and Functionalities

### Non-User
Non-users can:
- Browse the home page
- View product pages
- Search for products
- Browse categories
- Login
- Sign up

### User
Users can:
- Browse the home page
- View product pages
- Search for products
- Browse categories
- View user information
- Add products to the cart
- Place orders
- Make transactions

### Admin
Admins have access to additional management functionalities:
- View the admin dashboard
- Manage products
- Manage users
- Manage transactions

#### Admin Dashboard
The admin dashboard contains three buttons to navigate to:
1. **Admin Product Management**: Upload, update, and delete products.
2. **Admin User Management**: View all user information.
3. **Admin Transaction Management**: View all transactions for all users.

## Development Setup

To get started with the development environment:

1. **Clone the repository**:
   ```sh
   git clone <repository-url>
   ```

2. **Navigate to the project directory**:
   ```sh
   cd awazon-frontend
   ```

3. **Install dependencies**:
   ```sh
   npm install
   ```

4. **Run the development server**:
   ```sh
   npm run serve
   ```

## Running Without CORS Policies

Due to CORS policies, you might need to disable web security in Chrome. Use the following command to open Chrome without CORS policies and security:
```sh
"C:\Program Files\Google\Chrome\Application\chrome.exe" --disable-web-security --disable-gpu --user-data-dir=~/chromeTemp
```

## Project Structure

- **src/components**: Contains Vue.js components for the project.
- **src/views**: Contains different views for the application (home, product, admin, etc.).
- **src/router/index.js**: Configures the routes for the application.
- **src/store/index.js**: Vuex store for state management.
- **public**: Contains static assets.
- **package.json**: Project configuration and dependencies.

## Important Commands

- **Start Development Server**: `npm run serve`
- **Build for Production**: `npm run build`
- **Lint and Fix Files**: `npm run lint`

## Additional Information

- Ensure you have Node.js and npm installed on your machine.
- Follow the Vue.js documentation for more detailed information on framework usage and best practices.
- For issues or contributions, please open an issue or a pull request on the project's repository.

## Contact

For any questions or further assistance, please contact the project maintainers.

Happy coding!
