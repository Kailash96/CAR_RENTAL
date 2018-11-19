package carmgt;
	import javax.persistence.Entity;
	import javax.persistence.Id;

	@Entity
	public class Addcar{
		private int id;
		private String make;
		private String model;
		private String color;
		private String reg;	
		private String engine;	
		private String transmission;	
		private String year;
		private String age;

		public Addcar(){

		}
		@Id
		public int getId(){
		return id;
		}
		public void setId(int id){
		this.id = id;
		}

		public String getMake(){
		return make;
		}
		public void setMake(String make){
		this.make = make;
		}

		public String getModel(){
		return model;
		}
		public void setModel(String model){
		this.model = model;
		}

		public String getColor(){
		return color;
		}
		public void setColor(String color){
		this.color = color;
		}
		
		public String getReg(){
		return reg;
		}
		public void setReg(String reg){
		this.reg = reg;
		}

		public String getEngine(){
		return engine;
		}
		public void setEngine(String engine){
		this.engine = engine;
		}

		public String getTransmission(){
		return transmission;
		}
		public void setTransmission(String transmission){
		this.transmission = transmission;
		}

		public String getYear(){
		return year;
		}
		public void setYear(String year){
		this.year = year;
		}

		public String getAge(){
		return age;
		}
		public void setAge(String age){
		this.age = age;
		}
}
