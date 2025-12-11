# 📱 Hello World DApp - Flutter & Ethereum

**MAICHNI Hajar**
*   Master's Student in Computer Science and Embedded Systems 
Email : hajar.maichni01@gmail.com
Linkedin: https://www.linkedin.com/in/hajar-maichni-039669340/

## 📖 Project Overview

This project is a **Decentralized Application (DApp)** demonstrating the integration between a **Flutter** mobile frontend and an **Ethereum** blockchain backend.

The goal was to bridge the gap between Mobile Development and Web3 technologies. The app allows users to interact with a Smart Contract deployed on a local blockchain (Ganache) to read and update a state variable permanently.

## 🚀 Key Features

*   **Smart Contract:** A Solidity contract (`HelloWorld.sol`) that stores and updates a name on the blockchain.
*   **Local Blockchain:** Uses **Ganache** as a personal Ethereum blockchain for testing.
*   **Deployment:** Automated contract migration using **Truffle Suite**.
*   **Flutter Frontend:** A clean, reactive UI built with Flutter.
*   **Web3 Integration:**
    *   Uses `web3dart` to communicate with the JSON-RPC API.
    *   Handles signed transactions using a private key.
    *   Real-time state updates using the `Provider` pattern.
    *   Optimized for HTTP connection (compatible with Chrome/Windows/Android).

## 🛠️ Tech Stack

*   **Frontend:** Flutter (Dart)
*   **Smart Contract:** Solidity (v0.5.9)
*   **Blockchain Tools:** Truffle, Ganache (GUI)
*   **Libraries:** `web3dart`, `provider`, `http`

## ⚙️ Installation & Setup

Follow these steps to run the project locally:

### 1. Prerequisites
*   Node.js & NPM
*   Flutter SDK
*   Ganache (GUI)

### 2. Clone the Repository
```bash
git clone https://github.com/YOUR-USERNAME/Flutter-Blockchain-Hello.git
cd hello_world