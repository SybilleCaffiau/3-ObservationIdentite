#/usr/bash


echo "Début du processus de détection de l'identité (étape 3)"

#demande les informations pour executer le programme 
echo "fichier de traces propres ou scenario (.fst) ? "
read scenario
echo "fichier de modele de tâches (résultat de l'étape 1) (.fst) ? "
read model

fstcompose $scenario $model | fstarcsort > ScenarioOK.fst

#compile le programme cpp de detection : remplacer les chemin pour mettre ceux où se trouve la librairie openFst
g++ -std=c++11 -I ../../../EvaluationMaquetteMdT/VerifMaquettesMdTCogtool/testCpp/openfst-1.5.0/src/include analyseIdentite.cpp -L ../../../EvaluationMaquetteMdT/VerifMaquettesMdTCogtool/testCpp/openfst-1.5.0/src/lib -lfst -o myapp

#à revoir pour mettre $scenario à la place de ScenarioOK.fst
./myapp ScenarioOK.fst

	
echo "Fin du processus de detection de l'identité"
