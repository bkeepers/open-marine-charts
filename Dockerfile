FROM maptiler/tileserver-gl:latest

COPY . .

CMD [ "--config", "config.json" ]
