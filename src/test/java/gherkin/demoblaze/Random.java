package gherkin.demoblaze;

import com.github.javafaker.Faker;
public class Random {

    public static String getUsername(){
        Faker faker = new Faker();

        return faker.name().username();
    }

    public static String getPassword(){
        Faker faker = new Faker();

        return faker.number().digits(8);
    }

}
