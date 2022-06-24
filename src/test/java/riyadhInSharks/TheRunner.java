package riyadhInSharks;

import com.intuit.karate.junit5.Karate;

public class TheRunner { 
	@Karate.Test
	Karate testUser() { 
		return Karate.run().tags("@getPrimaryAccount").relativeTo(getClass());
		
	}

}
