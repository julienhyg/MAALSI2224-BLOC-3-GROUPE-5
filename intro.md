\newpage

#   Introduction

![Logo de Breizhsport](ASSETS/IMAGES/logo_breizhsport.png){width=30%}

La direction de Breizhsport, société spécialisée dans la vente de matériel de sport, a décidé d'étendre ses activités aux travers du lancement d'une plateforme en ligne de e-commerce sur internet. Située à Rennes en région bretonne, elle dispose de bureaux à Brest et Lorient, d'une usine de fabrication sur Brest, ainsi que des magasins dans les principales villes de Bretagne : Brest, Quimper, Lorient, Vannes, Rennes, Saint-Malo, etc.    
Suite à cette envie de s'étendre, elle a demandé à sa DSI[^1] de moderniser le système d'information existant, ainsi que les pratiques de développement qui n'ont guère évoluées lors de la dernière décenie. Celle-si se compose d'environ cinquant personnes, dont vingt-cinq développeurs, cinq chefs de projets, dix administrateurs système, cinq SRE et cinq responsables.  

À partir de l'existant, à savoir des applications en PHP/MySQL sur des serveurs virtuels chez un hébergeur français et méthodologie de cycle en V, la direction souhaite orienter la modernisation du système d'information vers une architecture "Cloud Native" avec déploiement sur un cloud public, tout en profitant de l'occasion pour industrialiser un environnement de développement en y incluant un dépôt de code source basé sur Git, ainsi qu'une pipeline de CI/CD[^2].  

Au cours de ce rapport, nous définirons dans un premier temps les nouveaux principes d'architecture, de conception, de déploiement et de maintenance des applications du futur SI[^3] de Breizhsport. Puis, nous verrons l'application développée à partir de ses principes.

[^1]: Direction des Systèmes d'Informations
[^2]: CI/CD - Continuous Integration, Continuous Development
[^3]: SI - Système d'Informations