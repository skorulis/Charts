//
//  YearXAxisFormatter.m
//  ChartsDemo
//
//  Created by Daniel Cohen Gindi on 22/07/2016.
//  Copyright © 2016 dcg. All rights reserved.
//

#import "YearXAxisFormatter.h"

@implementation YearXAxisFormatter
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

- (NSString *)stringForXValue:(double)xValue
                       xRange:(double)xRange
                    xPosition:(CGFloat)xPosition
              viewPortHandler:(ChartViewPortHandler *)viewPortHandler
{
    double percent = xValue / xRange;
    return months[(int)((double)months.count * percent)];
    
}

@end
