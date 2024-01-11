\newpage

#   Mise en place d'une chaîne CI/CD

Comme nous l'avons abordé auparavant, suite à une demande de la direction, nous souhaitons passer d'un système de test, de validation et de déploiement manuel à un système d'intégration et de déploiement continue (CI/CD). Bien que similaires, les deux ont des objectifs différents que nous allons présenter par la suite.

##  CI - L'intégration continue

De l'anglais *Continuous Integration*, il faut le voir comme un ensemble de pratiques pour vérifier que les modifications de code-source que l'on fait n'amène pas de régression dans l'application. Dans notre cas, nous allons ajouter une brique logicielle automatisant certaines tâches, comme de la compilation, des tests unitaires et fonctionnels, des tests de performance, etc. À chaque changement dans le code-source, cette brique va s'exécuter et produire un ensemble de résultats. Cela nous permet de ne pas oublier d'éléments, de corriger des éventuelles erreurs, et par conséquent améliorer la qualité du code tout en réduisant la dette technique.  

Pour pouvoir la mettre en place, il faut que notre code-source soit partagé (sur GitLab dans notre cas), et que des tests d'intégration soient développés pour valider l'application. Il nous faut également un outil d'intégration continue, les plus connus étant *Jenkins*, *Travis CI*, *GitLab CI* et *CruiseControl*. Dans notre cas, nous avons utilisé GitLab CI pour son intégration avec la forge GitLab.

Le principe est le suivant :

![Schéma de principe d'une chaîne d'intégration continue](ASSETS/IMAGES/IV/CI.png){width=100%}

 -  **1a**/**1b** : Dans un premier temps, il nous faut récupérer les dépendances de nos outils (et les bonnes versions), comme par exemple *Composer* pour *PHP*. Cette étape est optimisée en détectant les changements sur les fichiers de configuration.

\newpage

 -  **2** : Cette étape consiste à tester les *CVE*, les *Common Vulnerabilities and Exposures* sur notre code mais aussi les dépendances. Il faut le voir comme des séries d'essais pour détecter si notre code est concerné par des failles connues de sécurité.
 -  **3** : Enfin, les dépendances sont mises à jour, ou supprimées, au besoin.
 -  **3a**/**3b** : À cette étape, nous construisons les images *Docker* à partir des dépendances testées auparavant.
 -  **3c**/**4a**/**4b** : Une fois en possession de l'image, nous allons effectuer plusieurs essais dessus. Pour commencer, nous allons utiliser un *Linter*, un outil mettant en évidence les erreurs de syntax et de convention de code pour limiter les erreurs et la dette technique. Puis, le fonctionnement ainsi que les CVE de l'image sont testées.

Par la suite, nous avons un embranchement qui s'exécute en parallèle, un pour le *front-end*, l'autre pour le *back-end*.

 -  **5a-a** à **5c-b** : Ces étapes sont identiques mais sur des données différentes. On souhaite à nouveau "linter" le code avec des technologies comme *ESLint* pour le *front-end*, et *PHP-cs-Fixer* pour le *back-end*. À la suite de ça, la complexité du code est analysée, ainsi que les *code-smells*, qui sont des erreurs liées à des mauvaises pratiques qui peuvent créer des défauts. Cela est fait dans un but de sécuriser l'application, et de prévenir la dette technique.
 -  **6a-a**/**6a-b** : À cette étape, nous pouvons effectuer des tests unitaires, c'est-à-dire tester des éléments en particulier de notre application. Ces tests nous permettent de valider le bon fonctionnement et prévenir d'éventuels problèmes.
 - **6b-a**/**6b-b** : Côté *back-end*, nous effectuons un *test de contrat d'API* pour vérifier que notre API répond bien à nos attentes, en utilisant un outil dédié comme *Newman*. Côté *front-end*, nous avons un test *End-To-End* (E2E), qui ressemble aux tests unitaires que nous avons effectués auparavant, mais cette fois-ci sur l'ensemble de l'application. Cela inclut des tests sur l'interface utilisateur (GUI), des tests d'intégration, de bases de données, de performance, etc. Plusieurs technologies existent pour cela, comme *Cypress* ou *Selenium*.
 -  **6c-a**/**6c-b** : Une fois tous les tests de fonctionnalité effectués et validés, nous pouvons effectuer un test de performance de l'application, en utilisant *K6* ou *Lighthouse*.
 -  **6d-b** : Uniquement sur la partie *front-end*, nous effectuons un test de régression visuelle avec *BackspotJS*, pour nous assurer que l'ajout ou la modification de fonctionnalité n'altère pas visuellement une autre fonctionnalité, et sous différents scénarii (pc, mobile, avec un lecteur d'écran, etc.).
 -  **7-a**/**7-b** : Une fois que toutes les étapes ont été validées, nous pouvons publier l'image qui a été générée auparavant. Avec cette étape, une nouvelle version est crée et incrémentée en fonction des changements. De plus, un changelog est produit afin de permettre à tout le monde de suivre les changements associés à cette version.  
 

\newpage


##  CD - Le déploiement continu

