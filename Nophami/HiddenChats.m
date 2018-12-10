//
//  HiddenChats.m
//  Nophami
//
//  Created by iTheGentle on 8/14/18.
//

#import "HiddenChats.h"
#import "MiAlert.h"
#import <sys/utsname.h>
UITableView *tbl;


NSString* deviceName()
{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];
}
@implementation HiddenChats
NSMutableArray *list;
+(void)newList:(NSMutableArray*)arr{
    list = arr;
    [tbl reloadData];
}
-(void)DONE{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)viewDidLoad{

    tbl = [[UITableView alloc] init];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [paths.firstObject stringByAppendingPathComponent:@"Nophami.plist"];
    list = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    tbl.dataSource=self;
    tbl.delegate=self;
    
    UITabBar *bar = [[UITabBar alloc] init];
    if([deviceName() isEqualToString:@"iPhone10,6"]){
        bar.frame = CGRectMake(0, 40, self.view.frame.size.width, 0);
            tbl.frame =CGRectMake(0, 89 , self.view.frame.size.width, self.view.frame.size.height - 49);
    }
    else {
        bar.frame = CGRectMake(0, 0, self.view.frame.size.width, 0);
            tbl.frame =CGRectMake(0, 49 , self.view.frame.size.width, self.view.frame.size.height - 49);
    }

    UILabel *Display = [[UILabel alloc]initWithFrame:CGRectMake(0, 19, bar.frame.size.width, 20)];
    Display.textAlignment=1;
    Display.textColor=[UIColor colorWithRed:0.16 green:0.19 blue:0.29 alpha:1.0];
    Display.text = @"Hidden Chats";
    Display.font= [UIFont fontWithName:@"Helvetica" size:15];;
    UIButton *Done = [[UIButton alloc] init];
    Done.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    [Done setTitleColor:[UIColor colorWithRed:0.16 green:0.19 blue:0.29 alpha:1.0] forState:UIControlStateNormal];
    Done.frame = CGRectMake(bar.frame.size.width - 57, Display.frame.origin.y, 55, 20);
    [Done setTitle:@"Done" forState:UIControlStateNormal];
    [Done addTarget:self action:@selector(DONE) forControlEvents:UIControlEventTouchUpInside];
    [bar addSubview:Done];
    [bar addSubview:Display];
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    tbl.backgroundColor=UIColor.clearColor;
    self.view.backgroundColor=UIColor.clearColor;
   tbl.allowsSelection=0;
    tbl.separatorStyle=UITableViewCellSeparatorStyleNone;
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    tbl.backgroundView = visualEffectView;
    visualEffectView.frame = self.view.bounds;
    [self.view addSubview:tbl];
    [self.view addSubview:bar];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(list.count==0){
        return 1;
    }
    else {
        return list.count;
    }
}
-(void)test:(UITapGestureRecognizer *)tapGesture{
    [MiAlert setTag:tapGesture.view.tag];
    NSDictionary *dict = list[tapGesture.view.tag];
    [MiAlert setData:dict];
    [MiAlert oldList:list];
    [MiAlert ShowMessage:@"Realy? Want to show it dude ?" Mode:2];

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.backgroundColor = UIColor.clearColor;
    if(list.count !=0){
    NSDictionary *dict = list[indexPath.row];
        UILabel *icon = [[UILabel alloc] initWithFrame:CGRectMake(0, cell.textLabel.frame.origin.y, 25, 25)];
        icon.text = @"🙂";
    cell.accessoryView=icon;
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[[dict allKeys] objectAtIndex:0]];
    cell.tag=indexPath.row;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(test:)];
    [cell addGestureRecognizer:tap];
    }
    else{
        cell.textLabel.textAlignment=1;
        cell.textLabel.text=@"There's No Chats.";
    }
    return cell;
}

@end
