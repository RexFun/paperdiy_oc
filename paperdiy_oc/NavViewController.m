//
//  NavViewController.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/15.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController ()

@end

@implementation NavViewController
NSArray *datas;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    datas = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e", nil];
    //初始化数据
    [self getData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [datas count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"DataCell";
    NavViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[NavViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell setWithId:[NSString stringWithFormat:@"%@",[[datas objectAtIndex:indexPath.row] objectForKey:@"ID"]]
            andName:[[datas objectAtIndex:indexPath.row] objectForKey:@"NAME"]
             andQty:[NSString stringWithFormat:@"%@",[[datas objectAtIndex:indexPath.row] objectForKey:@"QTY"]]
     ];
    return cell;
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

- (void) getData {
    NSString *sUrl = @"http://192.168.19.123:8181/paper/client/nav/getNavDataJson.action";
    sUrl=[sUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url=[NSURL URLWithString:sUrl];
    
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url cachePolicy:0 timeoutInterval:15.0f];
    
    //发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"%@",connectionError.localizedDescription);
        } else {
            NSArray *aJson = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: nil];
            datas = aJson;
            //            for(NSDictionary *item in aJson) {
            //                NSLog(@"Id: %@", [item objectForKey:@"ID"]);
            //                NSLog(@"Name: %@", [item objectForKey:@"NAME"]);
            //                NSLog(@"Qty: %@", [item objectForKey:@"QTY"]);
            //            }
            [self.tableView reloadData];
        }
        //[self.refreshControl endRefreshing];
    }];
}
@end
