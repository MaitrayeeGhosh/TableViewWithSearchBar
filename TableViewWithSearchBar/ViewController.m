//
//  ViewController.m
//  TableViewWithSearchBar
//
//  Created by Maitrayee Ghosh on 23/04/15.
//  Copyright (c) 2015 Maitrayee Ghosh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dataArray=[[NSMutableArray alloc]initWithObjects:
               @"Wake up at 6 am",
               @"Work out for 30 min",
               @"Eat healthy breakfast",
               @"dress up for office",
               @"Login to your system",
               @"Check email",
               @"Start working on project",
               @"Take a tea break",
               @"Have lunch with friends",
               @"Submit work to manager",
               @"Leave office for the day",
               nil];
    
    searchedDataArray=dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [searchedDataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"cellId";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==Nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text=[searchedDataArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Search Functionality

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.mSearchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self.mSearchBar setShowsCancelButton:NO animated:YES];
    searchBar.text=@"";
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length>0) {
        searchText = [searchText stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"its pincode");
        NSPredicate *predicate =
        [NSPredicate predicateWithFormat: @"SELF CONTAINS[cd] %@", searchText];
        searchedDataArray= [dataArray filteredArrayUsingPredicate:predicate];
        [_mTableView reloadData];
    }
    else
    {
        searchedDataArray=dataArray;
        [_mTableView reloadData];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.mSearchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.mSearchBar resignFirstResponder];
    searchedDataArray=dataArray;
    [self.mTableView reloadData];
}

@end
