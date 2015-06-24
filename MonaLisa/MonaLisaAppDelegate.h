//
//  MonaLisaAppDelegate.h
//  MonaLisa
//
//  Created by sap_all\c5152815 on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MonaLisaViewController;

@interface MonaLisaAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MonaLisaViewController *viewController;

@end
