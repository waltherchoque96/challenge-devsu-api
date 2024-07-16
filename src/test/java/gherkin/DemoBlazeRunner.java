package gherkin;

import com.intuit.karate.junit5.Karate;

public class DemoBlazeRunner {

    @Karate.Test
    Karate testDemoBlaze() {
        return Karate.run("classpath:gherkin/demoblaze").relativeTo(getClass());
    }

}
