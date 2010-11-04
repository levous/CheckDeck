#import "InstrumentationController.h"

#define CDLog(formatString,...){ \
[InstrumentationController logWithFormat:(formatString), ## __VA_ARGS__]; \
}

#define CDLogInfo(formatString,...){ \
[InstrumentationController logWithFormat:(formatString), ## __VA_ARGS__]; \
}

#define CDLogWarning(formatString,...){ \
[InstrumentationController logWithFormat:(formatString), ## __VA_ARGS__]; \
}

#define CDLogError(formatString,...){ \
[InstrumentationController logWithFormat:(formatString), ## __VA_ARGS__]; \
}

