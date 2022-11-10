# Project


## General draft designed before_project:


- site internet de suivi des positions boursières
  - feature visualisation des positions
  - feature visualisation du reporting
  - feature notifications: envoie des notifications sur télégram
  - feature actualité:
    - OST
    - dividende
    - résultats
    - AG
    - news
  - fiche valeur:
    - toutes les infos basiques sur une valeur
    - 
    - carnet de suivi des stratégies (avec du markdown si possible)
  - automatisation des taches
    - feature "petit Aller retour sur les valeurs non soumises à la TTF", par exemple:
        - position initiale: 20 Guerbet avec un pru de 26,27€
        - vente de 4 Guerbet à 26,5€
        - 5 jours après, achat de 4 Guerbet à 25,5€ nouveau de pru de 26,14€
        - gain de l'aller retour: 2,6€... tâche qui gagnerait à être automatiser
      - Pour cela: définir une fourchet autour du PRU, et les seuils associés: position minimale voulu, vente à partir de, achat à partir de, position maximale acceptée

- bot de trading pour faire des simulations:
    - branchement aux API de suivi des cours
    - implémentations de stratégies diverses
    - modélisation de portefeuilles d'actif

## Features

Choice between those feature:
  - login
  - get api response to display real time course of a value
  - fiche valeur



### feature login:

  - login page
  - connection method
  - user database

https://hexdocs.pm/phoenix_live_view/security-model.html
https://www.leanpanda.com/blog/authentication-and-authorisation-in-phoenix-liveview/



### feature stock API

Creation MVP:
  - display last course (day before) for every stocks in the wallet

Plusieurs API trouvées:
  - Quandle
  - AlphaVantage:
    - https://www.alphavantage.co
    - API key: FY4C9ED2UM6PLD1F
    - curl -v "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=GLE.PA&apikey=FY4C9ED2UM6PLD1F"
  - Boursorama (mail pro):
    - https://developer.boursorama.com/connexion?org=/dsp2/api/specifications


1) gestion des API dans des fichiers à part (quandle.ex, alpha_vantage.ex)
2) algo de chargement des données de l'API à mettre dans share_price_puller.ex:
   everyday at 10 am:
   for value <- wallet do
    data = AlphaVantage.getData(value)
    DataBase.store(data)




