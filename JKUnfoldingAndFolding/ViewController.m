//
//  ViewController.m
//  JKUnfoldingAndFolding
//
//  Created by 王冲 on 2017/10/10.
//  Copyright © 2017年 希爱欧科技有限公司. All rights reserved.
//  欢迎加入iOS开发交流群 584599353

#import "ViewController.h"

#import "PeopleCell.h"

#import "PeopleHeaderFooterView.h"

#import "JKPeopleModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *sectionArray;
    
    NSString *comeYes;
}

@property(nonatomic,strong) NSString *selectIndex;

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *dataArray;

@property(nonatomic,strong) NSMutableArray *dataArray3;


/*
 *  段头
 */
@property(nonatomic,strong) NSMutableArray *indexArray;
/*
 *  段尾
 */
@property(nonatomic,strong) NSMutableDictionary *diction;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self daohang];
    
    // 0 代表没有点击过cell
    
    // 1 代表点击过cell
    comeYes = @"0";
    

    NSMutableArray *array11 = [[NSMutableArray alloc]init];
    
    [array11 addObjectsFromArray:@[@"12级",@"13级",@"14级"]];

    NSMutableArray *array22 = [[NSMutableArray alloc]init];
    
    [array22 addObject:@[@"1",@"2",@"3"]];
    [array22 addObject:@[@"4",@"5",@"6"]];
    [array22 addObject:@[@"7",@"8",@"9"]];
    
    [self.selectdataArray2 addObjectsFromArray:@[]];
    [self.selectdataArray2 addObjectsFromArray:@[]];
    [self.selectdataArray2 addObjectsFromArray:@[]];
    
    [self setUIArray1:array11 withArray2:array22];
    
    
    
}

-(void)setUIArray1:(NSArray *)array1 withArray2:(NSArray *)array2{
    
    [self.dataArray addObjectsFromArray:array1];
    
    [self.dataArray3 addObjectsFromArray:array2];
    
    sectionArray = [[NSMutableArray alloc]init];
    
    NSMutableArray *arrayPanduan = [[NSMutableArray alloc]init];
    
    if (self.selectdataArray2.count == 0) {
        
        [arrayPanduan addObjectsFromArray:@[]];
        
    }else{
        
        [arrayPanduan addObjectsFromArray:self.selectdataArray2];
    }
    
    for (int i = 0; i<self.dataArray.count; i++) {
        
        NSArray *array = array2[i];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        dict[@"isExpanded"] = 0;
        dict[@"sectionTitle"] = self.dataArray[i];
        dict[@"sectionNumber"] = [NSString stringWithFormat:@"/%lu)",(unsigned long)array.count];
        
        if (arrayPanduan.count == 0) {
            
            dict[@"sectionNumber2"] = @"0";
            dict[@"sectionNumberArray"] = @[];
            
        }else{
            
            NSArray *arrayy = arrayPanduan[i];
            dict[@"sectionNumber2"] = [NSString stringWithFormat:@"%ld",arrayy.count];
            dict[@"sectionNumberArray"] = arrayPanduan[i];
        }
        
        JKPeopleModel *model = [[JKPeopleModel alloc]initWithDictionary:dict error:nil];
        
        [sectionArray addObject:model];
        
    }
    
    for (JKPeopleModel *model  in sectionArray) {
        
        DDLogDebug(@"段头名字=%@",model.sectionTitle);
        DDLogDebug(@"判断=%d",model.isExpanded);
    }
    
    
    [self.view addSubview:self.tableView];
    
    /*
     * 头
     */
    UIView *headLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, JKWIDTH, 16)];
    headLineView.backgroundColor = backgrCOlor;
    self.tableView.tableHeaderView = headLineView;
    /*
     * 尾巴
     */
    UIView *footLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, JKWIDTH, 16)];
    footLineView.backgroundColor = backgrCOlor;
    self.tableView.tableFooterView = footLineView;
}

