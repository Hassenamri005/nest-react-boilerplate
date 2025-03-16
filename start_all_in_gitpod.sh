#! /bin/bash
echo "................ [INFO] Preparing BACKEND infrastructure ................"

cd backend/

cat .env.example >> .env

echo -e  >> .env

npm i

docker-compose up --build -d

npm run swagger:ts

echo "[INFO] Preparing Backend infrastructure done."


echo "................ [INFO] Preparing FRONTEND infrastructure ................"
cd ../frontend

rm .env
cat .env.example >> .env
echo -e  >> .env
echo -e VITE_BACKEND_API_URL=$(gp url 6001) >> .env

cp -f ../backend/src/api/myApi.ts ./src/api/myApi.ts

npm i
docker-compose --profile dev up --build -d
echo "[INFO] Preparing FRONTEND infrastructure done."

