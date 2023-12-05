package aula_inatel.dnd;

import com.intuit.karate.junit5.Karate;

class DnDRunner {
    
    @Karate.Test
    Karate testDnD() {
        return Karate.run("dnd").relativeTo(getClass());
    }    

}
