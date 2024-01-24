
\newpage

#   Sécurisation des applications

Au cours des précédentes pages de ce rapport, nous avons abordé dans un premier temps, d'un point de vue fonctionnel, le projet, ses enjeux et ses objectifs. Puis nous nous sommes dirigés vers la recherche d'une solution, suivi de son implémentation et de la façon dont elle répond au besoin.  
Nous allons maintenant nous intéresser à la sécurité de l'application, afin de déterminer les risques, les évaluer, et mettre en place des actions pour les anticiper, et au besoin les corriger.

##  Analyse des risques de l'application

Le plus simple pour procéder, est d'établir un **Plan de Continuité d'Activité** (PCA), accompagné d'un **Plan de Reprise d'Activité** (PRA). Les deux étant sensiblement la même chose; à partir d'une analyse des risques où nous déterminons des risques liés à la sécurité de notre application, nous les évaluons en fonction de leur impact et probabilité, puis nous proposons des pistes de solutions pour les anticiper et les corriger s'ils sont amenés à se produire. Ainsi, nous retrouvons :

![Analyse des risques de notre application de vente en ligne.](ASSETS/DOCS/IX-Matrice_risques_SF.pdf){width=100%}

\newpage

À ce stade du développement de l'application, nous avons déterminé sept risques de sécurité. Nous retrouvons aussi bien des risques liés à des cyberattaques, comme une attaque par Déni de Service (DDoS / **R4**) qui serait le plus critique pour nous, car celle engendrerait une suspension de service qui aurait des pertes financières ainsi qu'un impact sur la réputation de notre application auprès des clients. Nous retrouvons également des risques liés à des facteurs humains de malveillance, comme une possible ingénierie inverse de la part d'un tiers externe à l'entreprise (**R7**).

Il est possible d'anticiper ces deux risques, en utilisant des technologies et outils dédiés et approuvés qui ont montrés qu'ils étaient efficaces pour le risque **R4**, ou en définissant de façon formelle le cadre de notre application et son utilisation pour le risque **R7**.
Si ces deux risques étaient amenés à se produire, pour le risque **R4**, on pourrait être amenés à suspendre certains services de notre application afin d'éviter à tout prix un vol de données ou un comportement que l'on ne souhaiterait pas, le temps de trouver une solution de contournement avec notre hébergeur. Pour le risque **R7**, il nous faudrait envisager des recours légaux auprès des autorités compétentes.

##  Plan d'audit

À l'instar du *Plan d'Assurance Qualité* évoqué précédemment, il est important de régulièrement revoir notre analyse des risques, en faisant évoluer les risques, leurs évaluations et leurs solutions de prévention et de correction afin qu'elle reflète les besoins et l'actualité du contexte de notre application. Par exemple, si un nouveau type de faille était amené à être découverte sur un de nos services, il nous faudra le prendre en compte afin de garantir la sécurité de notre application.

Pour cela, on propose de réaliser un plan d'audit, qui permet de cadrer les démarches d'évolutions liées à la sécurité. Celui-ci définit les processus et les procédures qui seront mis en œuvre pour identifier et corriger les risques liés à la sécurité de l'application de vente en ligne au cours de son cycle de vie.

### Objectifs

Le plan en question a trois objectifs : 

 -  **Identifier les risques liés à la sécurité de l'application.**
 -  **Évaluer le niveau de sécurité de l'application.**
 -  **Recommander des mesures correctives pour améliorer la sécurité de l'application.**

### Responsabilités

En terme de responsabilités, nous allons rester sur le même fonction que pour le Plan d'Assurance Qualité :

 -  **Le chef de projet est responsable de la coordination de l'audit de sécurité.**
 - **L'équipe de développement est responsable de la mise en œuvre des recommandations de l'audit de sécurité.**

Au fur-et-à-mesure du développement et de la vie de l'application, les risques liés à la sécurité évolueront. Le chef de projet, ou plutôt le **Service Owner** (car nous avons une méthodologie *SCRUM*) se charge d'adapter les risques au contexte et besoins actuels, en proposant des pistes de solution préventive et corrective, ainsi que des consignes de sécurité. Puis, les équipes de développement et de maintenance ont pour charge de respecter ces consignes afin de garantir la sécurité de l'application.

### Activités d'audit

Afin de réaliser un audit de la sécurité de notre application, nous proposons de mettre en place ces processus :

 -  **Évaluation des risques** : les risques liés à la sécurité de l'application seront évalués en utilisant une approche basée sur les menaces et les vulnérabilités (comme effectué auparavant).
 -  **Audit de la conception** : la conception de l'application sera auditée pour s'assurer qu'elle prend en compte les principes de sécurité.
 -  **Audit du code** : le code de l'application sera audité pour s'assurer qu'il est sécurisé.
 -  **Audit de la configuration** : la configuration de l'application sera auditée pour s'assurer qu'elle est sécurisée.
 -  **Audit des tests** : les tests de sécurité de l'application seront audités pour s'assurer qu'ils sont efficaces.

Ces processus, effectués rigoureusement et régulièrement, permettent de maintenir à jour la sécurité de notre application. Certaines activités seront redondantes avec celles du *Plan d'Assurance Qualité*, mais étant effectuées par les mêmes équipes, elles ne perdront pas de temps à effectuer plusieurs fois les mêmes actions.

\newpage

### Planification

Puisque certaines activités d'audit sont similaires à celles de notre *Plan d'Assurance Qualité*, le plus simple est de les réaliser en même temps, c'est-à-dire au moment des jalons avec le client pendant la phase de développement, puis tous les **x** sprints au cours de notre phase de maintien en production et de maintenance. Toutefois, nous souhaitons conserver la possibilité de le réaliser de façon ponctuelle, car il serait impensable d'attendre plusieurs semaines pour prévenir une menace qui pourrait arriver à tout moment.

### Suivi et amélioration continue

Cet audit systématique se fera tout au long de la vie de notre applicaiton. Tous les résultats des tests et audits réalisés de façon préventive seront collectés et analysés, afin que d'éventuelles évolutions ou changements puissent y être apportées.

Avec un plan d'audit de ce type, revu régulièrement, nous espérons minimiser les risques liés à la sécurité de notre application. Le risque zéro, les risques résiduels existeront toujours, c'est pour quoi il est important de les prévenir autant que possible, et à minima, de prévoir des solutions de correction afin de perturber le moins possible le fonctionnement de notre application de vente en ligne.