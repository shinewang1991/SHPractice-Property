//
//  ViewController.m
//  SHPractice-Property
//
//  Created by Shine on 2019/3/31.
//  Copyright © 2019 shine. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSString *nameStrong;
@property (nonatomic, copy) NSString *nameCopy;
@property (nonatomic, strong) NSArray *arrayStrong;
@property (nonatomic, copy) NSArray *arrayCopy;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSString
    NSString *name = [NSString stringWithFormat:@"Michael"];
    self.nameStrong = name;
    self.nameCopy = name;
    NSLog(@"原对象地址----%p,指针地址------%p,对象值------%@",name,&name,name);
    NSLog(@"strong修饰的对象地址----%p,指针地址------%p,对象值------%@",_nameStrong,&_nameStrong,_nameStrong);
    NSLog(@"copy修饰的对象地址----%p,指针地址------%p,对象值------%@",_nameCopy,&_nameCopy,_nameCopy);
    
    /*
     
     原对象地址----0xf93d639eff46c7d0,指针地址------0x7ffee6f1e9c8,对象值------Michael
     strong修饰的对象地址----0xf93d639eff46c7d0,指针地址------0x7fd037608350,对象值------Michael
     copy修饰的对象地址----0xf93d639eff46c7d0,指针地址------0x7fd037608358,对象值------Michael
     结论: 对NSString copy是深拷贝
     */
    
    //MutableString
    /*
    NSMutableString *name = [NSMutableString stringWithFormat:@"Michael"];
    self.nameStrong = name;
    self.nameCopy = name;
    [name appendString:@"-hhh"];
    NSLog(@"原对象地址----%p,指针地址------%p,对象值------%@",name,&name,name);
    NSLog(@"strong修饰的对象地址----%p,指针地址------%p,对象值------%@",_nameStrong,&_nameStrong,_nameStrong);
    NSLog(@"copy修饰的对象地址----%p,指针地址------%p,对象值------%@",_nameCopy,&_nameCopy,_nameCopy);
    */
    
    /*
     
     原对象地址----0x6000022baa00,指针地址------0x7ffee94619c8,对象值------Michael-hhh
     strong修饰的对象地址----0x6000022baa00,指针地址------0x7fe714f088e0,对象值------Michael-hhh
     copy修饰的对象地址----0xefe84d4b8a6f045f,指针地址------0x7fe714f088e8,对象值------Michael
     结论: 对NSMutableString copy是深拷贝
     */
    
    //NSArray
    
    NSArray *array = @[@"A",@"B",@"C"];
    self.arrayCopy = array;
    self.arrayStrong = array;       //浅拷贝
    self.arrayStrong = [array mutableCopy];  //深拷贝，并且对象成了可变对象
    [((NSMutableArray *)self.arrayStrong) addObject:@"D"];
    NSLog(@"原对象地址----%p,指针地址------%p,对象值------%@",array,&array,array);
    NSLog(@"strong修饰的对象地址----%p,指针地址------%p,对象值------%@",_arrayStrong,&_arrayStrong,_arrayStrong);
    NSLog(@"copy修饰的对象地址----%p,指针地址------%p,对象值------%@",_arrayCopy ,&_arrayCopy,_arrayCopy);
    
    /*

     原对象地址----0x6000031c5c20,指针地址------0x7ffeedaf39c0,对象值------(
     A,
     B,
     C
     )
     strong修饰的对象地址----0x6000031c5c20,指针地址------0x7f897940e670,对象值------(
     A,
     B,
     C
     )
     copy修饰的对象地址----0x6000031c5c20,指针地址------0x7f897940e678,对象值------(
     A,
     B,
     C
     )
     结论: 对NSArray copy是浅拷贝, MutableCopy是深拷贝，并且拷贝后对象变成了可变对象.
     */
    
    //NSMutableArray
    /*
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C"]];
    self.arrayCopy = array;
    self.arrayStrong = array;
    [array addObject:@"D"];
    NSLog(@"原对象地址----%p,指针地址------%p,对象值------%@",array,&array,array);
    NSLog(@"strong修饰的对象地址----%p,指针地址------%p,对象值------%@",_arrayStrong,&_arrayStrong,_arrayStrong);
    NSLog(@"copy修饰的对象地址----%p,指针地址------%p,对象值------%@",_arrayCopy ,&_arrayCopy,_arrayCopy);
    */
    
    /*
     
     原对象地址----0x600003158ed0,指针地址------0x7ffee88a19c0,对象值------(
     A,
     B,
     C,
     D
     )
     strong修饰的对象地址----0x600003158ed0,指针地址------0x7fc91de0a610,对象值------(
     A,
     B,
     C,
     D
     )
     copy修饰的对象地址----0x600003158f00,指针地址------0x7fc91de0a618,对象值------(
     A,
     B,
     C
     )
     结论: 对NSMutableArray copy是深拷贝
     */
}


@end
