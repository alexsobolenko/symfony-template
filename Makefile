init:
	docker-compose exec php composer install

check_syntax:
	docker-compose exec php bin/console cache:clear
	docker-compose exec php vendor/bin/phpstan analyse
	docker-compose exec php vendor/bin/phpcs src
	docker-compose exec php vendor/bin/phplint

check_tests:
	docker-compose exec php bin/console doctrine:database:drop --env=test --if-exists --force --quiet
	docker-compose exec php bin/console doctrine:database:create --env=test --quiet
	# docker-compose exec php bin/console doctrine:migrations:migrate --env=test --quiet
	# docker-compose exec php bin/console doctrine:fixtures:load --env=test --append --quiet
	docker-compose exec php bin/console cache:clear --env=test --quiet
	docker-compose exec php bin/phpunit
	docker-compose exec php bin/console doctrine:database:drop --env=test --force --quiet
