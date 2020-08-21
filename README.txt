Setup data base:
	php bin/console doctrine:database:create
	php bin/console make:migration
	php bin/console doctrine:migrations:migrate

if you have some errors then:
	php bin/console doctrine:schema:update --bump-sql
	php bin/console doctrine:schema:update --force

