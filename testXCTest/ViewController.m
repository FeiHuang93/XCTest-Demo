//
//  ViewController.m
//  testXCTest
//
//  Created by fei huang on 2019/8/16.
//  Copyright © 2019 fei huang. All rights reserved.
//

#import "ViewController.h"
#import<CommonCrypto/CommonDigest.h>

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.label];
    [self.view addSubview:self.btn1];
    [self.view addSubview:self.btn2];
}

#pragma mark normal method
- (NSString *)string2md5:(NSString *)inputString {
    
    const char *cStr = [inputString UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (void)performanceExample:(NSInteger)number {
    NSInteger index = 0;
    for (NSInteger i = 0; i <= number; i ++) {
        index += i;
    }
}

#pragma mark selector Method
- (void)clickBtn1 {
    self.label.text = @"你好，我是btn1点的";
}

- (void)clickBtn2 {
    self.label.text = @"我是btn2点的,你好";
}

#pragma mark lazy load
- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(150, 100, [UIScreen mainScreen].bounds.size.width/2, 30)];
        [_label setText:[NSString stringWithFormat:@"testLabel"]];
    }
    return _label;
}

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [[UIButton alloc] initWithFrame:CGRectMake(40, 200, 80, 30)];
        [_btn1 setTitle:@"btn1" forState:UIControlStateNormal];
        [_btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(clickBtn1) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1;
}

- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [[UIButton alloc] initWithFrame:CGRectMake(110, 200, 80, 30)];
        [_btn2 setTitle:@"btn2" forState:UIControlStateNormal];
        [_btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_btn2 addTarget:self action:@selector(clickBtn2) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn2;
}

@end
