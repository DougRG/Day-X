//
//  DetailViewController.m
//  DayX
//
//  Created by Douglas Goodwin on 7/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "EntryController.h"


@interface DetailViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateWithEntry:self.entry];
    
    
}

    -(BOOL) textFieldShouldReturn:(UITextField *)textField {
        
       [self.textField resignFirstResponder];
        
        
        return YES;
    }
    // Do any additional setup after loading the view.

-(IBAction)clearButtonTapped   :(id)sender{
    self.textField.text = @"";
    self.textView.text = @"";
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.entry) {
        self.entry.title = self.textField.text;
        self.entry.bodyText = self.textView.text;
        self.entry.timeStamp = [NSDate date];
    } else {
        Entry *entry = [Entry new];
        entry.title = self.textField.text;
        entry.bodyText = self.textView.text;
        [[EntryController sharedInstance] addEntry:entry];
        
        
        
        
        
        //[self.textField resignFirstResponder];
        
    }
    
    [[EntryController sharedInstance] save];
    
    [self.navigationController  popToRootViewControllerAnimated:YES];
    
}

-(void)updateWithEntry:(Entry *)entry {
    self.textField.text = entry.title;
    self.textView.text = entry.bodyText;
    
    
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

