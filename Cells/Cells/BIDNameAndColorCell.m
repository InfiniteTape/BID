//
//  BIDNameAndColorCell.m
//  Cells
//
//  Created by Rogers, Brian A on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDNameAndColorCell.h"


@implementation BIDNameAndColorCell

@synthesize name;
@synthesize color;
@synthesize nameLabel;
@synthesize colorLabel;



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setName:(NSString *)n
{
    if(![n isEqualToString:name])
    {
        name = [n copy];

        nameLabel.text = name;
    }
}

-(void)setColor:(NSString *)c
{
    if(![c isEqualToString:color])
    {
        color = [c copy];

        colorLabel.text = color;
    }
}

@end
