//
//  QuestionTableCellTableViewCell.h
//  StackOverFlowToGo
//
//  Created by Reid Weber on 11/11/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionTableCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *questionNameLabel;
@property (weak, nonatomic) IBOutlet UIView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *questionBodyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
