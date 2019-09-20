# nvimgodocker

### This is the script building the Neovim x Go environment automatically on Alpine Linux Container

## Target Environment

- Linux : Alpine 3.9.0
- Go : 1.12

## Getting Started

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/NasSilverBullet/nvimgodocker/master/install.sh)"
```

## For Example

```sh
docker-compose up -d --build
docker-compose exec app sh -c "$(curl -fsSL https://raw.githubusercontent.com/NasSilverBullet/nvimgodocker/master/install.sh)"
docker-compose exec app nvim
```

### or

```sh
echo 'RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/NasSilverBullet/nvimgodocker/master/install.sh)"' >> Dockerfile
docker-compose up -d --build
docker-compose exec app nvim
```

---

## How to develop the installer

```sh
nvim install.sh
```

## How to run the integration test

```sh
make it
```

