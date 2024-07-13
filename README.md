# Build Docker containers
docker-compose build

# Start Docker containers
docker-compose up -d

# Install Symfony dependencies
docker-compose exec php composer install

# Create database schema
docker-compose exec php bin/console doctrine:schema:create


https://github.com/eduduru/symfony-api.git