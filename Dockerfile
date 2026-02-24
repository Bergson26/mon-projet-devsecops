# Utilisation d'une image de base officielle et légère
FROM node:22-alpine

# Création du répertoire de travail
WORKDIR /usr/src/app

# Copie des fichiers de dépendances
COPY package*.json ./

# Installation des dépendances (en ignorant les devDependencies)
RUN npm install --only=production

# Copie du code source
COPY src/ ./src/

# Exposition du port
EXPOSE 3000

# Démarrage de l'application avec un utilisateur non-root pour plus de sécurité
USER node
CMD [ "npm", "start" ]
