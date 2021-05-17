package conduitApp;
// Runner File - Karate JUnit 5 Runner, to run using single file
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

class ConduitTest {

    @Test
     void testParallel() {
        Results results = Runner.path("classpath:conduitApp")
                .tags("~@ignore")
                //.outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

//    @Karate.Test
//    Karate testTags() {
//        return Karate.run("tags").tags("@debug").relativeTo(getClass());
//    }

}
