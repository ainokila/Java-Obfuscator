public class Coche{

  private int numRuedas;
  private float maxVelocidad;
  private String color;
  private String matricula;
  private String marca;
  private int numeros[100];


   public Coche(int rueda,float velocidad,String color,String matricula,String marca){
     this.numRuedas = rueda;
     this.maxVelocidad = velocidad;
     this.color = color;
     this.matricula = matricula;
     this.marca = marca;
   }

   public Coche(){
     this.setNumRuedas(4);
     numRuedas = 4 ;
     this.maxVelocidad = 200.0f;
     this.color = "Transparente";
     this.matricula = "0000";
     this.marca = "Blanca";
     for(int i = 0; i < 100 ; i++){
	numRuedas++;
     }
   }

   public int getNumeroRuedas(){
     return this.numRuedas;
   }

   public void setNumRuedas(int ruedas){
     this.numRuedas = ruedas;
   }


}
