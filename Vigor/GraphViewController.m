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

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;


@end

@implementation GraphViewController {
	NSArray *legendTitles;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	legendTitles = @[@"SUN", @"MON", @"TUE", @"WED", @"THU", @"FRI", @"SAT"];
	
    _chartView.delegate = self;
    
    [self setupBarLineChartView:_chartView];
    
    _chartView.dragEnabled = YES;
    [_chartView setScaleEnabled:YES];
    _chartView.pinchZoomEnabled = YES;
    _chartView.drawGridBackgroundEnabled = NO;
    
	
    ChartYAxis *leftAxis = _chartView.leftAxis;
    [leftAxis removeAllLimitLines];
    leftAxis.axisMaxValue = 1.2;
    leftAxis.axisMinValue = -1.2;
    leftAxis.drawZeroLineEnabled = NO;
    leftAxis.drawLimitLinesBehindDataEnabled = YES;
	
    _chartView.legend.form = ChartLegendFormLine;
	
    [_chartView animateWithXAxisDuration:2.5 easingOption:ChartEasingOptionEaseInOutCirc];
	
	[self updateSegmentedControl:self.segmentedControl];
	
}

- (IBAction)updateSegmentedControl:(id)sender {
	
	NSMutableArray *xAxisValues = [[NSMutableArray alloc] init];
	NSMutableArray *yAxisValues = [[NSMutableArray alloc] init];
	
	NSInteger index = [sender selectedSegmentIndex];
	
	if (index == 0) {
		// Core data
		NSMutableArray *feedbacks = [Feedback getAllFeedbacks];
		
		for (int i = 0; i < feedbacks.count; i++)
		{
			Feedback *fback = [feedbacks objectAtIndex:i];
			[xAxisValues addObject:[NSString stringWithFormat:@"%@", legendTitles[i%7]]];
			[yAxisValues addObject:[[ChartDataEntry alloc] initWithValue:fback.value.floatValue xIndex:i]];
		}
		
	}
	else {
		// Kinvey
	}
	
	LineChartDataSet *dataSet = nil;
	
	dataSet = [[LineChartDataSet alloc] initWithYVals:yAxisValues label:@"Satisfaction"];
	
	[dataSet setColor:UIColor.blackColor];
	[dataSet setCircleColor:UIColor.blackColor];
	dataSet.lineWidth = 1.0;
	dataSet.circleRadius = 2.5;
	dataSet.drawCircleHoleEnabled = YES;
	dataSet.valueFont = [UIFont systemFontOfSize:9.f];
	
	NSMutableArray *dataSets = [[NSMutableArray alloc] init];
	[dataSets addObject:dataSet];
	
	LineChartData *data = [[LineChartData alloc] initWithXVals:xAxisValues dataSets:dataSets];
	
	_chartView.data = data;
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
