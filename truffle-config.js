module.exports = {
  // Chemin pour enregistrer le fichier JSON
  contracts_build_directory: "./src/artifacts/",

  networks: {
    development: {
      host: "127.0.0.1",     // Localhost
      port: 7545,            // Port Ganache
      network_id: "*",       // Match any network id
    },
  },

  compilers: {
    solc: {
      version: "0.5.9",      // <--- C'est ça qui corrige votre erreur rouge !
    }
  }
};