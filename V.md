
\newpage

#   Passage du POC à l'application finale

La direction nous a demandé de développer une application de e-commerce permettant la vente en ligne, afin de permettre à l'entreprise de diversifier ses créneaux de vente.  
Afin de valider que les choix techniques répondent au besoin, il a été entrepris de réaliser un POC reprenant les fonctionnalités principales de l'application finale.  

Le POC étant maintenant réalisé, il est temps de chercher à déployer l'application finale à partir du POC. Cependant, le POC et notre application finale ont des finalités différentes : un POC est destiné à être utilisé par un faible nombre d'utilisateurs, avec un faible nombre d'interactions. On sait que ce dernier ne va pas avoir un trafic qui évoluer dans le temps, les risques de sécurité sont limités, et les besoins spécifiques des utilisateurs restreints.  
Ainsi, si nous devions penser dès à présent à adapter notre POC pour qu'il réponde à des besoins différents de ceux pour lesquels il a été conçu, on risque de se retrouver avec une solution inadaptée aux besoins de la direction.

Le POC a été conçu avec la finalité de l'application finale dès le début. C'est-à-dire que celui-ci intègre des stratégies et outils pour que l'application finale soit évolutive et résiliente dans le temps. De plus, le terme "application finale" est un peu trompeur, puisque l'application ne sera pas finie lorsqu'elle sera publiée. Une application dispose, comme tout produit, d'un cycle de vie dont son développement et lancement ne représente qu'une partie. Sa maintenance, son évolution et à terme, son décommissionnement, en représente également une autre partie. Dans ce sens, elle est pensée dès le début pour être mise à jour et faire des changements rapide pour nous adapter à de nouveaux besoins et exigences.

Afin d'anticiper ce passage du POC à l'application finale, nous avons établi les principaux risques que l'on pourrait rencontrer, en les évaluant, et en y apportant une solution préventive et corrective, ce qui nous permet de les anticiper. Ainsi, nous en retrouvons six :

![Matrice des risques du passage du POC à l'application finale.](ASSETS/DOCS/V-Matrice_risques_POC_SF.pdf){width=100%}

Voici le détail des risques. Nous en retrouvons trois liés à l'infrastructure de l'application finale :

 -  **R1** : comme évoqué, le POC et l'application finale ont des finalités différentes. Là où le POC à affaire à un nombre limité d'utilisateurs et d'interactions, l'application finale doit pouvoir se mettre à l'échelle, s'adapter pour faire face à un éventuel trafic important, sans gêner la navigation pour les utilisateurs.
 -  **R2** : de plus, un POC est généralement conçu pour être résilient aux pannes de composants individuels, là où l'application doit être capable de résister à des pannes plus importantes, comme un fournisseur cloud par exemple. Pour cela, on peut faire appel à des techniques de redondance et de basculement pour anticiper un tel problème.
 -  **R3** : enfin, l'application finale se doit d'être disponible et assurer une haute disponibilité 24h/24 et 7j/7, même en cas de panne d'un service. Pour cela, il est intéressant d'utiliser des techniques de surveillance de l'état de santé des services, et de récupération d'urgence. Avec le risque R2, on peut ainsi mettre en place une infrastructure nous permettant d'être disponibles à tout instant.

\newpage

En plus de ces risques liés à l'infrastructure, nous déterminons des risques plus fonctionnels :

 -  **R4** : le POC se veut avoir un faible nombre d'interactions, là où l'application finale serait exposée sur internet et avec un volume variable d'utilisateurs. Étant un site hébergeant des données clients et traitant avec des données financières, elle est une cible de choix pour les cybermenaces. Il est important d'utiliser des outils nous permettant de détecter d'éventuelles vulnérabilités pour pouvoir les anticiper. Il faut également avoir des protections contre les cyberattaques comme celles par déni de service, afin de garantir la sécurité des données.
 -  **R5** : bien que celui-ci soit moins critique si avéré, nous sommes sur un nouveau créneau pour l'entreprise. Il est donc important de proposer une expérience agréable aux utilisateurs pour développer l'activité e-commerce de Breizhsport. Nous souhaitons donc nous assurer que toutes les fonctionnalités fonctionnent comme prévu, et que les performances de l'application permettent aux clients d'effectuer leurs achats sans techniques.
 -  **R6** : enfin, puisque nous sommes une entreprise française et destinée à un public français, nous devons nous conformer au *RGPD*, Réglementation Générale pour la Protection des Données. Pour nous aider, nous pouvons faire appel à un *DPO*[^11] qui peut nous aider dans cette tâche, ainsi que la *CNIL*[^12].

Ces risques, avec leurs solutions de prévention et de correction, nous permettent d'anticiper et de prévenir certains problèmes que nous pourrions rencontrer lors du passage à l'application finale.

[^11]: DPO - Data Protection Officer - Délégué à la Protection des Données
[^12]: CNIL - Commission Nationale de l'Informatique et des Libertés