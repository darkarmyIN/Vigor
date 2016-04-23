//
//  GraphViewController.m
//  Vigor
//
//  Created by YASH on 23/04/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//

#import "GraphViewController.h"

@interface GraphViewController () <ChartViewDelegate>

@property (strong, nonatomic) IBOutlet LineChartView *chartView;

@end

@implementation GraphViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _chartView.delegate = self;
    
    [self setupBarLineChartView:_chartView];
    
    _chartView.dragEnabled = YES;
    [_chartView setScaleEnabled:YES];
    _chartView.pinchZoomEnabled = YES;
    _chartView.drawGridBackgroundEnabled = NO;
    
    // x-axis limit line
    ChartLimitLine *llXAxis = [[ChartLimitLine alloc] initWithLimit:10.0 label:@"Index 10"];
    llXAxis.lineWidth = 4.0;
    llXAxis.lineDashLengths = @[@(10.f), @(10.f), @(0.f)];
    llXAxis.labelPosition = ChartLimitLabelPositionRightBottom;
    llXAxis.valueFont = [UIFont systemFontOfSize:10.f];
    
    //[_chartView.xAxis addLimitLine:llXAxis];
    
    ChartLimitLine *upperLimitLine = [[ChartLimitLine alloc] initWithLimit:1.0 label:@"Upper Limit"];
    upperLimitLine.lineWidth = 2.0;
    upperLimitLine.lineDashLengths = @[@5.f, @5.f];
    upperLimitLine.labelPosition = ChartLimitLabelPositionRightTop;
    upperLimitLine.valueFont = [UIFont systemFontOfSize:10.0];
    
    ChartLimitLine *lowerLimitLine = [[ChartLimitLine alloc] initWithLimit:-1.0 label:@"Lower Limit"];
    lowerLimitLine.lineWidth = 2.0;
    lowerLimitLine.lineDashLengths = @[@5.f, @5.f];
    lowerLimitLine.labelPosition = ChartLimitLabelPositionRightBottom;
    lowerLimitLine.valueFont = [UIFont systemFontOfSize:10.0];
    
    ChartYAxis *leftAxis = _chartView.leftAxis;
    [leftAxis removeAllLimitLines];
    [leftAxis addLimitLine:upperLimitLine];
    [leftAxis addLimitLine:lowerLimitLine];
    leftAxis.axisMaxValue = 5.0;
    leftAxis.axisMinValue = -5.0;
    leftAxis.gridLineDashLengths = @[@0.1f, @0.1f];
    leftAxis.drawZeroLineEnabled = NO;
    leftAxis.drawLimitLinesBehindDataEnabled = YES;
    
    _chartView.rightAxis.enabled = NO;
    
//    BalloonMarker *marker = [[BalloonMarker alloc] initWithColor:[UIColor colorWithWhite:180/255. alpha:1.0] font:[UIFont systemFontOfSize:12.0] insets: UIEdgeInsetsMake(8.0, 8.0, 20.0, 8.0)];
//    marker.minimumSize = CGSizeMake(80.f, 40.f);
//    _chartView.marker = marker;
    
    _chartView.legend.form = ChartLegendFormLine;
    
    [_chartView animateWithXAxisDuration:2.5 easingOption:ChartEasingOptionEaseInOutQuart];
    
}

- (void)setDataCount:(int)count range:(double)range
{
    NSMutableArray *xAxisValues = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i++)
    {
        [xAxisValues addObject:[@(i) stringValue]];
    }
    
    NSMutableArray *yAxisValues = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i++)
    {
        double mult = (range + 1);
        double val = (double) (arc4random_uniform(mult)) + 3;
        [yAxisValues addObject:[[ChartDataEntry alloc] initWithValue:val xIndex:i]];
    }
    
    LineChartDataSet *dataSet = nil;
    if (_chartView.data.dataSetCount > 0)
    {
        dataSet = (LineChartDataSet *)_chartView.data.dataSets[0];
        dataSet = [dataSet initWithYVals:yAxisValues];
//        [_chartView.data.xValsObjc initWithArray:xAxisValues];
        _chartView.data.xValsObjc = xAxisValues;
        [_chartView notifyDataSetChanged];
    }
    else
    {
        dataSet = [[LineChartDataSet alloc] initWithYVals:yAxisValues label:@"DataSet 1"];
        
        dataSet.lineDashLengths = @[@5.f, @5.f];
        dataSet.highlightLineDashLengths = @[@5.f, @5.f];
        [dataSet setColor:UIColor.blackColor];
        [dataSet setCircleColor:UIColor.blackColor];
        dataSet.lineWidth = 1.0;
        dataSet.circleRadius = 3.0;
        dataSet.drawCircleHoleEnabled = NO;
        dataSet.valueFont = [UIFont systemFontOfSize:9.f];
//        dataSet.fillAlpha = 65/255.0;
//        dataSet.fillColor = [UIColor blackColor];
        
        NSArray *gradientColors = @[
                                    (id)[ChartColorTemplates colorFromString:@"#00ff0000"].CGColor,
                                    (id)[ChartColorTemplates colorFromString:@"#ffff0000"].CGColor
                                    ];
        CGGradientRef gradient = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
        
        dataSet.fillAlpha = 1.f;
        dataSet.fill = [ChartFill fillWithLinearGradient:gradient angle:90.f];
        dataSet.drawFilledEnabled = YES;
        
        CGGradientRelease(gradient);
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:dataSet];
        
        LineChartData *data = [[LineChartData alloc] initWithXVals:xAxisValues dataSets:dataSets];
        
        _chartView.data = data;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry dataSetIndex:(NSInteger)dataSetIndex highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
}

- (void)setupBarLineChartView:(BarLineChartViewBase *)chartView
{
    chartView.descriptionText = @"";
    chartView.noDataTextDescription = @"You need to provide data for the chart.";
    
    chartView.drawGridBackgroundEnabled = NO;
    
    chartView.dragEnabled = YES;
    [chartView setScaleEnabled:YES];
    chartView.pinchZoomEnabled = NO;
    
    // ChartYAxis *leftAxis = chartView.leftAxis;
    
    ChartXAxis *xAxis = chartView.xAxis;
    xAxis.labelPosition = XAxisLabelPositionBottom;
    
    chartView.rightAxis.enabled = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
