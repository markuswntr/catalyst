#import "Toolbar.h"
#import <UIKit/UIKit.h>
#import <UIKit/NSToolbar+UIKitAdditions.h>

#pragma mark - Search Field

@class CatalystSearchField;

@protocol CatalystSearchFieldDelegate

@optional
- (void)searchFieldDidStartSearching:(CatalystSearchField *)sender;
- (void)searchFieldDidEndSearching:(CatalystSearchField *)sender;

@required
- (void)controlTextDidChange:(NSNotification *)notification;

@end

@interface CatalystSearchField : NSObject

@property(weak) id<CatalystSearchFieldDelegate> delegate;

@property (nonatomic,readwrite) NSString *stringValue;

@end

#pragma mark - Toolbar Item

@interface CatalystToolbarItem ()

@property id view;

@property CGSize minSize;
@property CGSize maxSize;

@end

@interface CatalystToolbarItem () <CatalystSearchFieldDelegate>

@property (nonatomic,copy) void(^textDidChangeHandler)(NSString *stringValue);

@property id image;
@property id imageStore;

@end

@implementation CatalystToolbarItem

@dynamic view;
@dynamic minSize;
@dynamic maxSize;

@dynamic image;

+ (instancetype)searchItemWithItemIdentifier:(NSToolbarItemIdentifier)itemIdentifier textDidChangeHandler:(void(^)(NSString *stringValue))textDidChangeHandler
{
    CatalystToolbarItem *toolbarItem = [[[self class] alloc] initWithItemIdentifier:itemIdentifier];

    CatalystSearchField *searchField = [NSClassFromString(@"NSSearchField") new];
    searchField.delegate = toolbarItem;
    toolbarItem.view = searchField;
    toolbarItem.maxSize = CGSizeMake(240, 44);
    toolbarItem.textDidChangeHandler = textDidChangeHandler;
    toolbarItem.paletteLabel = @"Search";
    return toolbarItem;
}

- (void)controlTextDidChange:(NSNotification *)notification
{
    CatalystSearchField *searchField = notification.object;
    if (self.textDidChangeHandler) self.textDidChangeHandler(searchField.stringValue);
}

- (void)setSearchText:(NSString *)searchText
{
    if (![self.view isKindOfClass:NSClassFromString(@"NSSearchField")]) return;
    CatalystSearchField *searchField = self.view;
    searchField.stringValue = searchText;
}

- (NSString *)searchText
{
    if (![self.view isKindOfClass:NSClassFromString(@"NSSearchField")]) return @"";
    CatalystSearchField *searchField = self.view;
    return searchField.stringValue;
}

- (void)searchItemBecomeFirstResponder
{
    [[self.view window] performSelector:@selector(makeFirstResponder:) withObject:self.view];
}

@end

#pragma mark - Toolbar

@implementation CatalystToolbar

@dynamic sizeMode;

@end
