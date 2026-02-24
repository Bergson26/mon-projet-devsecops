# Projet : Pipeline de Déploiement Sécurisée (DevSecOps Workflow)

## Réalisé par : Bergson Jean-Michel

### À propos de ce projet
Ce projet de portfolio illustre la conception et l'administration d'une infrastructure d'intégration et de déploiement continu (CI/CD) intégrant la sécurité de manière proactive (approche Shift-Left). L'architecture mise en place automatise l'audit des environnements de développement pour bloquer toute mise en production vulnérable. 

L'objectif est de démontrer de solides compétences en administration réseau, système et cybersécurité, en préparation d'un cursus Bac+5 dans ces domaines à partir de septembre 2026. Le workflow inclut l'analyse statique du code pour prévenir l'exposition de secrets et les failles logiques (comme l'absence de protection CSRF), couplée à une analyse dynamique de l'environnement d'exécution. 

Le projet démontre une réelle capacité d'administration système à travers le durcissement du système d'exploitation du conteneur (Alpine Linux) et la gestion stricte des versions logicielles (Node.js et npm) pour neutraliser les vulnérabilités publiques (CVE) identifiées par les outils de scan. Le déploiement final et automatisé vers le registre GitHub Container Registry valide la maîtrise de l'administration d'infrastructures modernes et la sécurisation des flux de livraison applicative de bout en bout.

### Architecture Technique
* Plateforme : GitHub Actions.
* Cible : Application web (Node.js) conteneurisée avec Docker.
* Workflow : Commit -> Build -> Security Scan -> Deploy (GHCR).

### Outils de Sécurité Implémentés
1. Analyse Statique (SAST) : Utilisation de Semgrep pour trouver des failles dans le code source (ex: absence de middleware CSRF).
2. Secret Scanning : Utilisation de Gitleaks pour empêcher de pousser des mots de passe ou des clés d'API sur GitHub.
3. Analyse de Conteneurs : Utilisation de Trivy pour scanner les vulnérabilités (CVE) de l'image Docker de base et des paquets internes.

### Démonstration et Captures d'Écran
Ce dépôt contient plusieurs preuves de concept démontrant le mécanisme de blocage de la pipeline en cas de code vulnérable :

* Étape 1 : Blocage par Gitleaks
La pipeline a volontairement été bloquée suite à l'introduction d'un faux secret AWS dans le code source. L'outil a empêché le déploiement de ce secret.

* Étape 2 : Blocage par Semgrep
Une fois le secret retiré, l'analyseur statique a bloqué la compilation en détectant l'absence de protection CSRF dans l'application Node.js. Un patch de sécurité a été appliqué pour ajouter les middlewares requis.

* Étape 3 : Blocage par Trivy
Lors de la conteneurisation, le scanner Trivy a identifié des vulnérabilités critiques liées au système d'exploitation Alpine obsolète et au gestionnaire de paquets npm.

* Étape 4 : Déploiement réussi
Après la remédiation complète (mise à jour vers Node 22 et patch de npm), les quatre étapes de sécurité sont passées au vert, permettant la publication automatisée de l'image Docker sécurisée sur le registre GitHub (GHCR).