#pragma mark 导航栏的操作
-(void)daohang {
    
    self.title = @"邀请成员";
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.rightBarButtonItem.tintColor = zhuBlueCOLOR;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    JKPeopleModel *model =sectionArray[section];
    NSArray *array1 = self.dataArray3[section];
    
    DDLogDebug(@"第%ld行==%lu",(long)section,(unsigned long)array1.count);
    
    return model.isExpanded ? (array1.count) : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PeopleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    
    if (!cell) {
        
        cell = [[PeopleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSArray *array = self.dataArray3[indexPath.section];
    cell.gZbiaoTi.text = array[indexPath.row];
    
    [cell.peopleImageView sd_setImageWithURL:[NSURL URLWithString:@"http://g.hiphotos.baidu.com/image/pic/item/96dda144ad3459828435fe2606f431adcaef84c2.jpg"] placeholderImage:[UIImage imageNamed:@"default_avatar"]];
    
    BOOL isContain = [self.selectdataArray1 containsObject:array[indexPath.row]];
    
    if (isContain) {
        
        DDLogDebug(@"\n\n包含这个元素");
        cell.smallImageView.image = [UIImage imageNamed:@"choose1"];
        
    }else{
        
        DDLogDebug(@"\n\n不包含这个元素");
        cell.smallImageView.image = [UIImage imageNamed:@"choose_off"];
    }
    
    if (array.count == indexPath.row+1) {
        
        cell.lineView.alpha = 1;
        
    }else{
        
        cell.lineView.alpha = 0;
        
    }
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    PeopleHeaderFooterView *headerView11 = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    
    if (!headerView11) {
        headerView11 = [[PeopleHeaderFooterView alloc] initWithReuseIdentifier:@"header"];
    }
    
    headerView11.sectionModel = sectionArray[section];
    
    __weak typeof(self) weakSelf = self;
    headerView11.schoolhead = ^(BOOL isExpand){
        
        [weakSelf.tableView reloadSections:[[NSIndexSet alloc] initWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    
    return  headerView11;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 45;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, JKWIDTH, 0.01)];
    footView.backgroundColor = [UIColor whiteColor];
    return footView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}

-(UITableView* )tableView{
    
    if (!_tableView) {
        
        // UITableViewStyleGrouped
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, JKWIDTH, JKHEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor  = backgrCOlor;
    }
    
    return _tableView;
}

#pragma mark 懒加载
-(NSMutableArray *)dataArray{
    
    if (_dataArray == nil) {
        
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark 懒加载
-(NSMutableArray *)dataArray3{
    
    if (_dataArray3 == nil) {
        
        _dataArray3 = [NSMutableArray array];
    }
    return _dataArray3;
}

#pragma mark 懒加载
-(NSMutableArray *)selectdataArray1{
    
    if (_selectdataArray1 == nil) {
        
        _selectdataArray1 = [NSMutableArray array];
    }
    return _selectdataArray1;
}

#pragma mark 懒加载
-(NSMutableArray *)selectdataArray2{
    
    if (_selectdataArray2 == nil) {
        
        _selectdataArray2 = [NSMutableArray array];
    }
    return _selectdataArray2;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSArray *arrayy = self.dataArray3[indexPath.section];
    
    BOOL isContain = [self.selectdataArray1 containsObject:arrayy[indexPath.row]];
    
    if (isContain) {
        
        DDLogDebug(@"\n\n包含这个元素");
        [self.selectdataArray1 removeObject:arrayy[indexPath.row]];
        
    }else{
        
        DDLogDebug(@"\n\n不包含这个元素");
        
        if (self.selectdataArray1.count==50) {
            
            [CIOTip tishi2:self withString:@"小组成员上限200人一次最多邀请50人" withtype:@"0"];
            return;
            
        }else{
            
            [self.selectdataArray1 addObject:arrayy[indexPath.row]];
        }
        
    }
    
    comeYes = @"1";
    
    JKPeopleModel *schoolServiceCreatSmallDiscussYaoQingPeopleModel = sectionArray[indexPath.section];
    
    BOOL isContain1 = [schoolServiceCreatSmallDiscussYaoQingPeopleModel.sectionNumberArray containsObject:arrayy[indexPath.row]];
    
    if (isContain1) {
        
        DDLogDebug(@"\n\n包含这个元素");
        [schoolServiceCreatSmallDiscussYaoQingPeopleModel.sectionNumberArray removeObject:arrayy[indexPath.row]];
        
    }else{
        
        DDLogDebug(@"\n\n不包含这个元素");
        [schoolServiceCreatSmallDiscussYaoQingPeopleModel.sectionNumberArray addObject:arrayy[indexPath.row]];
    }
    
    schoolServiceCreatSmallDiscussYaoQingPeopleModel.sectionNumber2 = [NSString stringWithFormat:@"%ld",schoolServiceCreatSmallDiscussYaoQingPeopleModel.sectionNumberArray.count];
    
    DDLogDebug(@"选择的数组内容==%lu",schoolServiceCreatSmallDiscussYaoQingPeopleModel.sectionNumberArray.count);
    
    //刷新当前行
    //    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    [self.tableView reloadData];
    
}




@end
