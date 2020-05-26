
#include "../../common/GFSSP72/gassp72.h" 
#define SYSTICK_PER 1440000 //20ms   72*20 000= 1440 000
#define M2TIR 0xf0b84 //int M2TIR = 985988 calcul DU COURS sous format 32.0
unsigned int cal(short *,int);
vu16 dma_buf[64]; //warning indicates vu16
int cptOcc[6] = {0,0,0,0,0,0};
int k[6] = {17,18,19,20,23,24};
int points[6] = {0,0,0,0,0,0};
//int M2TIR = 985988; //calcul DU COURS

void sys_callback(){
	// Démarrage DMA pour 64 points
	unsigned int tmp_dft = 0;
	Start_DMA1(64);
	Wait_On_End_Of_DMA1();
	Stop_DMA1;
	
	//Duree_Ech_ticks();
	//Init_TimingADC_ActiveADC_ff();
	
	for(int i=0;i<6;i++){
		tmp_dft=cal((short *)dma_buf,k[i]); //changer i
		if(tmp_dft >= M2TIR){
			cptOcc[i]++;  //signal i recu
		}
		else{
			cptOcc[i]=0; //sigal termine avant validation
		}
		if (cptOcc[i] == 3) { //valeur de validation depasse
			points[i]++; //point augmante
			cptOcc[i] = 0; //remet a zero? est-il necessaire
		} 
	}
	
}


int main(void)
{
	// activation de la PLL qui multiplie la fréquence du quartz par 9
CLOCK_Configure();
// PA2 (ADC voie 2) = entrée analog
GPIO_Configure(GPIOA, 2, INPUT, ANALOG);
// PB1 = sortie pour profilage à l'oscillo
GPIO_Configure(GPIOB, 1, OUTPUT, OUTPUT_PPULL);
// PB14 = sortie pour LED
GPIO_Configure(GPIOB, 14, OUTPUT, OUTPUT_PPULL);

// activation ADC, sampling time 1us
Init_TimingADC_ActiveADC_ff( ADC1, 33 ); // on se place dans le cas facile à la valeur 33
Single_Channel_ADC( ADC1, 2 );
// Déclenchement ADC par timer2, periode (72MHz/320kHz)ticks
Init_Conversion_On_Trig_Timer_ff( ADC1, TIM2_CC2, 225 );
// Config DMA pour utilisation du buffer dma_buf (a créér)
Init_ADC1_DMA1( 0, dma_buf );

// Config Timer, période exprimée en périodes horloge CPU (72 MHz)
Systick_Period_ff( SYSTICK_PER );
// enregistrement de la fonction de traitement de l'interruption timer
// ici le 3 est la priorité, sys_callback est l'adresse de cette fonction, a créér en C
Systick_Prio_IT( 3, sys_callback );
SysTick_On;
SysTick_Enable_IT;
while	(1)
	{
	
	}
}

