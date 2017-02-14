//
//  TableViewController.m
//  FontBrowser
//
//  Created by qf on 15/4/17.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "TableViewController.h"
@interface TableViewController ()

@property (nonatomic,strong) NSArray *font;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	_font = [UIFont familyNames];
	UIBarButtonItem *rigthItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveImage)];
	self.navigationItem.rightBarButtonItem = rigthItem;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_font count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fontCell"];
//    
//	if (!cell){
	UITableViewCell *cell;
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"fontCell"];
		cell.textLabel.text = [NSString stringWithFormat:@"%li: 1234abcd一二三四 ", (long)indexPath.row];
	cell.detailTextLabel.text =   _font[indexPath.row];
		cell.textLabel.font = [UIFont fontWithName:_font[indexPath.row] size:20.0f];
		
//	}
	
    return cell;
}

- (UIImage *)getTableViewImage{
	UIImage* viewImage = nil;
	UITableView *scrollView = self.tableView;
	UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, scrollView.opaque, 0.0);
	{
		CGPoint savedContentOffset = scrollView.contentOffset;
		CGRect savedFrame = scrollView.frame;
		
		scrollView.contentOffset = CGPointZero;
		scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
		
		[scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
		viewImage = UIGraphicsGetImageFromCurrentImageContext();
		
		scrollView.contentOffset = savedContentOffset;
		scrollView.frame = savedFrame;
	}
	UIGraphicsEndImageContext();
	return viewImage;
}

- (void)saveImage{
	UIImageWriteToSavedPhotosAlbum([self getTableViewImage], self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	

}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)context{
	
}

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
