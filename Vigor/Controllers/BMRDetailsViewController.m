//
//  BMRDetailsViewController.m
//  Vigor
//
//  Created by Avikant Saini on 4/23/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//

#import "BMRDetailsViewController.h"

@interface BMRDetailsViewController () <ORKTaskViewControllerDelegate>
{
    ORKInstructionStep *instructUser;
    ORKQuestionStep *sendFeedback;
    ORKFormStep *fillForm;
}


@property (weak, nonatomic) IBOutlet UILabel *howmuchLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *workoutSelectionButtons;

@property (weak, nonatomic) IBOutlet UILabel *bmrCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *tciCountLabel;


@end

@implementation BMRDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	if (self.details) {
		[self updateIntake:1.22];
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setWorkOutMode:(id)sender {
	NSInteger tag = [sender tag];
	switch (tag) {
		case 1:
			[self updateIntake:1.22];
			break;
		case 2:
			[self updateIntake:1.34];
			break;
		case 3:
			[self updateIntake:1.51];
			break;
		case 4:
			[self updateIntake:1.66];
			break;
		case 5:
			[self updateIntake:1.79];
			break;
	  default:
			break;
	}
}

- (void)updateIntake:(CGFloat)multiplier
{
	CGFloat totalIntake = self.details.bmr * multiplier;
	_bmrCountLabel.text = [NSString stringWithFormat:@"%.2f KCal", self.details.bmr];
	_tciCountLabel.text = [NSString stringWithFormat:@"%.2f KCal", totalIntake];
}

- (IBAction)giveFeedbackAction:(id)sender
{
    instructUser = [[ORKInstructionStep alloc] initWithIdentifier:@"intro"];
    instructUser.title = @"Enter Your Feedback";
    
    fillForm = [[ORKFormStep alloc] initWithIdentifier:@"FeedbackForm" title:@"Comments" text:@""];
    ORKFormItem *feedbackItem = [[ORKFormItem alloc] initWithIdentifier:@"formItem" text:@"Give Your Feedback" answerFormat:[ORKAnswerFormat textAnswerFormat] optional:NO];
    fillForm.formItems = @[feedbackItem];
    
    ORKOrderedTask *task = [[ORKOrderedTask alloc] initWithIdentifier:@"task" steps:@[instructUser, fillForm]];
    
    ORKTaskViewController *taskViewController =
    [[ORKTaskViewController alloc] initWithTask:task taskRunUUID:nil];
    taskViewController.delegate = self;
    
    [self presentViewController:taskViewController animated:YES completion:nil];
}

- (void)taskViewController:(ORKTaskViewController *)taskViewController didFinishWithReason:(ORKTaskViewControllerFinishReason)reason error:(NSError *)error
{
    ORKTaskResult *feedbackComplete = [taskViewController result];
    
    ORKStepResult *feedbackProvided = (ORKStepResult *) [feedbackComplete.results lastObject];
    
    // obtain input value from [[finalResult.results firstObject] valueForKey:@"answer"]
    // send this value to haven api, then send results of that to kinvey
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
