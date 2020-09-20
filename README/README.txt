Setup BDD:
	php bin/console doctrine:database:create
	php bin/console make:migration
	php bin/console doctrine:migrations:migrate

Puis:
	php bin/console doctrine:schema:update --bump-sql
	php bin/console doctrine:schema:update --force

Importer la BDD du dossier README: portfolio
