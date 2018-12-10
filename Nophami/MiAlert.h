//
//  MiAlert.h
//  Nophami
//
//  Created by iTheGentle on 8/15/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MiAlert : UIViewController;
+(void)ShowMessage:(NSString*)msg Mode:(int)type;
+(void)setTag:(int)i;
+(void)setData:(NSDictionary*)arr;
+(void)oldList:(NSMutableArray*)arr;
@end
UIView *BLACK0,*BOX0;
UIButton *rc;
