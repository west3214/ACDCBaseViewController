//
//  ACSystemPreferrence.h


#import <Foundation/Foundation.h>



/**<#mark#>*/
#define ACUserLoginData @"ACUserLoginData"



@interface ACSystemPreferrence : NSObject

+(void)setObject:(id)obj forKey:(NSString *)key;
+(id)objectForKey:(NSString *)key;
+(void)removeObjectForKey:(NSString *)key;
+(void)clearPreferrence;

@end
