//
//  IWLogging.h
//  flirten
//
//  Created by 康梁 on 16/9/12.
//  Copyright © 2016年 Ideawise Ltd. All rights reserved.
//

#import "IWLoggingManager.h"

typedef NS_ENUM(NSInteger, IWLoggingLogLevel) {
    IWLoggingLogLevelOff = 0,
    IWLoggingLogLevelError = (1 << 0),
    IWLoggingLogLevelWarn = (1 << 1),
    IWLoggingLogLevelInfo = (1 << 2),
    IWLoggingLogLevelVerbose = (1 << 3),
};

/**
 * This is the single macro that all other macros below compile into.
 * This big multiline macro makes all the other macros easier to read.
 **/
#define LOG_MAYBE(isAsynchronous, lvl, flg, ctx, atag, fnct, frmt, ...) \
    [IWLoggingManager log:isAsynchronous                                           \
         level:lvl                                                      \
          flag:flg                                                      \
       context:ctx                                                      \
          file:__FILE__                                                 \
      function:fnct                                                     \
          line:__LINE__                                                 \
           tag:atag                                                     \
        format:(frmt), ##__VA_ARGS__]

// Global flag to enable/disable logging throughout the entire IWLogging framework.
#ifndef IWLogging_LOGGING_ENABLED
    #define IWLogging_LOGGING_ENABLED 1
#endif

// Define logging context for every log message coming from the IWLogging framework.
// The logging context can be extracted from the DDLogMessage from within the logging framework.
// This gives loggers, formatters, and filters the ability to optionally process them differently.
#define IWLogging_LOG_CONTEXT 5222

// Configure log levels.
#define IWLogging_LOG_LEVEL_ERROR   IWLoggingLogLevelError // 0...00001
#define IWLogging_LOG_LEVEL_WARN    IWLoggingLogLevelWarn // 0...00010
#define IWLogging_LOG_LEVEL_INFO    IWLoggingLogLevelInfo // 0...00100
#define IWLogging_LOG_LEVEL_VERBOSE IWLoggingLogLevelVerbose // 0...01000

#define IWLogging_LOG_LEVEL_OFF     0                                              // 0...00000
#define IWLogging_LOG_FLAG_ERROR   (IWLogging_LOG_LEVEL_OFF   | IWLogging_LOG_LEVEL_ERROR)   // 0...00001
#define IWLogging_LOG_FLAG_WARN    (IWLogging_LOG_LEVEL_ERROR | IWLogging_LOG_LEVEL_WARN)    // 0...00011
#define IWLogging_LOG_FLAG_INFO    (IWLogging_LOG_LEVEL_WARN  | IWLogging_LOG_LEVEL_INFO)    // 0...00111
#define IWLogging_LOG_FLAG_VERBOSE (IWLogging_LOG_LEVEL_INFO  | IWLogging_LOG_LEVEL_VERBOSE) // 0...01111

// Configure asynchronous logging.
// We follow the default configuration,
// but we reserve a special macro to easily disable asynchronous logging for debugging purposes.
#if DEBUG
    #define IWLogging_LOG_ASYNC_ENABLED  NO
#else
    #define IWLogging_LOG_ASYNC_ENABLED  YES
#endif

#define IWLogging_LOG_ASYNC_ERROR     ( NO && IWLogging_LOG_ASYNC_ENABLED)
#define IWLogging_LOG_ASYNC_WARN      (YES && IWLogging_LOG_ASYNC_ENABLED)
#define IWLogging_LOG_ASYNC_INFO      (YES && IWLogging_LOG_ASYNC_ENABLED)
#define IWLogging_LOG_ASYNC_VERBOSE   (YES && IWLogging_LOG_ASYNC_ENABLED)
#define IWLogging_LOG_ASYNC_TRACE     (YES && IWLogging_LOG_ASYNC_ENABLED)

// Define logging primitives.
// These are primarily wrappers around the macros defined in Lumberjack's DDLog.h header file.
#define IWLogging_LOG_OBJC_MAYBE(async, lvl, flg, ctx, frmt, ...) \
    LOG_MAYBE(async, lvl, flg, ctx, nil, sel_getName(_cmd), frmt, ##__VA_ARGS__)

#define IWLogError(frmt, ...)    IWLogging_LOG_OBJC_MAYBE(IWLogging_LOG_ASYNC_ERROR, IWLogging_LOG_LEVEL_ERROR, IWLogging_LOG_FLAG_ERROR,  \
    IWLogging_LOG_CONTEXT, frmt, ##__VA_ARGS__)

#define IWLog(frmt, ...)    IWLogging_LOG_OBJC_MAYBE(IWLogging_LOG_ASYNC_INFO, IWLogging_LOG_LEVEL_INFO, IWLogging_LOG_FLAG_INFO,    \
IWLogging_LOG_CONTEXT, frmt, ##__VA_ARGS__)

#if DEBUG

    #define IWLogWarn(frmt, ...)     IWLogging_LOG_OBJC_MAYBE(IWLogging_LOG_ASYNC_WARN, IWLogging_LOG_LEVEL_WARN, IWLogging_LOG_FLAG_WARN,   \
        IWLogging_LOG_CONTEXT, frmt, ##__VA_ARGS__)

    #define IWLogInfo(frmt, ...)     IWLogging_LOG_OBJC_MAYBE(IWLogging_LOG_ASYNC_INFO, IWLogging_LOG_LEVEL_INFO, IWLogging_LOG_FLAG_INFO,    \
        IWLogging_LOG_CONTEXT, frmt, ##__VA_ARGS__)

    #define IWLogVerbose(frmt, ...)  IWLogging_LOG_OBJC_MAYBE(IWLogging_LOG_ASYNC_VERBOSE, IWLogging_LOG_LEVEL_VERBOSE, IWLogging_LOG_FLAG_VERBOSE, \
        IWLogging_LOG_CONTEXT, frmt, ##__VA_ARGS__)

#elif STAGING

    #define IWLogWarn(frmt, ...)     IWLogging_LOG_OBJC_MAYBE(IWLogging_LOG_ASYNC_WARN, IWLogging_LOG_LEVEL_WARN, IWLogging_LOG_FLAG_WARN,   \
        IWLogging_LOG_CONTEXT, frmt, ##__VA_ARGS__)

    #define IWLogInfo(frmt, ...)

    #define IWLogVerbose(frmt, ...)

#else

    #define IWLogWarn(frmt, ...)

    #define IWLogInfo(frmt, ...)

    #define IWLogVerbose(frmt, ...)

#endif

// Setup logging for IWLoggingStream (and subclasses such as IWLoggingStreamFacebook)
#define IWLogging_LOG_FLAG_SEND      (1 << 5)
#define IWLogging_LOG_FLAG_RECV_PRE  (1 << 6) // Prints data before it goes to the parser
#define IWLogging_LOG_FLAG_RECV_POST (1 << 7) // Prints data as it comes out of the parser

#define IWLogging_LOG_FLAG_SEND_RECV (IWLogging_LOG_FLAG_SEND | IWLogging_LOG_FLAG_RECV_POST)

#define IWLogging_LOG_SEND      (loggingLogLevel & IWLogging_LOG_FLAG_SEND)
#define IWLogging_LOG_RECV_PRE  (loggingLogLevel & IWLogging_LOG_FLAG_RECV_PRE)
#define IWLogging_LOG_RECV_POST (loggingLogLevel & IWLogging_LOG_FLAG_RECV_POST)

#define IWLogging_LOG_ASYNC_SEND      (YES && IWLogging_LOG_ASYNC_ENABLED)
#define IWLogging_LOG_ASYNC_RECV_PRE  (YES && IWLogging_LOG_ASYNC_ENABLED)
#define IWLogging_LOG_ASYNC_RECV_POST (YES && IWLogging_LOG_ASYNC_ENABLED)

#define IWLoggingLogSend(format, ...)     IWLogging_LOG_OBJC_MAYBE(IWLogging_LOG_ASYNC_SEND, IWLoggingLogLevel, \
    IWLogging_LOG_FLAG_SEND, IWLogging_LOG_CONTEXT, format, ##__VA_ARGS__)