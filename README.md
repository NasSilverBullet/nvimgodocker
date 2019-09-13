# nvimgodocker

in development ...

## Environment

- os : alpine3.9
- go : 1.12

## How to use

```sh
docker-compose up -d --build
docker-compose exec app sh -c "$(curl -fsSL https://raw.githubusercontent.com/NasSilverBullet/nvimgodocker/master/install.sh)"
docker-compose exec app nvim
```

## How to develop installer

```sh
nvim installer.sh
```

## integration test
```sh
make it
```
