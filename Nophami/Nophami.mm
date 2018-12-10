#line 1 "/Users/iTheGentle/Desktop/Projects/Nophami/Nophami/Nophami.xm"
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




#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class WAActionSheetPresenter; @class WAChatSessionCell; @class WAChatViewController; @class WAChatSettingsViewController; @class WAChatListViewController; @class _WAMessagesResultSection; 
static id (*_logos_orig$_ungrouped$_WAMessagesResultSection$chatSessionFor$)(_LOGOS_SELF_TYPE_NORMAL _WAMessagesResultSection* _LOGOS_SELF_CONST, SEL, id); static id _logos_method$_ungrouped$_WAMessagesResultSection$chatSessionFor$(_LOGOS_SELF_TYPE_NORMAL _WAMessagesResultSection* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$WAChatViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL WAChatViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$WAChatViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL WAChatViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$WAChatListViewController$ShowChatwithJID$(_LOGOS_SELF_TYPE_NORMAL WAChatListViewController* _LOGOS_SELF_CONST, SEL, NSString*); static void (*_logos_orig$_ungrouped$WAChatListViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL WAChatListViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$WAChatListViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL WAChatListViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$WAChatListViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL WAChatListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WAChatListViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL WAChatListViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WAChatSessionCell$showMoreOptions$)(_LOGOS_SELF_TYPE_NORMAL WAChatSessionCell* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$WAChatSessionCell$showMoreOptions$(_LOGOS_SELF_TYPE_NORMAL WAChatSessionCell* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$WAActionSheetPresenter$Hide(_LOGOS_SELF_TYPE_NORMAL WAActionSheetPresenter* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WAActionSheetPresenter$addButtonWithTitle$handler$)(_LOGOS_SELF_TYPE_NORMAL WAActionSheetPresenter* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$WAActionSheetPresenter$addButtonWithTitle$handler$(_LOGOS_SELF_TYPE_NORMAL WAActionSheetPresenter* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$WAChatSettingsViewController$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL WAChatSettingsViewController* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer*); static void (*_logos_orig$_ungrouped$WAChatSettingsViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL WAChatSettingsViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WAChatSettingsViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL WAChatSettingsViewController* _LOGOS_SELF_CONST, SEL); 

#line 65 "/Users/iTheGentle/Desktop/Projects/Nophami/Nophami/Nophami.xm"

static id _logos_method$_ungrouped$_WAMessagesResultSection$chatSessionFor$(_LOGOS_SELF_TYPE_NORMAL _WAMessagesResultSection* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
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
        return _logos_orig$_ungrouped$_WAMessagesResultSection$chatSessionFor$(self, _cmd, arg1);
    }
}


NSMutableArray *Carr;

static void _logos_method$_ungrouped$WAChatViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL WAChatViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1){
_logos_orig$_ungrouped$WAChatViewController$viewWillAppear$(self, _cmd, arg1);
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




WAChatSessionCell *Cell;
UITableView *table;



static void _logos_method$_ungrouped$WAChatListViewController$ShowChatwithJID$(_LOGOS_SELF_TYPE_NORMAL WAChatListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString* jid){
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

static void _logos_method$_ungrouped$WAChatListViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL WAChatListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1){
    _logos_orig$_ungrouped$WAChatListViewController$viewWillAppear$(self, _cmd, arg1);
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

static void _logos_method$_ungrouped$WAChatListViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL WAChatListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    _logos_orig$_ungrouped$WAChatListViewController$viewDidLoad(self, _cmd);
    
    table = self.tableView;
}



static void _logos_method$_ungrouped$WAChatSessionCell$showMoreOptions$(_LOGOS_SELF_TYPE_NORMAL WAChatSessionCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
    Cell =  self;
    _logos_orig$_ungrouped$WAChatSessionCell$showMoreOptions$(self, _cmd, arg1);
}




static void _logos_method$_ungrouped$WAActionSheetPresenter$Hide(_LOGOS_SELF_TYPE_NORMAL WAActionSheetPresenter* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){

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
static void _logos_method$_ungrouped$WAActionSheetPresenter$addButtonWithTitle$handler$(_LOGOS_SELF_TYPE_NORMAL WAActionSheetPresenter* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2){
    _logos_orig$_ungrouped$WAActionSheetPresenter$addButtonWithTitle$handler$(self, _cmd, arg1, arg2);
    NSString *str = [NSString stringWithFormat:@"%@",arg1];
    if([STR isEqualToString:@""] || [STR isEqualToString:str]){
        STR=str;
   if([str containsString:@"كتم"]){
        _logos_orig$_ungrouped$WAActionSheetPresenter$addButtonWithTitle$handler$(self, _cmd, @"إخفاء المحادثة",^{[self performSelector:@selector(Hide) withObject:nil];});
    }
   else {
        _logos_orig$_ungrouped$WAActionSheetPresenter$addButtonWithTitle$handler$(self, _cmd, @"Hide Me",^{[self performSelector:@selector(Hide) withObject:nil];});
   }}
    
}








static void _logos_method$_ungrouped$WAChatSettingsViewController$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL WAChatSettingsViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILongPressGestureRecognizer* sender) {
   if (sender.state == UIGestureRecognizerStateBegan){
       HiddenChats *hc = [[HiddenChats alloc] init];
       [hc setModalPresentationStyle:UIModalPresentationCustom];
       [hc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
       [self presentViewController:hc animated:YES completion:nil];
    }
}
static void _logos_method$_ungrouped$WAChatSettingsViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL WAChatSettingsViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    _logos_orig$_ungrouped$WAChatSettingsViewController$viewDidLoad(self, _cmd);
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









static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$_WAMessagesResultSection = objc_getClass("_WAMessagesResultSection"); MSHookMessageEx(_logos_class$_ungrouped$_WAMessagesResultSection, @selector(chatSessionFor:), (IMP)&_logos_method$_ungrouped$_WAMessagesResultSection$chatSessionFor$, (IMP*)&_logos_orig$_ungrouped$_WAMessagesResultSection$chatSessionFor$);Class _logos_class$_ungrouped$WAChatViewController = objc_getClass("WAChatViewController"); MSHookMessageEx(_logos_class$_ungrouped$WAChatViewController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$WAChatViewController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$WAChatViewController$viewWillAppear$);Class _logos_class$_ungrouped$WAChatListViewController = objc_getClass("WAChatListViewController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSString*), strlen(@encode(NSString*))); i += strlen(@encode(NSString*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$WAChatListViewController, @selector(ShowChatwithJID:), (IMP)&_logos_method$_ungrouped$WAChatListViewController$ShowChatwithJID$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$WAChatListViewController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$WAChatListViewController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$WAChatListViewController$viewWillAppear$);MSHookMessageEx(_logos_class$_ungrouped$WAChatListViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$WAChatListViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$WAChatListViewController$viewDidLoad);Class _logos_class$_ungrouped$WAChatSessionCell = objc_getClass("WAChatSessionCell"); MSHookMessageEx(_logos_class$_ungrouped$WAChatSessionCell, @selector(showMoreOptions:), (IMP)&_logos_method$_ungrouped$WAChatSessionCell$showMoreOptions$, (IMP*)&_logos_orig$_ungrouped$WAChatSessionCell$showMoreOptions$);Class _logos_class$_ungrouped$WAActionSheetPresenter = objc_getClass("WAActionSheetPresenter"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$WAActionSheetPresenter, @selector(Hide), (IMP)&_logos_method$_ungrouped$WAActionSheetPresenter$Hide, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$WAActionSheetPresenter, @selector(addButtonWithTitle:handler:), (IMP)&_logos_method$_ungrouped$WAActionSheetPresenter$addButtonWithTitle$handler$, (IMP*)&_logos_orig$_ungrouped$WAActionSheetPresenter$addButtonWithTitle$handler$);Class _logos_class$_ungrouped$WAChatSettingsViewController = objc_getClass("WAChatSettingsViewController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer*), strlen(@encode(UILongPressGestureRecognizer*))); i += strlen(@encode(UILongPressGestureRecognizer*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$WAChatSettingsViewController, @selector(handleLongPress:), (IMP)&_logos_method$_ungrouped$WAChatSettingsViewController$handleLongPress$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$WAChatSettingsViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$WAChatSettingsViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$WAChatSettingsViewController$viewDidLoad);} }
#line 268 "/Users/iTheGentle/Desktop/Projects/Nophami/Nophami/Nophami.xm"
