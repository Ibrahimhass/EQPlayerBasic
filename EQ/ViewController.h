//
//  ViewController.h
//  EQ
//
//  Created by mineharu on 2015/09/01.
//  Copyright (c) 2015年 mineharu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *sliderHigh;
@property (weak, nonatomic) IBOutlet UISlider *sliderLow;
@property (weak, nonatomic) IBOutlet UISlider *slider16K;
@property (weak, nonatomic) IBOutlet UISlider *slider8K;
@property (weak, nonatomic) IBOutlet UISlider *slider4K;
@property (weak, nonatomic) IBOutlet UISlider *slider2K;
@property (weak, nonatomic) IBOutlet UISlider *slider1K;
@property (weak, nonatomic) IBOutlet UISlider *slider500;
@property (weak, nonatomic) IBOutlet UISlider *slider250;
@property (weak, nonatomic) IBOutlet UISlider *slider125;
@property (weak, nonatomic) IBOutlet UISlider *slider64;
@property (weak, nonatomic) IBOutlet UISlider *slider32;

@property (weak, nonatomic) IBOutlet UILabel *labelHigh;
@property (weak, nonatomic) IBOutlet UILabel *labelLow;
@property (weak, nonatomic) IBOutlet UILabel *label16K;
@property (weak, nonatomic) IBOutlet UILabel *label8K;
@property (weak, nonatomic) IBOutlet UILabel *label4K;
@property (weak, nonatomic) IBOutlet UILabel *label2K;
@property (weak, nonatomic) IBOutlet UILabel *label1K;
@property (weak, nonatomic) IBOutlet UILabel *label500;
@property (weak, nonatomic) IBOutlet UILabel *label250;
@property (weak, nonatomic) IBOutlet UILabel *label125;
@property (weak, nonatomic) IBOutlet UILabel *label64;
@property (weak, nonatomic) IBOutlet UILabel *label32;

- (IBAction)touchUpPlayBtn:(id)sender;
- (IBAction)touchUpStop:(id)sender;

- (IBAction)slideHighAction:(id)sender;
- (IBAction)slideLowAction:(id)sender;
- (IBAction)slide16KAction:(id)sender;
- (IBAction)slider8KAction:(id)sender;
- (IBAction)slider4KAction:(id)sender;
- (IBAction)slider2KAction:(id)sender;
- (IBAction)slider1KAction:(id)sender;
- (IBAction)slider500Action:(id)sender;
- (IBAction)slider250Action:(id)sender;
- (IBAction)slider125Action:(id)sender;
- (IBAction)slider64Action:(id)sender;
- (IBAction)slider32Action:(id)sender;

@end

