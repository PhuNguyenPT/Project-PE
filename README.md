## Required pre-installed apps
1. Intellij (Community/ Ultimate Edition)
2. PostgreSQL + pgAdmin
3. Any web browser (Google, Microsoft Edge, Firefox)
4. Github
5. Docker

## Setup Instructions

To set up the backend of the Book Social Network project, follow these steps:
1. Clone the repository:

```bash
   git clone https://github.com/PhuNguyenPT/Shopping_Cart.git
   cd Shopping_Cart
```
- Create a new database in pgAdmin 4 with the name `shopping_cart`
- Change docker-compose.yml
```
   environment:
      POSTGRES_PASSWORD: to your database password
```
- Change src/main/resources/application.yaml
```bash
   datasource:
      password: to your database password
```

2. Run the docker-compose file in a terminal

```bash
   docker-compose up
```
3. Install dependencies (assuming Maven is installed) and run application in a second terminal for backend:

```bash
   cd ./Shopping_Cart_API
   mvn clean install
   java -jar target/shopping-cart-api-0.0.1-SNAPSHOT.jar
```
4. Install dependencies and run application in a third terminal for frontend:

```bash
   cd ./Shopping_Cart
   npm install
   npm run 
```