/============================== ***Projet eshelle*** ===============================/
<!-- -->
/*************** Membres du groupe *******************/
<!-- -->
    BLOUIN Jordan
    BOUCHEVREAU Valentin
    GAILLARD Nicolas
    LEVAVASSEUR Quentin
<!-- -->
Commandes Makefile :

        1- Un exécutable par commande :
            $ make independance
            
        2- Librairie statique :
            $ make statique
            
        3- Librairie dynamique :
            $ make dynamique
            
        4- Shell utilisant les exécutables des commandes :
            $ make shell_independance
            
        5- Lier le shell à la librairie statique :
            $ make shell_statique
        
        6- Lier le shell à la librairie dynamique :
            $ make shell_dynamique
            
        7- Supprimer tous les fichiers en .o du dossier courant :
            $ make clean
            
        8- Toutes les commandes de compilation :
            $ make all
        
        9- Lancer l'exécutable gérant un exécutable par command :
            $ make exec_shell_inde
            
        10- Lancer l'exécutable gérant la librairie statique :
            $ make exec_shell_stat
            
        11- Lancer l'exécuatble gérant la librairie dynamique :
            $ make exec_shell_dyna
<!-- -->
Les fichiers sources des commandes se situent dans  ./commands/src
<!-- -->
Les exécutables des commandes se situent dans       ./commands/bin
<!-- -->
Les librairies des commandes se situent dans        ./commands/lib