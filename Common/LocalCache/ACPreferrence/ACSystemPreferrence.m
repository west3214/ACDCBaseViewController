//
//  ACSystemPreferrence.m

#import "ACSystemPreferrence.h"
@implementation ACSystemPreferrence

+(void)setObject:(id)obj forKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([key isEqualToString:ACUserLoginData]) {
        NSString *jsonStr = [NSDictionary ll_convertToJsonStringWithDictionary:obj];
        [defaults setObject:jsonStr forKey:key];
    }else{
        [defaults setObject:obj forKey:key];
    }
    [defaults synchronize];
}
+(id)objectForKey:(NSString *)key{
    
    if ([key isEqualToString:ACUserLoginData]) {
        NSString *dicStr = [[NSUserDefaults standardUserDefaults] objectForKey:key];
        if (dicStr.length > 5) {
            NSDictionary *dic = [NSString ll_transportToDictionaryWithJsonString:dicStr];
            ACUserModel *userModel = [ACUserModel mj_objectWithKeyValues:dic];
            return userModel;
        }else{
            return nil;
        }
    }
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
}
+(void)removeObjectForKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)clearPreferrence{
    //方法一
    
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    /*
    //方法二
    NSDictionary * dict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (id key in dict) {
        if (![(NSString *)key containsString:@"UserHasLoginAndClickedThisButton_"]) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
     */
  
}


@end
