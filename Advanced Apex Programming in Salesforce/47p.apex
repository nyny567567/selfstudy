@istest
public static void primitiveTests() {
    Integer v = 0;
    markReferenceStartTime();
    for(Integer x = 0; x<1000000; x++) {}
    markReferenceEndTime();
    markTargetStartTime();
    for(Integer x = 0; x<1000000; x++) {
        v += 5;
    }
    reportResults(1000000);
}