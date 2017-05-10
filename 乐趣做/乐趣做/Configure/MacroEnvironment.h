//
//  MacroEnvironment.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#ifndef MacroEnvironment_h
#define MacroEnvironment_h


#ifdef DEBUG // 处于开发阶段

#define NSLog(...) NSLog(__VA_ARGS__)

#define ErrorLog(...) NSLog(__VA_ARGS__)

#else // 处于发布阶段
#define NSLog(...)
#endif

#ifndef __OPTIMIZE__

/* -------------- <开发阶段> ---------------- */

#define NSLog(...) NSLog(__VA_ARGS__)

//正式发布接口
//#define VTInterFaceNet   @"http://api.vart.cc/4/"

//测试接口

//#define VTInterFaceNet   @"http://api-test.vart.cc/4/"

//测试接口
#define InterFaceNet    @"http://api.lequz.com/v2/"

/* ----------------------------------------- */

#else

/* --------------- <发布阶段> --------------- */

#define NSLog(...) {}

#define InterFaceNet @"http://api.lequz.com/v2/"

/* ----------------------------------------- */

#endif


#endif /* MacroEnvironment_h */
