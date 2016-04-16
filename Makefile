# AUTEUR : Jordan BLOUIN
COMPI=./commands/src/execs
STAT=./commands/src/statlib
DYNA=./commands/src/dynalib
BIN=./commands/bin
LIB=./commands/lib
MAIN=main#NOM DU FICHIER A DEFINIR

all: independance statique dynamique

#Règle d'effacement des fichiers en .o
clean:
	-@rm -rf *.o

# Compilation créant un exécutable pour chaque fichier C
independance: inde clean

inde: inde.o
	gcc -o $(BIN)/ls ls.o
	gcc -o $(BIN)/cat cat.o
	gcc -o $(BIN)/cd cd.o
	gcc -o $(BIN)/mkdir mkdir.o
	gcc -o $(BIN)/pwd pwd.o
	gcc -o $(BIN)/du du.o
	gcc -o $(BIN)/rm rm.o
	gcc -o $(BIN)/mv mv.o
	gcc -o $(BIN)/cp cp.o
	gcc -o $(BIN)/chmod chmod.o
	gcc -o $(BIN)/chown chown.o
	gcc -o $(BIN)/chgrp chgrp.o
	gcc -o $(BIN)/echo echo.o

# Compilation en librairie statique intégré à l'exécutable
statique : stat clean

stat : stat.o
	ar cqr $(LIB)/libcommands.a ls.o cat.o cd.o mkdir.o pwd.o du.o rm.o mv.o cp.o chmod.o chown.o chgrp.o echo.o IS_file.o
	ranlib $(LIB)/libcommands.a
	gcc -I$(LIB) -L$(LIB) -O $(STAT)/$(MAIN).c -o $(BIN)/$(MAIN)STAT -lcommands
	
# Compilation en librairie dynamique à chargement explicite
dynamique: dyna clean

dyna: dyna.o
	sudo gcc -shared -o /usr/lib/libcommands.so cat.o cd.o mkdir.o pwd.o du.o rm.o mv.o cp.o chmod.o chown.o chgrp.o echo.o IS_file.o
	sudo cp -f /usr/lib/libcommands.so $(LIB)
	gcc -o $(BIN)/mainDYNA $(DYNA)/main.c /usr/lib/libcommands.so


inde.o :
	gcc -c $(COMPI)/ls.c
	gcc -c $(COMPI)/cat.c
	gcc -c $(COMPI)/cd.c
	gcc -c $(COMPI)/mkdir.c
	gcc -c $(COMPI)/pwd.c
	gcc -c $(COMPI)/du.c
	gcc -c $(COMPI)/rm.c
	gcc -c $(COMPI)/mv.c
	gcc -c $(COMPI)/cp.c
	gcc -c $(COMPI)/chmod.c
	gcc -c $(COMPI)/chown.c
	gcc -c $(COMPI)/chgrp.c
	gcc -c $(COMPI)/echo.c
	
stat.o :
	gcc -c $(STAT)/IS_file.c
	gcc -c $(STAT)/ls.c
	gcc -c $(STAT)/cat.c
	gcc -c $(STAT)/cd.c
	gcc -c $(STAT)/mkdir.c
	gcc -c $(STAT)/pwd.c
	gcc -c $(STAT)/du.c
	gcc -c $(STAT)/rm.c
	gcc -c $(STAT)/mv.c
	gcc -c $(STAT)/cp.c
	gcc -c $(STAT)/chmod.c
	gcc -c $(STAT)/chown.c
	gcc -c $(STAT)/chgrp.c
	gcc -c $(STAT)/echo.c

dyna.o:
	gcc -fPIC -c $(DYNA)/IS_file.c
	gcc -fPIC -c $(DYNA)/ls.c
	gcc -fPIC -c $(DYNA)/cat.c
	gcc -fPIC -c $(DYNA)/cd.c
	gcc -fPIC -c $(DYNA)/mkdir.c
	gcc -fPIC -c $(DYNA)/pwd.c
	gcc -fPIC -c $(DYNA)/du.c
	gcc -fPIC -c $(DYNA)/rm.c
	gcc -fPIC -c $(DYNA)/mv.c
	gcc -fPIC -c $(DYNA)/cp.c
	gcc -fPIC -c $(DYNA)/chmod.c
	gcc -fPIC -c $(DYNA)/chown.c
	gcc -fPIC -c $(DYNA)/chgrp.c
	gcc -fPIC -c $(DYNA)/echo.c