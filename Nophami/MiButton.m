//
//  MiButton.m
//  Nophami
//
//  Created by iTheGentle on 8/15/18.
//

#import "MiButton.h"

@implementation MiButton

UIColor *color;

-(void)awakeFromNib{
    color = self.backgroundColor;
}
- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.backgroundColor = [UIColor blueColor];
    }
    else {
       self.backgroundColor = color;
    }
}

@end
