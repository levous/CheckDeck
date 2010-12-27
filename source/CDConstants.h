#import "LVInstrumentationController.h"

#define CDLog(formatString,...){ \
[LVInstrumentationController logWithFormat:(formatString), ## __VA_ARGS__]; \
}

#define CDLogInfo(formatString,...){ \
[LVInstrumentationController logWithFormat:(formatString), ## __VA_ARGS__]; \
}

#define CDLogWarning(formatString,...){ \
[LVInstrumentationController logWithFormat:(formatString), ## __VA_ARGS__]; \
}

#define CDLogError(formatString,...){ \
[LVInstrumentationController logWithFormat:(formatString), ## __VA_ARGS__]; \
}

