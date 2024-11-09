public Static Boolean firstcall = false;

if(!myclass.firstcall) {
    // First call into trigger
    myclass.firstcall = true;
} else {
    // Subsequent call into trigger
}