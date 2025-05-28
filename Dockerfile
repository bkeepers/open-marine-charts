FROM maptiler/tileserver-gl:latest

COPY . .

CMD [ "--port", "${PORT:-8080}" "--config", "config.json" ]
