gcc -S fac.c
as -o fac.o fac.s
as -o factorial.o factorial.s
gcc -o exec factorial.o fac.o
./exec
echo $?

