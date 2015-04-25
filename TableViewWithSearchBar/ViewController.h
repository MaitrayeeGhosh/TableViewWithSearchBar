//
//  ViewController.h
//  TableViewWithSearchBar
//
//  Created by Maitrayee Ghosh on 23/04/15.
//  Copyright (c) 2015 Maitrayee Ghosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSArray *dataArray;
    NSArray *searchedDataArray;
}
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *mSearchBar;

@end

