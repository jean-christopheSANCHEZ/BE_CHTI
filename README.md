# BE_CHTI

Jean-Christphe Sanchez

Yifan Wang

3MIC C année universitaire 2019-2020



Chaque objectif se trouve dans les répertoires correspondants. Les fichiers partagés sont dans le dossier commun.
De plus, le dossier Obj0 comporte l'ensemble des objectifs et du travail fait durant le BE. Les versions finales
des objectifs sont quant à elles dans les dossier correspondants. Nous avons choisi de faire une telle organisation
afin d'avoir des commits explicits pour chaque objectif.




# *OBJECTIF-1 DFT SIMU

  jeux de donnees test fait
  jeux de donnees offciel, on a obtenu le resultat attendu



# *OBJECTIF-2 DFT REEL

compteur de points fait
gérer le score des 6 joueurs fait
on a cree ces varaiables pour gerer les scores de 6 joueurs:

int cptOcc[6] = {0,0,0,0,0,0}; //compteur de signal superieur a la valeur attendu

int k[6] = {17,18,19,20,23,24}; //represente chaque joueurs differente

int points[6] = {0,0,0,0,0,0}; //scores de joueurs differents

Le tableau de 'points' retrace les scores des joueurs differents, on se met dans le watch de debugger
de tableau points, on a teste dans le cas de signal mode 0x33 (51), qui marche sans probleme avec les valeurs attendues 
comme  points[0] = 1, points[1] = 2 etc...  On a ainsi teste le cas avec du bruit en mode 0x3E (62), on a obtenue le meme 
resultat qu'avec mode 0x33.




# *OBJECTIF-3 Gérer le son


Le décalage obtenu est bien 91µsecondes comme vous pouvdez le constater sur le screnn ci-dessous.
![Optional Text](../master/images/screenshot2.png)





Voici le signal le signal sonore obtenu en asm (fichier bruitverre.asm)
![Optional Text](../master/images/screenshot1.png)
