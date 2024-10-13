# ArtePeruano - NFT Smart Contract

## Descripción

`ArtePeruano` es un contrato inteligente escrito en Solidity que permite la creación, venta y compra de NFTs (tokens no fungibles) que representan arte digital. Cada NFT creado tiene un título, un artista, un URI que apunta a la imagen del arte, y un precio asociado.

Este contrato utiliza el estándar ERC721 para la creación de NFTs y está basado en la biblioteca OpenZeppelin.

## Características

- Crear NFTs de arte digital con título, artista y precio.
- Comprar y transferir los NFTs de arte a través de la blockchain de Ethereum.
- Consultar los detalles de cada NFT, incluyendo el título, artista, URI y precio.
- Recepción de NFTs dentro del contrato inteligente a través de la implementación de `onERC721Received`.

## Funciones del contrato

### `createArt(string title, string artist, string uri, uint256 price)`

Crea un nuevo NFT de arte digital. Requiere los siguientes parámetros:
- `title`: Título del arte.
- `artist`: Nombre del artista.
- `uri`: Dirección URI donde se encuentra la imagen del arte.
- `price`: Precio del NFT en Wei.

### `buyArt(uint256 tokenId)`

Permite comprar un NFT existente enviando Ether. La función verifica que:
- El NFT existe.
- El comprador envía suficiente Ether para cubrir el precio del arte.
- El comprador no sea el propietario actual del arte.

### `getArtDetails(uint256 tokenId)`

Devuelve los detalles del NFT, como título, artista, URI y precio.

## Instalación

1. Clona este repositorio:
    ```bash
    git clone https://github.com/ronaldomtlp-125/TamboTokenSmartContract.git
    ```

2. Instala las dependencias de OpenZeppelin:
    ```bash
    npm install @openzeppelin/contracts
    ```

## Uso

1. Implementa el contrato en la red de Ethereum o en una red de prueba (como Rinkeby o Goerli).
2. Interactúa con el contrato para crear y comprar NFTs de arte.

## Tecnologías utilizadas

- Solidity ^0.8.20
- OpenZeppelin Contracts
- Ethereum blockchain

## Licencia

Este proyecto está licenciado bajo la [MIT License](LICENSE).
