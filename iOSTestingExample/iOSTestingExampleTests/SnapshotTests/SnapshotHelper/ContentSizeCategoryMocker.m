//
//  Created by Kamil Pyc on 30/11/15.
//  Copyright © 2015 Allegro. All rights reserved.
//

#import "ContentSizeCategoryMocker.h"
#import <OCMock/OCMock.h>

@implementation ContentSizeCategoryMocker

static id applicationMock = nil;

+ (void)mockContentSizeCategory:(NSString *)contentSizeCategory {
    applicationMock = OCMPartialMock([UIApplication sharedApplication]);
    OCMStub([applicationMock preferredContentSizeCategory]).andReturn(contentSizeCategory);
    [[NSNotificationCenter defaultCenter] postNotificationName:UIContentSizeCategoryDidChangeNotification
                                                        object:nil];
}

+ (void)stopMocking {
    [applicationMock stopMocking];
    applicationMock = nil;
}

@end
