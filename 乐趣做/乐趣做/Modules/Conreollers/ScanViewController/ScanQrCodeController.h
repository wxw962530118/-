//
//  ScanQrCodeController.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^ScanResult)(NSString*result,BOOL isSucceed);

@interface ScanQrCodeController : BaseViewController

@property(nonatomic,assign)BOOL isScanning;

-(id)initWithBlock:(ScanResult)result;

@end
