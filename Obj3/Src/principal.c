#include "../../common/gassp72.h"
#include "../../common/etat.h"

extern void callback(void );

type_etat etat;

extern int LongueurSon ; //valeur fournie par bruitverre
extern int PeriodeSonMicroSec;//valeur fournie par bruitverre
extern short Son; //valeur fournie par bruitverre

int Periode_PWM_en_Tck=360;

int main(void)
{
	//initialisation etat
	etat.periode_ticks=PeriodeSonMicroSec*72;
	etat.taille=LongueurSon;
	etat.position=0;
	etat.son=&Son;
	
	// activation de la PLL qui multiplie la fréquence du quartz par 9
	CLOCK_Configure();
	// config port PB0 pour être utilisé par TIM3-CH3
	GPIO_Configure(GPIOB, 1, OUTPUT, OUTPUT_PPULL);
	// config TIM3-CH3 en mode PWM
	// initialisation du timer 4
	// Periode_en_Tck doit fournir la durée entre interruptions,
	// exprimée en périodes Tck de l'horloge principale du STM32 (72 MHz)
	Timer_1234_Init_ff( TIM4, etat.periode_ticks);
	// enregistrement de la fonction de traitement de l'interruption timer
	// ici le 2 est la priorité, timer_callback est l'adresse de cette fonction, a créér en asm,
	// cette fonction doit être conforme à l'AAPCS
	Active_IT_Debordement_Timer( TIM4, 2, callback );
	// lancement du timer
	Run_Timer( TIM4 );
	// config port PB0 pour Ãªtre utilisÃ© par TIM3-CH3
	GPIO_Configure(GPIOB, 0, OUTPUT, ALT_PPULL);
	// config TIM3-CH3 en mode PWM
	etat.resolution = PWM_Init_ff( TIM3, 3, Periode_PWM_en_Tck );
while	(1)
	{
	
	}
}
