//
//  ViewController.m
//  AUPlayer
//
//  Created by apple on 2017/2/9.
//  Copyright © 2017年 xiaokai.zhan. All rights reserved.
//

#import "ViewController.h"
#import "AUGraphPlayer.h"

@interface ViewController ()
@property(nonatomic, assign) BOOL   isAcc;
@end

@implementation ViewController
{
    AUGraphPlayer*                  graphPlayer;
}

+ (NSString *)bundlePath:(NSString *)fileName {
    return [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:fileName];
}

+ (NSString *)documentsPath:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _isAcc = NO;
}

- (IBAction)playMusic:(id)sender {
    NSLog(@"Play Music...");
    if(graphPlayer) {
        [graphPlayer stop];
    }
//    NSString* filePath = [CommonUtil bundlePath:@"MiAmor.mp3"];
    NSString* filePath = [ViewController bundlePath:@"0fe2a7e9c51012210eaaa1e2b103b1b1.m4a"];
    graphPlayer = [[AUGraphPlayer alloc] initWithFilePath:filePath];
    [graphPlayer play];
}
- (IBAction)switch:(id)sender {
    _isAcc = !_isAcc;
    [graphPlayer setInputSource:_isAcc];
}
- (IBAction)stopMusic:(id)sender {
    NSLog(@"Stop Music...");
    [graphPlayer stop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
