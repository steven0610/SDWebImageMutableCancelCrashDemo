//
//  ViewController.m
//  SDTestProject
//
//  Created by 赵露 on 2016/11/15.
//  Copyright © 2016年 赵露. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *imgViewAry;
@property (nonatomic, strong) NSMutableArray *imgUrlAry;
@property (nonatomic, assign) NSUInteger count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
    [self startDownload];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData
{
    _count = 0;
    
    _imgUrlAry = [[NSMutableArray alloc] init];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn//p1/big/n_v1bj3gzr536anfrha6nfxa_761c4f57dfed11ac.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn/p1/big/n_v1bj3gzsdqqmuvqlytovjq_e219ad2f289ed6de.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn//p1/big/n_v1bl2lwtobgqnvqrirh5ia_6c7ea76f39c78102.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn//p1/big/n_v1bl2lwkmwgqnvqxsklbcq_d016075a4f426d09.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn/p1/big/n_v1bkujjdzkratfq3zcjqpa_cdebc1e04c8f0db9.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn//p1/big/n_v1bkuyfvmwgqnvqt5wxzlq_4efbf870af0a0e2d.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn/p1/big/n_v1bj3gzsfehasvrcvqavfq_e219ad2f289ed6de.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn/p1/big/n_v1bl2lwxtcqyuvrwh5q4ba_c5e82e3eff7fcb9a.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn//p1/big/n_v1bj3gzr536anfrha6nfxa_761c4f57dfed11ac.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn/p1/big/n_v1bj3gzsdqqmuvqlytovjq_e219ad2f289ed6de.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn//p1/big/n_v1bl2lwtobgqnvqrirh5ia_6c7ea76f39c78102.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn//p1/big/n_v1bl2lwkmwgqnvqxsklbcq_d016075a4f426d09.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn/p1/big/n_v1bkujjdzkratfq3zcjqpa_cdebc1e04c8f0db9.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn//p1/big/n_v1bkuyfvmwgqnvqt5wxzlq_4efbf870af0a0e2d.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn/p1/big/n_v1bj3gzsfehasvrcvqavfq_e219ad2f289ed6de.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn/p1/big/n_v1bj3gzr44paqvq4h2yixq_761c4f57dfed11ac.jpg"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn/p1/big/n_v1bl2lwkfhpyvfqatdvexq_d016075a4f426d09.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn//p1/big/n_v1bl2lwtp5s26vpielrigq_6c7ea76f39c78102.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn//p1/big/n_v1bkuyfvkcs66vpgl3aifq_4efbf870af0a0e2d.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn//p1/big/n_v1bl2lwkl7s66vo77hdaia_d016075a4f426d09.png"];
    [_imgUrlAry addObject:@"http://pic1.58cdn.com.cn//p1/big/n_v1bj3gzsd3rdjfpd4olywa_e219ad2f289ed6de.png"];
    [_imgUrlAry addObject:@"http://zzpic2.58cdn.com.cn/zhuanzh/n_v1bl2lwkag5esvqussrisa_280_280.jpg?t=5&qa=90"];
    [_imgUrlAry addObject:@"http://zzpic2.58cdn.com.cn/zhuanzh/n_v1bl2lwtpj4h2flw6hqv6q_280_280.jpg?t=5&qa=90"];
    [_imgUrlAry addObject:@"http://wx.qlogo.cn/mmopen/lCwVB66etfCHHX4WUJZDGmqOceDicQtoywSnVccF6Ert5ib0wibqCV9NdLUPl8WjicubqXVnib5dNwuL6m3EUTkCOia3GSDVMtW3Jib/0?t=5&qa=90"];
    [_imgUrlAry addObject:@"http://wx.qlogo.cn/mmopen/uZGbtWQKIKe2vSbgj8LE0R3OeZBO35Wv1ibV1LXl4Ged3DBiaWic6y3ialQDDJGiaib1yLTqep3Rg3rQtQ9knHhCia31CDicS776rybz/0?t=5&qa=90"];
    [_imgUrlAry addObject:@"http://wx.qlogo.cn/mmopen/LHdtlaBo22fGVE1M3oFOYZibyqarHGkLMvKBwOVd2ibznsYEkoO2RDyCJp0xRGpN0uicjgTkLZh2LV4OWx0vD3ePw/0?t=5&qa=90"];
    [_imgUrlAry addObject:@"http://wx.qlogo.cn/mmopen/LHdtlaBo22fGVE1M3oFOYZibyqarHGkLMvKBwOVd2ibznsYEkoO2RDyCJp0xRGpN0uicjgTkLZh2LV4OWx0vD3ePw/96?t=5&qa=90"];
    [_imgUrlAry addObject:@"http://wx.qlogo.cn/mmopen/lCwVB66etfCHHX4WUJZDGmqOceDicQtoywSnVccF6Ert5ib0wibqCV9NdLUPl8WjicubqXVnib5dNwuL6m3EUTkCOia3GSDVMtW3Jib/0?t=5&qa=90"];
    [_imgUrlAry addObject:@"http://wx.qlogo.cn/mmopen/uZGbtWQKIKe2vSbgj8LE0R3OeZBO35Wv1ibV1LXl4Ged3DBiaWic6y3ialQDDJGiaib1yLTqep3Rg3rQtQ9knHhCia31CDicS776rybz/0?t=5&qa=90"];
    [_imgUrlAry addObject:@"http://wx.qlogo.cn/mmopen/LHdtlaBo22fGVE1M3oFOYZibyqarHGkLMvKBwOVd2ibznsYEkoO2RDyCJp0xRGpN0uicjgTkLZh2LV4OWx0vD3ePw/0?t=5&qa=90"];
    
    _imgViewAry = [[NSMutableArray alloc] initWithCapacity:8];
    for (int i = 0; i < 8; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        [imgView setFrame:CGRectMake(0, 40 + i * 80, 80, 80)];
        [self.view addSubview:imgView];
        [_imgViewAry addObject:imgView];
    }
}

- (NSString *)randomAUrl
{
    NSUInteger index = arc4random() % _imgUrlAry.count;
    return _imgUrlAry[index];
}

- (void)startDownload
{
    NSLog(@"start download: %@", @(_count++));
    [[SDWebImageManager sharedManager].imageCache clearMemory];
    [[SDWebImageManager sharedManager].imageCache clearDiskOnCompletion:nil];
    for (int i = 0; i < _imgViewAry.count; i++) {
        UIImageView *imgView = _imgViewAry[i];
        [imgView sd_setImageWithURL:[NSURL URLWithString:[self randomAUrl]]];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startDownload];
    });
}


@end
