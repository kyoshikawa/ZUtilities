//
//  ZUtils.h
//
//  Created by Kaz Yoshikawa on 11/02/04.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifdef __cplusplus
}
#endif

extern void ZReportError(NSError *error);

extern NSString *ZDocumentDirectory();
extern NSString *ZCachesDirectory();
extern NSURL *ZDocumentDirectoryURL();
extern NSURL *ZCachesDirectoryURL();
extern BOOL ZFilePathEqualToFilePath(NSString *aPath1, NSString *aPath2);
extern NSNumber *ZTrueValue();
extern NSNumber *ZFalseValue();
extern NSRange NSRangeFromCFRange(CFRange range);
extern CFRange CFRangeFromNSRange(NSRange range);

#ifdef __cplusplus
}
#endif
