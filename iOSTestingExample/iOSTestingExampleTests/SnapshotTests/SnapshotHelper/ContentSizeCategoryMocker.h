//
//  Created by Kamil Pyc on 30/11/15.
//  Copyright © 2015 Allegro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static CGFloat const iPhone4Width = 320.0;
static CGFloat const iPhone5Width = 320.0;
static CGFloat const iPhone6Width = 375.0;
static CGFloat const iPhone6PlusWidth = 414.0;
static CGFloat const iPadWidth = 768.0;

static CGFloat const iPhone4Height = 480.0;
static CGFloat const iPhone5Height = 568.0;
static CGFloat const iPhone6Height = 667.0;
static CGFloat const iPhone6PlusHeight = 736.0;
static CGFloat const iPadHeight = 1024.0;

static CGSize iPhone4PortraitSize = (CGSize){iPhone4Width, iPhone4Height};
static CGSize iPhone5PortraitSize = (CGSize){iPhone5Width, iPhone5Height};
static CGSize iPhone6PortraitSize = (CGSize){iPhone6Width, iPhone6Height};
static CGSize iPhone6PlusPortraitSize = (CGSize){iPhone6PlusWidth, iPhone6PlusHeight};
static CGSize iPadPortraitSize = (CGSize){iPadWidth, iPadHeight};

static CGSize iPhone4LandscapeSize = (CGSize){iPhone4Height, iPhone4Width};
static CGSize iPhone5LandscapeSize = (CGSize){iPhone5Height, iPhone5Width};
static CGSize iPhone6LandscapeSize = (CGSize){iPhone6Height, iPhone6Width};
static CGSize iPhone6PlusLandscapeSize = (CGSize){iPhone6PlusHeight, iPhone6PlusWidth};
static CGSize iPadLandscapeSize = (CGSize){iPadHeight, iPadWidth};


@interface ContentSizeCategoryMocker : NSObject

+ (void)mockContenSizeCategory:(nonnull NSString *)contentSizeCategory;
+ (void)stopMocking;

@end
