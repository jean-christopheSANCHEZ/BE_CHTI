# BE_CHTI

Jean-Christphe Sanchez

Yifan Wang

29_4_2020

Etape 1 fait/ Dans le mode debugger Logic analyser montre correctement le signal alternee 



# *OBJECTIF-1 DFT SIMU    Etape2    
  jeux de donnee test fait/
  jeux de donnee offcielle, on a obtenue le resultat attendu



# *OBJECTIF-2 DFT REEL    
Etape3 compteur de points fait/ et gérer le score des 6 joueurs
on a cree ces varaiables pour gerer les scores de 6 joueurs:

int cptOcc[6] = {0,0,0,0,0,0}; //compteur de signal superieur a la valeur attendu

int k[6] = {17,18,19,20,23,24}; //represente chaque joueurs differente

int points[6] = {0,0,0,0,0,0}; //scores de joueurs differents

on peut oberver le tableau de 'points' de tracer les scores de joueurs differents, on se met dans le watch de debugger
de tableau points, on a teste dans le cas de signal mode 0x33 (51), qui marche sans probleme avec les valeurs attendues 
comme  points[0] = 1, points[1] = 2 etc...  On a ainsi teste le cas avec du bruit en mode 0x3E (62), on a obtenue le meme 
resultat qu'avec mode 0x33.




# *OBJECTIF-3 Gérer le son Etape1.2   
En train


fichier mieux organisé/


