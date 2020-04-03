#include<stdlib.h>
#include<stdio.h>

unsigned int M2(short *,int);
int i=0;
int dft;
extern short TabSig;
int tabdft[64];

int main(void)
{

for(i=1;i<64;i++){

tabdft[i] = M2(&TabSig, i); //format 1.15 * 1.15 ,donc resultat de format 2.30   
//format a.b, a est partie entiere,b est de la partie fonctionnaire,il faut a+b = 16 ou 32 ou 64 , ca depend
//mais je ne comprends pas a qoui ca sert le tabsig
//calcul.s fournit lq fonction M2
//dft.s fournit ri_im pour calcul.s
//je comprends pas tabsig
//on n'utilise pas de float a ete interdit par le prof pour certaine raison que je sais pas ;
}
	while(1) {}
}