
// The general purpose logger. This ignores logging levels.
#ifdef DEBUG
    #define LVDPRINT(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
    #define LVDPRINT(xx, ...)  ((void)0)
#endif // #ifdef DEBUG

// Debug-only assertions.
#ifdef DEBUG

    #import <TargetConditionals.h>

    #if TARGET_IPHONE_SIMULATOR

        int LVIsInDebugger();
        // We leave the __asm__ in this macro so that when a break occurs, we don't have to step out of
        // a "breakInDebugger" function.
        #define LVDASSERT(xx) { if (!(xx)) { LVDPRINT(@"LVDASSERT failed: %s", #xx); \
            if (LVIsInDebugger()) { __asm__("int $3\n" : : ); }; } \
        } ((void)0)
    #else
        #define LVDASSERT(xx) { if (!(xx)) { LVDPRINT(@"LVDASSERT failed: %s", #xx); } } ((void)0)
    #endif // #if TARGET_IPHONE_SIMULATOR

#else
    #define LVDASSERT(xx) ((void)0)
#endif // #ifdef DEBUG


