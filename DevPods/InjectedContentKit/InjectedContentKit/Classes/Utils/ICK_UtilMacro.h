//
//  ICK_UtilMacro.h
//  MobileExperience
//
//  Created by Liyu on 15/7/16.
//  Copyright (c) 2015年 NetDragon. All rights reserved.
//

#ifndef MobileExperience_ICK_UtilMacro_h
#define MobileExperience_ICK_UtilMacro_h

#import <dlfcn.h>
#import <sys/types.h>

// 工具类
#define ICK_ValueOrEmpty(value)     ((value != nil)?(value):@"")

#define _(x)                NSLocalizedString(x, @"")

#endif
