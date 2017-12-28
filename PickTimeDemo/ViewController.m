//
//  ViewController.m
//  PickTimeDemo
//
//  Created by 蔡强 on 2017/12/27.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

#import "ViewController.h"
#import "CQPickTimeAlertModel.h"
#import "CQPickTimeAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //------- 创建model -------//
    
    NSMutableArray *modelsArray = [NSMutableArray array];
    
    for (int i = 0; i < 3; i ++) {
        CQPickTimeAlertModel *model = [[CQPickTimeAlertModel alloc] init];
        
        switch (i) {
            case 0:
            {
                model.title = @"满免";
                model.desc  = @"亲爱的小主，hehda";
            }
                break;
                
            case 1:
            {
                model.title = @"限时购";
                model.desc  = @"全部限时购全部限时购全部限时购全部限时购全部限时购全部限时购全部限时购全部限时购全部限时购全部限时购全部限时购全部限时购全部限时购全部限时购全部限时购全部限时购全部限时购全部限时购";
            }
                break;
                
            case 2:
            {
                model.title = @"热线";
                model.desc  = @"110";
            }
                break;
                
            default:
                break;
        }
        
        [modelsArray addObject:model];
    }
    
    //------- 创建view -------//
    
    CQPickTimeAlertView *aview = [[CQPickTimeAlertView alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 20)];
    [self.view addSubview:aview];
    aview.itemsArray = modelsArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
