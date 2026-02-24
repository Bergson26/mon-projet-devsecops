# Utilisation d'une image de base officielle et legere
FROM node:22-alpine

# Creation du repertoire de travail
WORKDIR /usr/src/app

# Copie des fichiers de dependances
COPY package*.json ./

# Patch de securite : mise a jour globale de npm pour eliminer ses CVE internes
RUN npm install -g npm@latest

# Installation des dependances (en ignorant les devDependencies)
RUN npm install --only=production

# Copie du code source
COPY src/ ./src/

# Exposition du port
EXPOSE 3000

# Demarrage de l'application avec un utilisateur non-root
USER node
CMD [ "npm", "start" ]