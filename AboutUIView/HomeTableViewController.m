//
//  HomeTableViewController.m
//  AboutUIView
//
//  Created by mac on 16/12/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeTableViewController.h"
#import "DrawRectMethodViewController.h"
#import "ResizableImageViewController.h"
#import "BoundsFrameCenterViewController.h"
#import "AutoLayout_VFLViewController.h"
#import "ProgrammaticallyCreatingConstraints.h"
static NSString *const cellID = @"HomeTableViewControllerid";

@interface HomeTableViewController ()
@property (nonatomic, strong) NSArray *cellTitleArr;
@property (nonatomic, strong) NSArray *viewControllers;
@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
//     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}




#pragma mark - Table view data source




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.cellTitleArr.count;
}


#pragma mark - Table view delegate
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
     
//     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
     
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
     if (!cell) {
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
     }
     
     cell.textLabel.text = self.cellTitleArr[indexPath.row];
     return cell;
 }


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    ProgrammaticallyCreatingConstraints *vcd = [[ProgrammaticallyCreatingConstraints alloc] initWithNibName:@"ProgrammaticallyCreatingConstraints" bundle:nil];
//    ProgrammaticallyCreatingConstraints *vcd = [ProgrammaticallyCreatingConstraints new];
//    [self.navigationController pushViewController:vcd animated:YES];
//    return;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *vc  = [[NSClassFromString(self.viewControllers[indexPath.row]) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark - getter setter methods

- (NSArray *)cellTitleArr{
    return @[@"drawRect",
             @"ResizableImageViewController(拉升图片)",
             @"Bounds Frame Center ",
             @"Auto Layout LFL",
             @"Auto Layout",
             @"坐标转换",
             @"手写约束"];
}

- (NSArray *)viewControllers{
    return @[@"DrawRectMethodViewController",
             @"ResizableImageViewController",
             @"BoundsFrameCenterViewController",
             @"AutoLayout_VFLViewController",
             @"AutoLayoutViewController",
             @"ConvertingCoordinatesViewController",
             @"ProgrammaticallyCreatingConstraints"];
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
