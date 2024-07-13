# Symfony RESTful API

## Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/eduduru/symfony-api.git
   cd symfony-api

 2. Install Dependencies->

   composer install

3. Set Up Environment Variables->

   Copy the .env.example file to .env

cp .env.example .env

4. Generate JWT Keys to config/jwt directory->
   
   mkdir -p config/jwt
   openssl genrsa -out config/jwt/private.pem -aes256 4096
   openssl rsa -pubout -in config/jwt/private.pem -out config/jwt/public.pem

5. Set the passphrase in the .env file: JWT_PASSPHRASE=your_passphrase

6. Set Up the Database->

   Create the database name is app:

   Run: php bin/console doctrine:database:create
   Run migrations to set up the database schema: php bin/console doctrine:migrations:migrate

   Load Fixtures: php bin/console doctrine:fixtures:load

7. Run the Symfony Server->
   symfony server:start

   If the symfony command is not available, use-> php -S localhost:8000 -t public

# Docker Setup
----------------------------------
Start Docker Containers:


# Build Docker containers
docker-compose build

# Build and run Docker containers:
docker-compose up -d


# Start Docker containers
docker-compose up -d

# Install Symfony dependencies
docker-compose exec app composer install

# Create database schema
docker-compose exec php bin/console doctrine:schema:create

# Run Database Migrations
docker-compose exec app php bin/console doctrine:database:create
docker-compose exec app php bin/console doctrine:migrations:migrate

# Load Fixtures
docker-compose exec app php bin/console doctrine:fixtures:load

#Access the Application:

Open your web browser or postman and go to http://localhost:8000 (or the port specified in your Docker setup)


How it works
--------------------------------------------------------------------------
Here is the pipeline for getting an access to the api resources.

Register a new user account
POST /api/register
    Smaple payload:

    {
    "username": "Chinedu",
    "password": "password"
   }
Content-Type: application/json

HTTP1/1 200 OK
Content-Type: application/json
user: {}
Login with the new account
POST /login_check
    
Smaple payload:
    {
    "username": "Chinedu",
    "password": "password"
  }

Content-Type: application/json

HTTP1/1 200 OK
Content-Type: application/json
token: {}
expiresIn: {}
Use this generate token for accessing resources
GET /user
X-Auth-Token: {}

HTTP1/1 200 OK
Content-Type: application/json
user: {}


The API documentation link
--------------------------------------------------------------
https://documenter.getpostman.com/view/1838571/2sA3e5eojF
