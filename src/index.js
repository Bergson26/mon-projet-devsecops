const express = require('express');
const cookieParser = require('cookie-parser');
const csrf = require('csurf');

const app = express();
const PORT = process.env.PORT || 3000;

// Ajout des middlewares de sécurité exigés par Semgrep
app.use(cookieParser());
const csrfProtection = csrf({ cookie: true });
app.use(csrfProtection);

app.get('/', (req, res) => {
  res.send('Application hautement sécurisée déployée avec succès !');
});

app.listen(PORT, () => {
  console.log(`Serveur démarré sur le port ${PORT}`);
});