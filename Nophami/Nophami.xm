#import <UIKit/UIKit.h>
#import "HiddenChats.h"
@interface WAChatSession
@property (nonatomic, assign,readwrite) BOOL hidden;
@property (nonatomic, assign,readwrite) BOOL removed;
@property(copy, nonatomic) NSString *contactJID;


@end
@interface WAChatListViewController
@property(copy, nonatomic) UITableView *tableView;
@property(readonly, copy, nonatomic) NSArray *visibleCells;
@end

@interface WAMessage
@property(copy, nonatomic) NSString *fromJID;
@property(copy, nonatomic) NSString *toJID;

@end

@interface WAActionSheetPresenter:NSObject
- (void)addButtonWithTitle:(id)arg1 handler:(id)arg2;

@end

@interface WABadgedLabel:UILabel
@end
@interface WAChatSessionCell:UITableViewCell
@property(retain, nonatomic) WABadgedLabel *nameLabel;
@property(copy, nonatomic) NSString *jid;
@end

@interface WAChatSessionsViewController
- (id)tableViewForChatSessionCell:(id)arg1;
- (id)chatSessionForRowAtIndexPath:(id)arg1 inTableView:(id)arg2;


@end

@interface WATableSection : NSObject
- (id)addDefaultTableRow;
@property(copy, nonatomic) NSArray *rows;
@property(copy, nonatomic) NSString *footerText;
@end

@interface WATableRow : NSObject
- (id)initWithCell:(id)arg1;
@end
@interface WAChatSettingsViewController:UIViewController
- (id)addSection;
- (id)addDefaultTableRow;
@property(readonly, copy, nonatomic) NSArray *sections;
@end

@interface WAChatMessagesTableView : UITableView
@end

@interface WAChatViewController
@property(readonly, nonatomic) WAChatMessagesTableView *tableView;
@property(readonly, nonatomic) WAChatSession *chatSession;
@end



%hook _WAMessagesResultSection
- (id)chatSessionFor:(id)arg1{
    WAMessage *msg = arg1;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [paths.firstObject stringByAppendingPathComponent:@"Nophami.plist"];
    NSArray *fileList = [[NSArray alloc] initWithContentsOfFile:filePath];
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    for(int i=0;i< fileList.count;i++){
        NSDictionary *dic = fileList[i];
        [arr addObject:[[dic allValues] objectAtIndex:0]];
        
    }
    if ( [arr containsObject: msg.fromJID] || [arr containsObject: msg.toJID] ) {
        return nil;
    } else {
        return %orig;
    }
}

%end
NSMutableArray *Carr;
%hook WAChatViewController
- (void)viewWillAppear:(BOOL)arg1{
%orig;
    WAChatSession *x = self.chatSession;
    NSString *jid = x.contactJID;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [paths.firstObject stringByAppendingPathComponent:@"Nophami.plist"];
    NSArray *fileList = [[NSArray alloc] initWithContentsOfFile:filePath];
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    for(int i=0;i< fileList.count;i++){
        NSDictionary *dic = fileList[i];
        [arr addObject:[[dic allValues] objectAtIndex:0]];
        
    }
    if ( [arr containsObject: jid]) {
    self.tableView.hidden=1;
    
    }
    else{
        self.tableView.hidden=0;
    }

}

%end

//###########################################################################
WAChatSessionCell *Cell;
UITableView *table;

%hook WAChatListViewController
%new
-(void)ShowChatwithJID:(NSString*)jid{
    NSArray *a = self.tableView.visibleCells;
    WAChatSessionsViewController *Session = [[NSClassFromString(@"WAChatSessionsViewController") alloc] init];
    UITableView *table = [Session tableViewForChatSessionCell:a.firstObject];
    for (int i=0;i<[table numberOfRowsInSection:0];i++){
        NSIndexPath *ip = [NSIndexPath indexPathForRow:i inSection:0];
        WAChatSession *x =[Session chatSessionForRowAtIndexPath:ip inTableView:table];
        
        if([x.contactJID isEqual:jid]){
            x.hidden=0;
        }
    }}

