//
//  HorizontalBarChartHighlighter.swift
//  Charts
//
//  Created by Daniel Cohen Gindi on 26/7/15.

//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics

public class HorizontalBarChartHighlighter: BarChartHighlighter
{
    public override func getHighlight(x x: CGFloat, y: CGFloat) -> ChartHighlight?
    {
        if let barData = self.chart?.data as? BarChartData
        {
            let pos = getValsForTouch(x: y, y: x)
            
            guard let selectionDetail = getSelectionDetail(xValue: Double(pos.y), x: x, y: y)
                else { return nil }
            
            if let set = barData.getDataSetByIndex(selectionDetail.dataSetIndex) as? IBarChartDataSet
                where set.isStacked
            {
                return getStackedHighlight(selectionDetail: selectionDetail,
                                           set: set,
                                           xValue: Double(pos.y),
                                           yValue: Double(pos.x))
            }
            
            return ChartHighlight(x: selectionDetail.xValue,
                                  y: selectionDetail.yValue,
                                  dataIndex: selectionDetail.dataIndex,
                                  dataSetIndex: selectionDetail.dataSetIndex,
                                  stackIndex: -1)
        }
        return nil
    }
}
