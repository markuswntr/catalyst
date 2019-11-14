#if TARGET_OS_MACCATALYST

#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CatalystToolbarItem : NSToolbarItem

+ (instancetype)searchItemWithItemIdentifier:(NSToolbarItemIdentifier)itemIdentifier
                        textDidChangeHandler:(void(^)(NSString *searchText))textDidChangeHandler
                        NS_SWIFT_NAME(searchItem(itemIdentifier:onSearchTextChanged:));

@property (nonatomic) NSString *searchText;

- (void)searchItemBecomeFirstResponder;

@end

@interface CatalystToolbar : NSToolbar

@property NSToolbarSizeMode sizeMode;

@end

NS_ASSUME_NONNULL_END

#endif