- (void)viewWillAppear:(BOOL)arg1{
    %orig;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [paths.firstObject stringByAppendingPathComponent:@"Nophami.plist"];
    NSArray *fileList = [[NSArray alloc] initWithContentsOfFile:filePath];
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    for(int i=0;i< fileList.count;i++){
        NSDictionary *dic = fileList[i];
        [arr addObject:[[dic allValues] objectAtIndex:0]];
    }
  
    NSArray *a = self.tableView.visibleCells;
    WAChatSessionsViewController *Session = [[NSClassFromString(@"WAChatSessionsViewController") alloc] init];
    UITableView *table = [Session tableViewForChatSessionCell:a.firstObject];
    
    for (int i=0;i<[table numberOfRowsInSection:0];i++){
        NSIndexPath *ip = [NSIndexPath indexPathForRow:i inSection:0];
        WAChatSession *x =[Session chatSessionForRowAtIndexPath:ip inTableView:table];

        if ( [arr containsObject: x.contactJID]) {
            x.hidden=1;
            
        }
    }
    
}

- (void)viewDidLoad{
    %orig;
    
    table = self.tableView;
}
%end

%hook WAChatSessionCell
- (void)showMoreOptions:(id)arg1{
    Cell =  self;
    %orig;
}
%end

%hook WAActionSheetPresenter
%new
-(void)Hide{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [paths.firstObject stringByAppendingPathComponent:@"Nophami.plist"];
    NSArray *fileList = [[NSArray alloc] initWithContentsOfFile:filePath];
    NSMutableArray *newfileList;
    if(fileList.count ==0){
         newfileList= [[NSMutableArray alloc] init];
    }
    else{
        newfileList  = [[NSMutableArray alloc] initWithArray:fileList];
    }
    WAChatSessionsViewController *Session = [[NSClassFromString(@"WAChatSessionsViewController") alloc] init];
    UITableView *table = [Session tableViewForChatSessionCell:Cell];
    for (int i=0;i<[table numberOfRowsInSection:0];i++){
   NSIndexPath *ip = [NSIndexPath indexPathForRow:i inSection:0];
        WAChatSession *x =[Session chatSessionForRowAtIndexPath:ip inTableView:table];
        
        if([x.contactJID isEqual:Cell.jid]){
          x.hidden=1;
            [newfileList addObject:@{Cell.nameLabel.text:x.contactJID}];
            [newfileList writeToFile:filePath atomically:NO];
        }
    }
   

}
NSString *STR=@"";
- (void)addButtonWithTitle:(id)arg1 handler:(id)arg2{
    %orig;
    NSString *str = [NSString stringWithFormat:@"%@",arg1];
    if([STR isEqualToString:@""] || [STR isEqualToString:str]){
        STR=str;
   if([str containsString:@"كتم"]){
        %orig(@"إخفاء المحادثة",^{[self performSelector:@selector(Hide) withObject:nil];});
    }
   else {
        %orig(@"Hide Me",^{[self performSelector:@selector(Hide) withObject:nil];});
   }}
    
}

%end

//###########################################################################


%hook WAChatSettingsViewController
%new
-  (void)handleLongPress:(UILongPressGestureRecognizer*)sender {
   if (sender.state == UIGestureRecognizerStateBegan){
       HiddenChats *hc = [[HiddenChats alloc] init];
       [hc setModalPresentationStyle:UIModalPresentationCustom];
       [hc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
       [self presentViewController:hc animated:YES completion:nil];
    }
}
- (void)viewDidLoad{
    %orig;
    WATableSection *sec = [self.sections objectAtIndex:3];
    NSArray *oldRows = sec.rows;
    NSMutableArray *newRows = [[NSMutableArray alloc] init];
    UITableViewCell *Cell = [[UITableViewCell alloc] init];
    NSString * language = [[NSLocale preferredLanguages] firstObject];
    if([language containsString:@"ar"]){
    Cell.textLabel.text = @"إظهار المحادثات المخفية";
    }
    else {
    Cell.textLabel.text = @"Show Hidden Chats";
    }
    Cell.textLabel.textColor = [UIColor colorWithRed:0.16 green:0.19 blue:0.29 alpha:1.0];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 1.5;
    [Cell addGestureRecognizer:longPress];
    Cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    WATableRow *tr = [[NSClassFromString(@"WATableRow") alloc] initWithCell:Cell];
    [newRows addObject:tr];
    [newRows addObject:oldRows[0]];
    [newRows addObject:oldRows[1]];
    [newRows addObject:oldRows[2]];
    
    sec.rows = newRows;
}


%end






