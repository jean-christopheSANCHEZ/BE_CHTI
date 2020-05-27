extern short TabSig;

unsigned int cal(short *,int);
int i=0;
int TabDFT[64];

int main(void)
{
	for(i=1;i<64;i++){
		TabDFT[i] = cal(&TabSig, i);
	}
	while(1) {}
}
