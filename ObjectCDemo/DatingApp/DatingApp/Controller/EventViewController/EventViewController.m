//
//  EventViewController.m
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import "EventViewController.h"
#import "EventTableViewCell.h"
#import "EventFactory.h"
#import "EventDetailViewController.h"

@interface EventViewController ()
<UITableViewDataSource, UITableViewDelegate, EventFactoryDelegate>
{
    __weak IBOutlet UITableView *eventTableView;
    NSMutableArray *events;
    __weak IBOutlet UIActivityIndicatorView *indicatorView;
}
@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [indicatorView startAnimating];
    [self getEvents];
}

#pragma mark - Get Events
- (void)getEvents{
    EventFactory *eventFactory = [[EventFactory alloc]init];
    [eventFactory getEventWithDelegation:self];
}

#pragma mark - EventFactoryDelegate
- (void)getEventWithSuccessHandler:(NSArray *)results{
    events = [[NSMutableArray alloc] initWithArray:results];
    dispatch_async(dispatch_get_main_queue(), ^{
        [eventTableView reloadData];
        [indicatorView stopAnimating];
    });
}

- (void)getEventWithFailureHandler:(NSError *)error{
    events = [NSMutableArray new];
    dispatch_async(dispatch_get_main_queue(), ^{
        [eventTableView reloadData];
        [indicatorView stopAnimating];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return events.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"eventCellIdentifier";
    EventTableViewCell *cell = (EventTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"EventTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    NSLog(@"%@", [events objectAtIndex:indexPath.row]);
    cell.eventModel = [events objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EventDetailViewController *eventDetailVC = [[EventDetailViewController alloc]initWithNibName:@"EventDetailViewController" bundle:nil];
    eventDetailVC.eventModel = [events objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:eventDetailVC animated:YES];
}

@end
