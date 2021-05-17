package helper;

import com.github.javafaker.Faker;

import java.util.Locale;

public class DataGenerator {
    public static String getRandomEmail(){
        Faker faker = new Faker();
        String email = faker.name().firstName().toLowerCase() + faker.random().nextInt(6,100) + "@1750.com";
        return email;
    }

    public static String getRandomUsername(){
        Faker faker = new Faker();
        String username = faker.name().username() + "1750";
        return username;
    }
}
