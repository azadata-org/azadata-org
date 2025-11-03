# Public web frontend

## Development
```shell
npm install
```

```shell
npm start
```

## Deployment
Build frontend, output will be placed in `dist` directory.
```shell
npm run build
```

Ensure deploying from latest merged default branch, updating `BUCKET_NAME` accordingly.
```shell
export COMMIT=$(git log -n 1 --format="%H")
export BUCKET_NAME="my-bucket-name"
aws s3 sync ./dist "s3://${BUCKET_NAME}/${COMMIT}"
```
