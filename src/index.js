const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Faux secret ajouté exprès pour tester Gitleaks (à retirer plus tard si besoin)
// const AWS_SECRET = "AKIAIMW6IVF5RXXXXXXX"; 

app.get('/', (req, res) => {
  res.send('🚀 Application sécurisée déployée avec succès !');
});

app.listen(PORT, () => {
  console.log(`Serveur démarré sur le port ${PORT}`);
});
