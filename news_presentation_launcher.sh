#!/bin/bash
service redis_6379 start
service mongod start

pip install -r requirements.txt

cd web_server/client
npm install
npm run build

cd ../server
npm install
npm start &

cd ../../backend_server
python service.py &

cd ../news_recommendation_service
python recommendation_service.py &


echo "=================================================="
read -p "PRESS [ENTER] TO TERMINATE PROCESSES." PRESSKEY

kill $(jobs -p)
