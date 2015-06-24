//
//  MonaLisaViewController.m
//  MonaLisa
//
//  Created by sap_all\c5152815 on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MonaLisaViewController.h"

@implementation MonaLisaViewController

@synthesize baseImgView;
@synthesize overlayImgView;
@synthesize maskImgView;

- (void)dealloc
{
    [baseImgView release];
    [overlayImgView release];
    [maskImgView release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //masking
    self.overlayImgView.layer.mask = self.maskImgView.layer;
    self.overlayImgView.layer.masksToBounds = YES;
    
    //hides the mask
    self.maskImgView.hidden = YES;
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHandler:)];
    
    [self.view addGestureRecognizer:panGesture];
    
    [panGesture release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}

#pragma mark - Gesture handler

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];   
   
    self.maskImgView.center = touchPoint;
    self.maskImgView.hidden = NO;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.maskImgView.hidden = YES;
}

- (void)panGestureHandler:(UIGestureRecognizer *)recognizer
{    
    CGPoint touchPoint = [recognizer locationInView:self.view];
        
    self.maskImgView.center = touchPoint;
    
    if(recognizer.state == UIGestureRecognizerStateEnded)
    {
        self.maskImgView.hidden = YES;
    }
}


@end
