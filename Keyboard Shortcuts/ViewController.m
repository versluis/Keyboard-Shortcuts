//
//  ViewController.m
//  Keyboard Shortcuts
//
//  Created by Jay Versluis on 23/10/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup those shortcuts
    [self leadingShortcuts];
    [self trailingShortcuts];
    
    // remove auto correction suggestions
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    // remove shortcuts altogether
    // [self removeShortcuts];
    
    // bring the textfield into focus
    [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setting up those shortcuts

- (void)leadingShortcuts {
    
    // create a custom bar button
    UIBarButtonItem *firstButton = [[UIBarButtonItem alloc]initWithTitle:@"First Shortcut" style:UIBarButtonItemStylePlain target:self action:@selector(myFirstShortcut)];
    
    // create another one
    UIBarButtonItem *secondButton = [[UIBarButtonItem alloc]initWithTitle:@"Second Shortcut" style:UIBarButtonItemStylePlain target:self action:@selector(mySecondShortcut)];
    
    // add those buttons to an array
    NSArray *buttons = @[firstButton, secondButton];
    
    // create a group acction button (ridiculous, I know...)
    UIBarButtonItem *groupAction = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    
    // create a bar button group with those buttons
    UIBarButtonItemGroup *group = [[UIBarButtonItemGroup alloc]initWithBarButtonItems:buttons representativeItem:groupAction];
    
    // add add the group to the shortcuts bar above the keyboard
    // trailingBarButtonGroups is the end of the bar
    // leadingBarButtonGroups is the front of the bar
    UITextInputAssistantItem *assistantItem = self.textField.inputAssistantItem;
    assistantItem.leadingBarButtonGroups = @[group];
}

- (void)trailingShortcuts {
    
    // create a custom bar button
    UIBarButtonItem *thirdButton = [[UIBarButtonItem alloc]initWithTitle:@"Third" style:UIBarButtonItemStylePlain target:self action:@selector(myThirdShortcut)];
    
    // create another one
    UIBarButtonItem *fourthButton = [[UIBarButtonItem alloc]initWithTitle:@"Fourth" style:UIBarButtonItemStylePlain target:self action:@selector(myFourthShortcut)];
    
    // add those buttons to an array
    NSArray *buttons = @[thirdButton, fourthButton];
    
    // create a group acction button (ridiculous, I know...)
    UIBarButtonItem *groupAction = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    
    // create a bar button group with those buttons
    UIBarButtonItemGroup *group = [[UIBarButtonItemGroup alloc]initWithBarButtonItems:buttons representativeItem:groupAction];
    
    // add add the group to the shortcuts bar above the keyboard
    // trailingBarButtonGroups is the end of the bar
    // leadingBarButtonGroups is the front of the bar
    UITextInputAssistantItem *assistantItem = self.textField.inputAssistantItem;
    assistantItem.trailingBarButtonGroups = @[group];
}

- (void)removeShortcuts {
    
    // remove any shortcuts there may be
    UITextInputAssistantItem *assistantItem = self.textField.inputAssistantItem;
    assistantItem.leadingBarButtonGroups = nil;
    assistantItem.trailingBarButtonGroups = nil;
}

#pragma mark - Text Field Delegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    return YES;
}

#pragma mark - Shortcut Handlers

- (void)myFirstShortcut {
    
    NSLog(@"YEY: Someone used my FIRST shortcut item.");
}

- (void)mySecondShortcut {
    
    NSLog(@"Awesome: Someone used my SECOND shortcut item.");
}

- (void)myThirdShortcut {
    
    NSLog(@"Great: someone used my THIRD shortcut item.");
}

- (void)myFourthShortcut {
    
    NSLog(@"Rad: someone used my FOURTH shortcut item.");
}

@end
