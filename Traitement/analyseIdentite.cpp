#include <fst/fstlib.h>

using namespace fst;


int main(int argc, char *argv[]){	
	
	StdVectorFst *scenario = StdVectorFst::Read(argv[1]);
	int n=0;
	
	//on compte le nombre d'état dans l'automate
	for (StateIterator<StdFst> siter(*scenario); !siter.Done(); siter.Next()) {
		n++;
	}
	
	if(n==0){	
		cout << "Il y a des erreurs de coherence, passez à l'étape 4 pour une analyse plus profonde" << endl;
	}
	else{
		cout << "Vos traces sont cohérentes avec le modèle de tâches inutile d'aller à l'étape 4" << endl;
	}

	return 0;

}