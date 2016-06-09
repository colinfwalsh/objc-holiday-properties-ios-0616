//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    if ([season isEqualToString:@"Summer"]) {
        NSArray* summerArray = [self.database[season] allKeys];
        return summerArray;
    }
    else if ([season isEqualToString:@"Winter"]){
        NSArray* winterArray = [self.database[season] allKeys];
        return winterArray;
    }
    else {
        return nil;
    }
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    NSArray* suppliesSeason = self.database[season][holiday];
    return suppliesSeason;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    NSArray *holidayArray = [self.database[season] allKeys];
    
    NSPredicate *findHolidays = [NSPredicate predicateWithFormat:@"self == %@", holiday];
    
    NSArray *holidayArrayPredicated = [holidayArray filteredArrayUsingPredicate:findHolidays];
    
    if([holidayArrayPredicated containsObject:holiday]){
        return true;}
    else{
        return false;}
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    NSArray *suppliesArray = self.database[season][holiday];
    
    NSPredicate *findSupplies = [NSPredicate predicateWithFormat:@"self == %@", supply];
    
    NSArray *suppliesArrayPredicated = [suppliesArray filteredArrayUsingPredicate:findSupplies];
    
    if ([suppliesArrayPredicated containsObject:supply]) {
        return true;
    }
    
    else {
        return false;}
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    NSMutableArray *newHoliday = [[NSMutableArray alloc]init];
    [self.database[season] setValue:newHoliday forKey:holiday];
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [self.database[season] setValue:supply forKey:holiday];
    // no return
}

@end
