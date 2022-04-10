docker build -t shaibad/multi-client:latest -t shaibad/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t shaibad/multi-server:latest -t shaibad/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t shaibad/multi-worker:latest -t shaibad/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push shaibad/multi-client:latest
docker push shaibad/multi-server:latest
docker push shaibad/multi-worker:latest

docker push shaibad/multi-client:$SHA
docker push shaibad/multi-server:$SHA
docker push shaibad/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployemnt server=shaibad/multi-server:$SHA