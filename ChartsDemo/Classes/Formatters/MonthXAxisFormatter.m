//
//  MonthXAxisFormatter.m
//  ChartsDemo
//
//  Created by Daniel Cohen Gindi on 22/07/2016.
//  Copyright © 2016 dcg. All rights reserved.
//

#import "MonthXAxisFormatter.h"

@implementation MonthXAxisFormatter
{
    NSArray *months;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        months = @[
                   @"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep",
                   @"Oct", @"Nov", @"Dec"
                   ];
    }
}

- (NSString *)stringForValue:(double)value
                        axis:(ChartAxisBase *)axis
{
    double percent = value / axis.axisRange;
    return months[(int)((double)months.count * percent)];
}

@end
