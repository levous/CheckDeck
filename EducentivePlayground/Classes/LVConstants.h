
// As this number goes up, logging gets more verbose. Set to 0 to prevent all logging.
#define IM_LOG_LEVEL 4

// Log macros
#if IM_LOG_LEVEL >= 1 /* should eventually be 4 */
// Instances of IMLog() are used for all kinds of things. We should migrate toward more specific methods, then down-prioritize this.
#define IMLog(formatString,...){ \
[IMInstrumentationController logWithFormat:(formatString), ## __VA_ARGS__]; \
}
#else
#define IMLog(formatString,...)
#endif

#if IM_LOG_LEVEL >= 3
#define IMLogInfo(formatString,...){ \
[IMInstrumentationController logWithFormat:(formatString), ## __VA_ARGS__]; \
}
#else
#define IMLogInfo(formatString,...)
#endif

#if IM_LOG_LEVEL >= 2
#define IMLogWarning(formatString,...){ \
[IMInstrumentationController logWithFormat:(formatString), ## __VA_ARGS__]; \
}
#else
#define IMLogWarning(formatString,...)
#endif

#if IM_LOG_LEVEL >= 1
#define IMLogError(formatString,...){ \
[IMInstrumentationController logWithFormat:(formatString), ## __VA_ARGS__]; \
}
#else 
#define IMLogError(formatString,...)
#endif

// used from the Levous library classes
#define LVLog(formatString,...){ \
[IMInstrumentationController logWithFormat:(formatString), ## __VA_ARGS__]; \
}
