//
//  QuizViewController.m
//  Quiz_Objective-C
//
//  Created by Roman Ustiantcev on 18/04/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;
@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@end

@implementation QuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // call this init method implemented by superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // create two arrays filled with questions and answers
        self.questions = @[@"From what is cognac made?",
                           @"What is 7 + 7?",
                           @"What is capital of Russia?"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Moscow is capital of Russia"];
    }
    
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    // step to the next question
    self.currentQuestionIndex++;
    
    // was it the last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        // go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // get the string in the questions label
    NSString *question = self.questions[self.currentQuestionIndex];
    
    self.questionLabel.text = question;
    
    // reset the answer label
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    // what is the answer on the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    self.answerLabel.text = answer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