Toujours de l'anglais *Continuous Deployment*, est une pratique de développement logiciel dans laquelle le logiciel est généré de manière à pouvoir être mis en production à tout moment. On va différencier *Distribution Continue* de *Déploiement Continu*. Pour ce faire, un modèle de distribution continue implique des environnements de test similaires à ceux de la production. Les nouvelles générations réalisées dans le cadre d'une solution de distribution continue sont automatiquement déployées dans un environnement de test automatique d'assurance qualité qui recherche les erreurs et les incohérences. Une fois que le code a réussi tous les tests, la distribution continue nécessite une intervention humaine pour approuver le déploiement en production. Le déploiement lui-même est ensuite exécuté par l'automatisation.

Le déploiement continu fait aller un peu plus loin l'automatisation et supprime l'intervention manuelle. Les tests et les développeurs sont considérés comme suffisamment fiables pour qu'aucune approbation de la mise en production ne soit pas nécessaire. Si les tests aboutissent, le nouveau code est considéré comme approuvé, et le déploiement en production a lieu.

Le déploiement continu est le résultat naturel d'une distribution continue efficace. Finalement, l'approbation manuelle apporte peu ou pas de valeur et ne fait que ralentir les choses. À ce stade, elle est supprimée, et la distribution continue devient un déploiement continu.

Il existe plusieurs outils permettant de faire du déploiement continu, le plus populaire étant probablement **Kubernetes**. Ci-dessous, nous pouvons retrouver un schéma de principe d'une pipeline CD :

![Schéma de principe d'une chaïne de déploiement continu](ASSETS/IMAGES/IV/CD.png){width=100%}

Nous allons reprendre l'exemple d'une nouvelle fonctionnalité qui a été développée sur l'environnement de développement, et qui a été intégrée.

 -  **1** : Le déploiement est réalisé automatiquement à l'aide d'*Ansible* sur l'environnement de test. Il est également possible d'utiliser *Autok8s* qui facilite et automatise l'utilisation de *Kubernetes*.
 -  **2** : De façon similaire, le déploiement est réalisé manuellement sur l'environnement de recette.
 -  **3** : Une fois réalisé, le déploiement est automatiquement réalisé sur l'environnement de pré-production, toujours à l'aide d'*Ansible*.
 -  **4** : Il s'agit maintenant de récupérer les données de production en vue de tester la solution à déployer. Cependant, dans le respect du *RGPD*[^10], il est nécessaire de les anonymiser ou à minima de les pseudonymiser.
 -  **5a**/**5b**/**5c**/**5d** : À l'instar de la pipeline *CI*, on souhaite procéder à des tests sur la solution à déployer, à commencer par des tests unitaires réalisés avec des outils comme *JEST* ou *Vitest*. Une fois les essais unitaires complétés, on effectue des essais sur l'ensemble de la solution (E2E) grâce à *Cypress*, avant de procéder à des tests de performance à l'aide de *K6* ou encore *Lighthouse*. Enfin, nous retrouvons quelques tests de non régression visuelle, grâce à *BackspotJS*.
 -  **6** : Ultime action sur l'environnement de pré-production, on effectue des essais de déploiement sur l'environnement de production, en vérifiant notamment les routes critiques de l'*API*.
 -  **7** : Maintenant que notre solution à passé avec succès les essais de pré-production, il est temps de la déployer en production. Pour cela, soit on l'effectue automatiquement pour réduire le *time-to-market* et proposer les nouvelles fonctionnalités ou correction au plus vite, soit on peut déployer manuellement, ce qui est pratique pour des raisons marketing. Par exemple, X fonctionnalité sera disponible à telle date.
 -  **8**/**9** : Le déploiement complété, on réalise des essais de performance sur l'environnement de production, toujours avec *K6* ou *Lighthouse*. On en profite pour réaliser des tests suite au déploiement en vérifiant les routes et parcours critique de la solution et de son *API*.
 -  **10** : Cette étape est optionnelle et on souhaite l'éviter. Néanmoins si l'on découvre des problèmes sur la solution suite à son déploiement en production, il faut pouvoir restaurer une version antérieur de la solution.

Ces étapes de chaîne de déploiement continu permettent de fournir de façon automatisée et fréquente de nouvelles versions de la solution, tout en effectuant des essais pour perturber le moins possible la production, avec la possibilité de revenir en arrière si besoin.

### Intégration sur le POC

Pour les différentes étapes vues précédemment, voici les outils que nous allons utiliser :

 -  *Lintage* de code : [**Hadolint**](https://github.com/hadolint/hadolint)
 -  Test des vulnérabilitées des dépendances : [**DependencyCheck**](https://github.com/jeremylong/DependencyCheck)
 -  Tests de sécurité et pentests : [**Zaproxy**](https://www.zaproxy.org/getting-started/)
 -  Tests concernant la qualité du code : [**Sonarqube**](https://www.sonarsource.com/products/sonarqube/)
 -  Tests de performance : [**K6**](https://k6.io/)

[^10]: RGPD - Réglementation Générale sur la Protection des Données