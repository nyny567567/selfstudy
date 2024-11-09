public class ThinkingInApex {
    private static Boolean userCacheLoaded = false;
    private static Boolean userIsSpecial = false;
    private static String userTimeZone = null;

    public static Boolean isUserSpecial()
    {
        if(userCacheLoaded) return userIsSpecial;
        catcheUserInfo();
        return userIsSpecial;
    }

    public static String userTimeZone()
    {
        if(userCacheLoaded) return userTimeZone;
        cacheUserInfo();
        return userTimeZone;
    }

    private static void cacheUserInfo()
    {
        if(userCacheLoaded) return;
        User u = [Select UserIsSpecial__c, TimeZoneSidKey
                from User where ID = :UserInfo.getUserId()];
        userIsSpecial = u.UserIsSpecial__c;
        userTimeZone = u.TimeZoneSidKey;
        userCacheLoaded = true;
    }
}