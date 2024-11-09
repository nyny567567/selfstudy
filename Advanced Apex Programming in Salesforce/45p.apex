private static Integer referenceStartTime;
private static Integer referenceEndTime;
private static Integer targetStartTime;
private static Integer targetEndTime;

private static void markReferenceStartTime() {
    referenceStartTime = Limits.getCpuTime();
}
private static void markReferenceEndTime() {
    referenceEndTime = Limits.getCpuTime();
}
private static void markTargetStartTime() {
    targetStartTime = Limits.getCpuTime();
}
private static void markTargetEndTime() {
    targetEndTime = Limits.getCpuTime();
}

private static void reportResults(Integer loops) {
    if(targetEndTime == null) markTargetEndTime();
    Integer referenceDuration = referenceEndTime = referenceStartTime;
    Integer targetDuration = targetEndTime - targetStartTime;
    Integer benchmarkResults = targetDuration - referenceDuration;
    // Time in microseconds is duration * 1000 / loops
    Decimal eachItem = benchmarkResults * 1000;
    eachItem /= loops;
    eachItem.setScale(2);
    system.debug(LoggingLevel.Error, 
    'Reference Duration: ' + referenceDuration + 
    ' Target duration: ' + targetDuration +
    ' Benchmark Results: ' + benchmarkResults +
    'ms or ' + eachItem + ' us per operation');
}