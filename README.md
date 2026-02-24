# 🏗️ Projet 3 : Pipeline de Déploiement Sécurisée (DevSecOps Workflow)

## 📝 Description
L'objectif est de démontrer comment intégrer la sécurité au cœur du développement logiciel. Ce projet simule une pipeline d'automatisation qui bloque le déploiement si une faille de sécurité est détectée dans le code ou les conteneurs.

## 🏗️ Architecture Technique
* **Plateforme :** GitHub Actions.
* **Cible :** Une application web simple (Node.js) containerisée avec Docker.
* **Workflow :** Commit -> Build -> Security Scan -> Deploy (GHCR).

## 🚀 Fonctionnalités implémentées
1. **Analyse Statique (SAST) :** Utilisation de Semgrep pour trouver des failles dans le code source.
2. **Secret Scanning :** Utilisation de Gitleaks pour empêcher de pousser des mots de passe sur GitHub.
3. **Analyse de Conteneurs :** Utilisation de Trivy pour scanner les vulnérabilités de l'image Docker.

## 🛠️ Stack Technique
* **CI/CD :** GitHub Actions
* **Sécurité :** Semgrep, Trivy, Gitleaks
* **Conteneur :** Docker & GitHub Container Registry
