//
//  ViewController.m
//  TableViewCellWithXib
//
//  Created by 张健 on 16/3/25.
//  Copyright (c) 2015年 张健. All rights reserved.
//

#import "ViewController.h"

#import "InfoTableViewCell.h"

static NSString *cellID = @"InfoTableViewCell";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong ) NSMutableArray            *dataArray;

@property (nonatomic,strong ) NSMutableArray            *modelArray;

@property (nonatomic,strong ) InfoTableViewCell         *infoCell;

@property (nonatomic,strong ) InfoCellModel             *infoModel;

@property (nonatomic,strong ) NSMutableAttributedString * muString;

@property (strong, nonatomic) NSMutableDictionary       *offscreenCells;//cell字典

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initDataSource];

    [self.tableView registerNib:[UINib nibWithNibName:@"InfoTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
}

-(void)initDataSource {
    
    _modelArray = [NSMutableArray array];
    
    for (int i = 0 ; i < self.dataArray.count; i ++) {
        
        InfoCellModel *infoModel = [[InfoCellModel alloc]init];
        infoModel.titleString = i % 2 == 0 ? @"" : @"感谢您的支持!";
        infoModel.infoString = self.dataArray[i];
        infoModel.imageString = i % 2 == 0 ? @"123" : @"";
        infoModel.priceString = [NSString stringWithFormat:@"￥%d.00 或更多",(arc4random() % 100) + 1];
        [_modelArray addObject:infoModel];
    }
    
    _muString = [[NSMutableAttributedString alloc]init];

}

-(NSMutableDictionary *)offscreenCells {
    
    if (_offscreenCells == nil) {
        
        _offscreenCells = [NSMutableDictionary dictionary];
    }
    
    return _offscreenCells;

}
-(NSArray *)dataArray {
    
    if (_dataArray == nil) {
        
        _dataArray = (NSMutableArray*)@[@"1.HTTP属于老话题了，在项目中我们经常需要往服务端发POST或者GET请求，但是对于HTTP的了解不应只局限于此。\n2.千里之行，始于足下。",@"1.HTTP属于老话题了，在项目中我们经常需要往服务端发POST或者GET请求，但是对于HTTP的了解不应只局限于此。\n2.千里之行，始于足下。\n3.越想走的远，基本原理就应该了解的透彻全面一些，仅仅停留在使用ASIHttpRequest或者AFNetWorking传个参数发个请求的程度上是不够的。",@"1.HTTP属于老话题了，在项目中我们经常需要往服务端发POST或者GET请求，但是对于HTTP的了解不应只局限于此。\n2.千里之行，始于足下。\n3.越想走的远，基本原理就应该了解的透彻全面一些，仅仅停留在使用ASIHttpRequest或者AFNetWorking传个参数发个请求的程度上是不够的。\n4.HTTP本质上是一种协议，全称是Hypertext Transfer Protocol，即超文本传输协议。\n5.从名字上可以看出该协议用于规定客户端与服务端之间的传输规则，所传输的内容不局限于文本(其实可以传输任意类型的数据)。",@"1.HTTP属于老话题了，在项目中我们经常需要往服务端发POST或者GET请求，但是对于HTTP的了解不应只局限于此。\n2.千里之行，始于足下。\n3.越想走的远，基本原理就应该了解的透彻全面一些，仅仅停留在使用ASIHttpRequest或者AFNetWorking传个参数发个请求的程度上是不够的。\n4.HTTP本质上是一种协议，全称是Hypertext Transfer Protocol，即超文本传输协议。\n5.从名字上可以看出该协议用于规定客户端与服务端之间的传输规则，所传输的内容不局限于文本(其实可以传输任意类型的数据)。\n6.以上示例图中其实已经包含了一个HTTP请求所必备的几大要素。\n7.请求行、请求头(headerField)、请求体(body)；同理，响应也有状态行、响应头、实体内容。接下来我们逐个展开。\n8.请求行包含请求方法(Method)、请求统一资源标识符(URI)",@"HTTP版本号，如图2.1第一行所示",@"Host: 目标服务器的网络地址",@"Accept: 让服务端知道客户端所能接收的数据类型，如text/html */*",@"Content-Type: body中的数据类型，如application/json; charset=UTF-8",@"1.Accept-Language: 客户端的语言环境，如zh-cn。\n2.Accept-Encoding: 客户端支持的数据压缩格式，如gzip。\n3.User-Agent: 客户端的软件环境，我们可以更改该字段为自己客户端的名字，比如QQ music v1.11，比如浏览器Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/600.8.9 (KHTML, like Gecko) Maxthon/4.5.2",@"Connection: keep-alive，该字段是从HTTP 1.1才开始有的，用来告诉服务端这是一个持久连接，“请服务端不要在发出响应后立即断开TCP连接”。关于该字段的更多解释将在后面的HTTP版本简介中展开。",@"Content-Length: body的长度，如果body为空则该字段值为0。该字段一般在POST请求中才会有。",@"1.POST请求的body请求体也有可能是空的，因此POST中Content-Length也有可能为0。\n2.Cookie: 记录者用户信息的保存在本地的用户数据，如果有会被自动附上。\n3.值得一提的是，在iOS中当你发送一个任意请求时，不管你愿不愿意，NSURLRequest都会自动帮你记录你所访问的URL上设置的cookie。在iOS中用NSHTTPCookieStorage表示，是一个单例。",@"以上就是关于HTTP相关概念的回顾，适合菜鸟也适合有经验同学一起回顾。"];
    }
    
    return _dataArray;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _infoCell  = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    _infoCell.muString = _muString;
    
    _infoModel = [_modelArray objectAtIndex:indexPath.row];

    _infoCell.model = _infoModel;
    
    return _infoCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    InfoTableViewCell *cell = [self.offscreenCells objectForKey:cellID];
    
    _infoModel = [_modelArray objectAtIndex:indexPath.row];
    
    if (!cell) {
        
        cell = [InfoTableViewCell InfoCell];
        
        [self.offscreenCells setObject:cell forKey:cellID];
    }

    cell.titleStr = _infoModel.titleString;
    cell.infoStr  = _infoModel.infoString;
    cell.iconStr = _infoModel.imageString;

    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
   
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));

    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;

    return height + 1.0f;
}



@end
