#!/usr/bin/env bash

additionalArgs=""
if [[ -e "${HOME}/.config/swdc/services.yml" ]]; then
  additionalArgs=" -f ${HOME}/.config/swdc/services.yml"
fi

FILE=$(mktemp)
DB=$2


echo "cat $3 | mysql -uroot -p${MYSQL_ROOT_PASSWORD} $DB" > "$FILE"



#watch -n0.1 "docker-compose -f${DOCKER_COMPOSE_FILE} $additionalArgs exec -T -e COLUMNS=\"$(tput cols)\" -e LINES=\"$(tput lines)\" -u 0 mysql mysql -uroot -p${MYSQL_ROOT_PASSWORD} $DB -e \"$CONTENT\""