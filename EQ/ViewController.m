//
//  ViewController.m
//  EQ
//
//  Created by mineharu on 2015/09/01.
//  Copyright (c) 2015年 mineharu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    AVAudioEngine *engine;
    AVAudioUnitEQ *EQNode;
    AVAudioFile *audioFile;
    AVAudioPlayerNode *playerNode;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    engine = [[AVAudioEngine alloc] init];
    playerNode = [AVAudioPlayerNode new];
    EQNode = [[AVAudioUnitEQ alloc] initWithNumberOfBands:12];
    [engine attachNode:EQNode];
    [engine attachNode:playerNode];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Dangal_-_Title_Song-Pritam-Daler_Mehndi-www.Mp3Mad.Com.mp3" ofType:nil];
    audioFile = [[AVAudioFile alloc] initForReading:[NSURL fileURLWithPath:filePath] error:nil];
    
    // high
//    AVAudioUnitEQFilterParameters *parametersHigh = EQNode.bands[0];
//    parametersHigh.filterType = AVAudioUnitEQFilterTypeHighPass;
//    parametersHigh.frequency = (int)_sliderHigh.value;
//    parametersHigh.bypass = NO;
//    // low
//    AVAudioUnitEQFilterParameters *parametersLow = EQNode.bands[1];
//    parametersLow.filterType = AVAudioUnitEQFilterTypeLowPass;
//    parametersLow.frequency = (int)_sliderLow.value;
//    parametersLow.bypass = NO;
    // 16k
    AVAudioUnitEQFilterParameters *parameters16k = EQNode.bands[2];
    parameters16k.filterType = AVAudioUnitEQFilterTypeParametric;
    parameters16k.frequency = 16000.0f;
    parameters16k.bandwidth = 2.0f;
    parameters16k.gain = _slider16K.value;
    parameters16k.bypass = NO;
    // 8k
    AVAudioUnitEQFilterParameters *parameters8k = EQNode.bands[3];
    parameters8k.filterType = AVAudioUnitEQFilterTypeParametric;
    parameters8k.frequency = 8000.0f;
    parameters8k.bandwidth = 2.0f;
    parameters8k.gain = _slider8K.value;
    parameters8k.bypass = NO;
    // 4k
    AVAudioUnitEQFilterParameters *parameters4k = EQNode.bands[4];
    parameters4k.filterType = AVAudioUnitEQFilterTypeParametric;
    parameters4k.frequency = 4000.0f;
    parameters4k.bandwidth = 2.0f;
    parameters4k.gain = _slider4K.value;
    parameters4k.bypass = NO;
    // 2k
    AVAudioUnitEQFilterParameters *parameters2k = EQNode.bands[5];
    parameters2k.filterType = AVAudioUnitEQFilterTypeParametric;
    parameters2k.frequency = 2000.0f;
    parameters2k.bandwidth = 2.0f;
    parameters2k.gain = _slider2K.value;
    parameters2k.bypass = NO;
    // 1k
    AVAudioUnitEQFilterParameters *parameters1k = EQNode.bands[6];
    parameters1k.filterType = AVAudioUnitEQFilterTypeParametric;
    parameters1k.frequency = 1000.0f;
    parameters1k.bandwidth = 2.0f;
    parameters1k.gain = _slider1K.value;
    parameters1k.bypass = NO;
    // 500
    AVAudioUnitEQFilterParameters *parameters500 = EQNode.bands[7];
    parameters500.filterType = AVAudioUnitEQFilterTypeParametric;
    parameters500.frequency = 500.0f;
    parameters500.bandwidth = 2.0f;
    parameters500.gain = _slider500.value;
    parameters500.bypass = NO;
    // 250
    AVAudioUnitEQFilterParameters *parameters250 = EQNode.bands[8];
    parameters250.filterType = AVAudioUnitEQFilterTypeParametric;
    parameters250.frequency = 250.0f;
    parameters250.bandwidth = 2.0f;
    parameters250.gain = _slider250.value;
    parameters250.bypass = NO;
    // 125
    AVAudioUnitEQFilterParameters *parameters125 = EQNode.bands[9];
    parameters125.filterType = AVAudioUnitEQFilterTypeParametric;
    parameters125.frequency = 125.0f;
    parameters125.bandwidth = 2.0f;
    parameters125.gain = _slider125.value;
    parameters125.bypass = NO;
    // 64
    AVAudioUnitEQFilterParameters *parameters64 = EQNode.bands[10];
    parameters64.filterType = AVAudioUnitEQFilterTypeParametric;
    parameters64.frequency = 64.0f;
    parameters64.bandwidth = 2.0f;
    parameters64.gain = _slider64.value;
    parameters64.bypass = NO;
    // 64
    AVAudioUnitEQFilterParameters *parameters32 = EQNode.bands[11];
    parameters32.filterType = AVAudioUnitEQFilterTypeParametric;
    parameters32.frequency = 32.0f;
    parameters32.bandwidth = 2.0f;
    parameters32.gain = _slider32.value;
    parameters32.bypass = NO;
    
    // なにこれ？
    AVAudioMixerNode *mixerNode = [engine mainMixerNode];
    [engine connect:playerNode to:EQNode format:audioFile.processingFormat];
    [engine connect:EQNode to:mixerNode format:audioFile.processingFormat];
    
    // エンジン起動
    NSError *error;
    [engine startAndReturnError:&error];
    if (error) {
        NSLog(@"error:%@", error);
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchUpPlayBtn:(id)sender {
    if (!playerNode.isPlaying) {
        [self play];
    }
}

- (IBAction)touchUpStop:(id)sender {
    if (playerNode.isPlaying) {
        [playerNode stop];
    }
}

//- (IBAction)slideHighAction:(id)sender {
//    UISlider *slider = (UISlider*)sender;
//    AVAudioUnitEQFilterParameters * filterParameters = EQNode.bands[0];
//    filterParameters.filterType = AVAudioUnitEQFilterTypeHighPass;
//    filterParameters.frequency = (long)slider.value;
//    _labelHigh.text = [NSString stringWithFormat:@"%ld", (long)slider.value];
//}
//
//- (IBAction)slideLowAction:(id)sender {
//    UISlider *slider = (UISlider*)sender;
//    AVAudioUnitEQFilterParameters * filterParameters = EQNode.bands[1];
//    filterParameters.filterType = AVAudioUnitEQFilterTypeLowPass;
//    filterParameters.frequency = (long)slider.value;
//    _labelLow.text = [NSString stringWithFormat:@"%ld", (long)slider.value];
//}

- (IBAction)slide16KAction:(id)sender {
    UISlider *slider = (UISlider*)sender;
    AVAudioUnitEQFilterParameters * filterParameters = EQNode.bands[2];
    filterParameters.gain = (long)slider.value;
    _label16K.text = [NSString stringWithFormat:@"%ld", (long)slider.value];
}

- (IBAction)slider8KAction:(id)sender {
    UISlider *slider = (UISlider*)sender;
    AVAudioUnitEQFilterParameters * filterParameters = EQNode.bands[3];
    filterParameters.gain = (long)slider.value;
    _label8K.text = [NSString stringWithFormat:@"%ld", (long)slider.value];
}

- (IBAction)slider4KAction:(id)sender {
    UISlider *slider = (UISlider*)sender;
    AVAudioUnitEQFilterParameters * filterParameters = EQNode.bands[4];
    filterParameters.gain = (long)slider.value;
    _label4K.text = [NSString stringWithFormat:@"%ld", (long)slider.value];
}

- (IBAction)slider2KAction:(id)sender {
    UISlider *slider = (UISlider*)sender;
    AVAudioUnitEQFilterParameters * filterParameters = EQNode.bands[5];
    filterParameters.gain = (long)slider.value;
    _label2K.text = [NSString stringWithFormat:@"%ld", (long)slider.value];
}

- (IBAction)slider1KAction:(id)sender {
    UISlider *slider = (UISlider*)sender;
    AVAudioUnitEQFilterParameters * filterParameters = EQNode.bands[6];
    filterParameters.gain = (long)slider.value;
    _label1K.text = [NSString stringWithFormat:@"%ld", (long)slider.value];
}

- (IBAction)slider500Action:(id)sender {
    UISlider *slider = (UISlider*)sender;
    AVAudioUnitEQFilterParameters * filterParameters = EQNode.bands[7];
    filterParameters.gain = (long)slider.value;
    _label500.text = [NSString stringWithFormat:@"%ld", (long)slider.value];
}

- (IBAction)slider250Action:(id)sender {
    UISlider *slider = (UISlider*)sender;
    AVAudioUnitEQFilterParameters * filterParameters = EQNode.bands[8];
    filterParameters.gain = (long)slider.value;
    _label250.text = [NSString stringWithFormat:@"%ld", (long)slider.value];
}

- (IBAction)slider125Action:(id)sender {
    UISlider *slider = (UISlider*)sender;
    AVAudioUnitEQFilterParameters * filterParameters = EQNode.bands[9];
    filterParameters.gain = (long)slider.value;
    _label125.text = [NSString stringWithFormat:@"%ld", (long)slider.value];
}
- (IBAction)slider64Action:(id)sender {
    UISlider *slider = (UISlider*)sender;
    AVAudioUnitEQFilterParameters * filterParameters = EQNode.bands[10];
    filterParameters.gain = (long)slider.value;
    _label64.text = [NSString stringWithFormat:@"%ld", (long)slider.value];
}
- (IBAction)slider32Action:(id)sender {
    UISlider *slider = (UISlider*)sender;
    AVAudioUnitEQFilterParameters * filterParameters = EQNode.bands[11];
    filterParameters.gain = (long)slider.value;
    _label32.text = [NSString stringWithFormat:@"%ld", (long)slider.value];
}

#pragma mark self methods
- (void)play
{
    // 再生準備待ち
    [playerNode scheduleFile:audioFile atTime:nil completionHandler:^{
        [self play];
    }];
    [playerNode play];
}
@end
