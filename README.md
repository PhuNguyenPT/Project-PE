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
git clone https://github.com/PhuNguyenPT/Project-PE.git
cd Project-PE
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
4. Load the data into the database by running the following command in the terminal:

Open a command prompt and navigate to the bin directory where the psql.exe file is located. This is typically located in the C:\Program Files\PostgreSQL\16\bin directory. Run the following command to connect to the database:
```bash
pg_restore -U postgres -d shopping_cart absolute\path\toShopping_Cart_API\src\main\resources\shopping_cart.sql
```
The database path cannot contain folders with spaces. Please enter the password when prompted.

5. Install dependencies and run application in a third terminal for frontend:

```bash
cd ./Shopping_Cart
npm install
npm run serve
```
