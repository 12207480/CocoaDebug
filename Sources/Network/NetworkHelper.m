//
//  CocoaDebug.swift
//  demo
//
//  Created by CocoaDebug on 26/11/2017.
//  Copyright © 2018 CocoaDebug. All rights reserved.
//

#import "NetworkHelper.h"
#import "CustomProtocol.h"

@interface NetworkHelper()

@end

@implementation NetworkHelper

+ (instancetype)shared
{
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)enable
{
    self.isEnable = YES;
    [NSURLProtocol registerClass:[CustomProtocol class]];
}

- (void)disable
{
    self.isEnable = NO;
    [NSURLProtocol unregisterClass:[CustomProtocol class]];
}

@end
