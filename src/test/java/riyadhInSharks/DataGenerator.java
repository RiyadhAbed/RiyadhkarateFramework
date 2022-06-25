package riyadhInSharks;

import com.github.javafaker.Faker;

public class DataGenerator { 
	
	/*
	 * This Method is Generates the random Email
	 */

	public static String getEmail() {
		Faker faker = new Faker();
		String email = faker.name().firstName()+faker.name().lastName()+"@gmail.com";
		return email;
	}
	
	public static String getfirstName() {
		Faker faker = new Faker();
		String firstName = faker.name().firstName()+"Alajeele";
		return firstName;
	}
	
	public static String getlastName() {
		Faker faker = new Faker();
		String lastName = faker.name().lastName()+"Abed";
		return lastName;
	}
	
	public static String gettitle() {
		Faker faker = new Faker();
		String title = faker.name().title().toUpperCase();
		return title;
	}
	
	
}
