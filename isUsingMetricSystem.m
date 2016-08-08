static const CGFloat kOneKmInMiles = 0.621371192;
static const float kOneInchInCm = 2.54;

@implementation IWMetricImperialConverter

+ (BOOL)isUsingMetricSystem {
    NSLocale *locale = [NSLocale currentLocale];
    BOOL isMetric = [[locale objectForKey:NSLocaleUsesMetricSystem] boolValue];
    
    return isMetric;
}

+ (CGFloat)distanceInmilesFromDistanceInKm:(CGFloat)distanceInKm {
    return distanceInKm * kOneKmInMiles;
}