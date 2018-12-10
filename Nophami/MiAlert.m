//
//  MiAlert.m
//  Nophami
//
//  Created by iTheGentle on 8/15/18.
//

#import "MiAlert.h"
#import "HiddenChats.h"
@interface WAChatListViewController
@property(copy, nonatomic) UITableView *tableView;
-(void)ShowChatwithJID:(NSString*)jid;

@end
int tag;
NSDictionary *array;
NSMutableArray *Listarray;
@implementation MiAlert
+(void)oldList:(NSMutableArray*)arr{
    Listarray = arr;
}
+(void)setTag:(int)i{
    tag=i;
}
+(void)setData:(NSDictionary*)arr{
    array = arr;
}
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
+(void)TEST:(id)sender{
    UIButton *TAG = (UIButton*)sender;
WAChatListViewController *v=  [NSClassFromString(@"WAChatListViewController") new];
[v ShowChatwithJID:[[array allValues] objectAtIndex:0]];
    [Listarray removeObjectAtIndex:TAG.tag];
    [HiddenChats newList:Listarray];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [paths.firstObject stringByAppendingPathComponent:@"Nophami.plist"];
    [Listarray writeToFile:filePath atomically:NO];
    [self Diss:@"we did it :)"];
   
}
+(void)Diss{
    [UIView animateWithDuration:0.3
                     animations:^{
                         
                         BOX.frame=CGRectMake((VC.view.frame.size.width / 2) -125, (VC.view.frame.size.height / 2)-80, 250, 120);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.3 animations:^{
                             BOX.frame=CGRectMake((VC.view.frame.size.width / 2) -125, VC.view.frame.size.height, 250, 120);
                             BOX.alpha = 0;
                         }
                                          completion:^(BOOL finished) {
                                              [BOX removeFromSuperview];
                                              [BLACK removeFromSuperview];
                                              
                                          }];
                         
                     }];
    
}
+(void)Diss:(NSString*)msg{
    [UIView animateWithDuration:0.3
                     animations:^{
                         
                         BOX.frame=CGRectMake((VC.view.frame.size.width / 2) -125, (VC.view.frame.size.height / 2)-80, 250, 120);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.3 animations:^{
                             BOX.frame=CGRectMake((VC.view.frame.size.width / 2) -125, VC.view.frame.size.height, 250, 120);
                         BOX.alpha = 0;
                         }
                          completion:^(BOOL finished) {
                             
                              [BOX removeFromSuperview];
                              [BLACK removeFromSuperview];
                             [self ShowMessage:msg Mode:1];
                          }];
                      
                     }];
    
    
}
+ (UIViewController*) getTopMostViewController
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                break;
            }
        }
    }
    
    for (UIView *subView in [window subviews])
    {
        UIResponder *responder = [subView nextResponder];
        
        //added this block of code for iOS 8 which puts a UITransitionView in between the UIWindow and the UILayoutContainerView
        if ([responder isEqual:window])
        {
            //this is a UITransitionView
            if ([[subView subviews] count])
            {
                UIView *subSubView = [subView subviews][0]; //this should be the UILayoutContainerView
                responder = [subSubView nextResponder];
            }
        }
        
        if([responder isKindOfClass:[UIViewController class]]) {
            return [self topViewController: (UIViewController *) responder];
        }
    }
    
    return nil;
}

+ (UIViewController *) topViewController: (UIViewController *) controller
{
    BOOL isPresenting = NO;
    do {
        // this path is called only on iOS 6+, so -presentedViewController is fine here.
        UIViewController *presented = [controller presentedViewController];
        isPresenting = presented != nil;
        if(presented != nil) {
            controller = presented;
        }
        
    } while (isPresenting);
    
    return controller;
}


UIView *BLACK,*BOX;
UIViewController *VC;
+(UIColor *)lighterColorForColor:(UIColor *)c
{
    CGFloat r, g, b, a;
    if ([c getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MIN(r + 0.2, 1.0)
                               green:MIN(g + 0.2, 1.0)
                                blue:MIN(b + 0.2, 1.0)
                               alpha:a];
    return nil;
}
+(void)ShowMessage:(NSString*)msg Mode:(int)type{

    VC = [self getTopMostViewController];
BLACK = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VC.view.frame.size.width, VC.view.frame.size.height)];
BLACK.backgroundColor = [UIColor blackColor];
BLACK.alpha=0.5;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Diss)];
    [VC.view addGestureRecognizer:tap];
BOX = [[UIView alloc] initWithFrame:CGRectMake((VC.view.frame.size.width /2) -125, VC.view.frame.size.height, 250, 120)];
BOX.backgroundColor = [UIColor whiteColor];
BOX.layer.cornerRadius=8;
BOX.clipsToBounds=YES;
UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, BOX.frame.size.width, BOX.frame.size.height /2)];
label2.text = msg;
label2.numberOfLines=5;
label2.textAlignment=NSTextAlignmentCenter;
label2.font=[label2.font fontWithSize:12];
UIButton *r = [[UIButton alloc] init];
UIButton *r2 = [[UIButton alloc] init];

r.font=[r.font fontWithSize:15];

[r setTitle:@"YES" forState:UIControlStateNormal];
    r.tag=tag;
r.backgroundColor = [UIColor colorWithRed:0.36 green:0.76 blue:0.70 alpha:1.0];
    r.frame = CGRectMake(r.frame.size.width, BOX.frame.size.height - 40, BOX.frame.size.width / 2, 40);
    r2.frame = CGRectMake(r.frame.size.width, BOX.frame.size.height - 40, BOX.frame.size.width / 2, 40);
r2.font=[r.font fontWithSize:15];
[r2 setTitle:@"NO" forState:UIControlStateNormal];
r2.backgroundColor = [UIColor colorWithRed:0.83 green:0.26 blue:0.36 alpha:1.0];
    [r setBackgroundImage:[self imageWithColor:[self lighterColorForColor:r.backgroundColor]] forState:UIControlStateHighlighted];
    [r2 setBackgroundImage:[self imageWithColor:[self lighterColorForColor:r2.backgroundColor]] forState:UIControlStateHighlighted];
[BOX addSubview:label2];
BLACK0 = BLACK;
BOX0 = BOX;
rc = r;
    
    [r2 addTarget:self action:@selector(Diss) forControlEvents:UIControlEventTouchUpInside];
[VC.view addSubview:BLACK];
    if(type ==1){
        [r setTitle:@"OK" forState:UIControlStateNormal];
r.frame = CGRectMake(0, BOX.frame.size.height - 40, BOX.frame.size.width, 40);
[BOX addSubview:r];
        [r addTarget:self action:@selector(Diss) forControlEvents:UIControlEventTouchUpInside];
}
else{
    [r addTarget:self action:@selector(TEST:) forControlEvents:UIControlEventTouchUpInside];
[BOX addSubview:r];
[BOX addSubview:r2];
}
BOX.alpha=0;

[VC.view addSubview:BOX];
[UIView animateWithDuration:0.3
                 animations:^{
                     BOX.alpha = 1;
                     BOX.frame=CGRectMake((VC.view.frame.size.width / 2) -125, (VC.view.frame.size.height / 2)-100, 250, 120);
                 } completion:^(BOOL finished) {
                     [UIView animateWithDuration:0.3 animations:^{
                     BOX.frame=CGRectMake((VC.view.frame.size.width / 2) -125, (VC.view.frame.size.height / 2)-50, 250, 120);
                     }];
                     
                 }];
    

}
@end
