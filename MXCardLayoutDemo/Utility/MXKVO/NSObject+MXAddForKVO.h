#import <Foundation/Foundation.h>

typedef void(^MXKVOBlock)(id obj, id oldVal, id newVal);

@interface NSObject (MXAddForKVO)

/**
 *  block会自动retain内部捕获的对象。removeObserverBlocksForKeyPath或者removeObserverBlocks后会释放块，并且释放捕获的对象。
 *
 */
- (void)addObserverBlockForKeyPath:(NSString*)keyPath block:(MXKVOBlock)block;

- (void)removeObserverBlocksForKeyPath:(NSString*)keyPath;

- (void)removeObserverBlocks;

@end