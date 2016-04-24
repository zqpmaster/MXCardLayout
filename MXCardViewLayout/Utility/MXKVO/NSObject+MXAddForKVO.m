
#import "NSObject+MXAddForKVO.h"
#import <objc/objc.h>
#import <objc/runtime.h>

static const int block_key;

@interface _MXNSObjectKVOBlockTarget : NSObject

@property (nonatomic, copy) MXKVOBlock block;

- (id)initWithBlock:(MXKVOBlock)block;

@end

@implementation _MXNSObjectKVOBlockTarget

- (id)initWithBlock:(MXKVOBlock)block
{
    self = [super init];
    if (self)
    {
        self.block = block;
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (!self.block) return;
    
    BOOL isPrior = [[change objectForKey:NSKeyValueChangeNotificationIsPriorKey] boolValue];//不接收改变之前的值
    if (isPrior) return;
    
    NSKeyValueChange changeKind = [[change objectForKey:NSKeyValueChangeKindKey] integerValue];
    if (changeKind != NSKeyValueChangeSetting) return;//不接收集合类型对象的改变
    
    id oldVal = [change objectForKey:NSKeyValueChangeOldKey];
    if (oldVal == [NSNull null]) oldVal = nil;
    
    id newVal = [change objectForKey:NSKeyValueChangeNewKey];
    if (newVal == [NSNull null]) newVal = nil;
    
    self.block(object, oldVal, newVal);
}

@end



@implementation NSObject (MXAddForKVO)

- (void)addObserverBlockForKeyPath:(NSString *)keyPath block:(MXKVOBlock)block
{
    if (!keyPath || !block) return;
    _MXNSObjectKVOBlockTarget *target = [[_MXNSObjectKVOBlockTarget alloc] initWithBlock:block];
    NSMutableDictionary *dic = [self _MX_allNSObjectObserverBlocks];
    NSMutableArray *arr = dic[keyPath];
    if (!arr)
    {
        arr = [NSMutableArray new];
        dic[keyPath] = arr;
    }
    
    [arr addObject:target];
    [self addObserver:target forKeyPath:keyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
}

- (void)removeObserverBlocksForKeyPath:(NSString *)keyPath
{
    if (!keyPath) return;
    NSMutableDictionary *dic = [self _MX_allNSObjectObserverBlocks];
    NSMutableArray *arr = dic[keyPath];
    [arr enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        [self removeObserver:obj forKeyPath:keyPath];
    }];
    
    [dic removeObjectForKey:keyPath];
}

- (void)removeObserverBlocks
{
    NSMutableDictionary *dic = [self _MX_allNSObjectObserverBlocks];
    [dic enumerateKeysAndObjectsUsingBlock: ^(NSString *key, NSArray *arr, BOOL *stop){
        [arr enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
            [self removeObserver:obj forKeyPath:key];
        }];
    }];
    
    [dic removeAllObjects];
}

- (NSMutableDictionary *)_MX_allNSObjectObserverBlocks
{
    NSMutableDictionary *targets = objc_getAssociatedObject(self, &block_key);
    if (!targets)
    {
        targets = [NSMutableDictionary new];
        objc_setAssociatedObject(self, &block_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return targets;
}

@end
