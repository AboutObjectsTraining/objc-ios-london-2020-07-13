// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolView.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolView () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@end

@implementation CLNCoolView

- (IBAction)addCell {
    NSLog(@"In %s", __func__);
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    [self.contentView addSubview:newCell];
    newCell.text = self.textField.text;
    newCell.backgroundColor = UIColor.systemBlueColor;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"In %s", __func__);
    [super touchesBegan:touches withEvent:event];
}

@end
