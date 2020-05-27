#include "../../common/gassp72.h"
#include "../etat.h"

void callback(void );
type_etat etat;
int main(void)
{
	// activation de la PLL qui multiplie la fréquence du quartz par 9
CLOCK_Configure();
// config port PB0 pour être utilisé par TIM3-CH3
GPIO_Configure(GPIOB, 0, OUTPUT, ALT_PPULL);
// config TIM3-CH3 en mode PWM
etat.resolution = PWM_Init_ff( TIM3, 3, 1/72000000 );
// initialisation du timer 4
// Periode_en_Tck doit fournir la durée entre interruptions,
// exprimée en périodes Tck de l'horloge principale du STM32 (72 MHz)
Timer_1234_Init_ff( TIM4, 72*10*3 );
// enregistrement de la fonction de traitement de l'interruption timer
// ici le 2 est la priorité, timer_callback est l'adresse de cette fonction, a créér en asm,
// cette fonction doit être conforme à l'AAPCS
Active_IT_Debordement_Timer( TIM4, 2, callback );
// lancement du timer
Run_Timer( TIM4 );
while	(1)
	{
	
	}
}
