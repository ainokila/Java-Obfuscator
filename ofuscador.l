%{
#include <stdio.h>

unsigned long hash(unsigned char *str);
char* cifra(unsigned long hash);

%}
reservado   "e"|"f"|"."|">"|"<"|"="|"&"|"!"|";"|"+"|"-"|"*"|"/"|"("|")"|"["|"]"|"{"|"}"|String|abstract|assert|boolean|break|byte|case|catch|char|class|const|continue|default|do|double|else|enum|extends|final|finally|float|for|goto|if|implements|import|instanceof|int|interface|long|native|new|package|private|protected|public|return|short|static|strictfp|super|switch|synchronized|this|throw|throws|transient|try|void|volatile|while
nombres     [a-zA-Z_]
numero      [0-9]

%%
{reservado}			                      {printf("%s",yytext);}
"\""([^\n\"\\]*(\\[.\n])*)*"\""       {printf("%s",yytext);} //Formate de cadena "algo"
{numero}+                             {printf("%s",yytext);}
{nombres}+			                      {printf("a%u",hash(yytext));}
" "                                   {printf(" ");}
"\t"                                  {printf("\t");}
"\n"                                  {printf("\n");}

%%

int main(int argc,char *argv[]){
  if(argc == 2){

    yyin=fopen(argv[1],"rt");
    if(yyin == NULL){
      printf("El fichero %s no se puede abrir",argv[1]);
      exit(-1);
    }
    yylex();
    return 0;

  }
}

unsigned long hash(unsigned char *str){
    unsigned long hash = 5381;
    int c;

    while (c = *str++)
        hash = ((hash << 5) + hash) + c;

    return hash;
}
