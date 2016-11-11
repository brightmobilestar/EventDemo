//
//  EventDetailViewController.m
//  DatingApp
//
//  Created by Steven Jimy   on 11/11/16.
//  Copyright © 2016 Steven Jimy . All rights reserved.
//

#import "EventDetailViewController.h"
#import "EventSlideTableViewCell.h"
#import "EventInforTableViewCell.h"
#import "EventGuestTableViewCell.h"
#import "GuestFactory.h"

typedef enum : NSUInteger {
    kEventDetailSlideCellIndex = 0,
    kEventDetailInforCellIndex,
    kEventDetailGuestCellIndex,
    kEventDetailNumberOfRow,
} EventDetailCellIndex;

@interface EventDetailViewController ()
<UITableViewDelegate, UITableViewDataSource, GuestFactoryDelegate>
{
    __weak IBOutlet UITableView *eventDetailTableView;
    __weak IBOutlet UIButton *joinButton;
    __weak IBOutlet UIButton *maybeButton;
    __weak IBOutlet UIButton *cancelButton;
    NSMutableArray *cellArray;
    __weak IBOutlet UIActivityIndicatorView *indicatorView;
    NSMutableArray *guestArray;
}
@end

@implementation EventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [indicatorView startAnimating];
    [self initCells];
    [self getData];
}

#pragma mark - Get Data
- (void)getData{
    GuestFactory *guestFactory = [[GuestFactory alloc] init];
    [guestFactory getGuestOfEvent:self.eventModel withDelegation:self];
}

#pragma mark - GuestFactoryDelegate
- (void)getGuestOfEventWithSuccessHandler:(NSArray *)results{
    guestArray = [[NSMutableArray alloc] initWithArray:results];
    dispatch_async(dispatch_get_main_queue(), ^{
        [eventDetailTableView reloadData];
        [indicatorView stopAnimating];
    });
}

- (void)getGuestOfEventWithFailureHandler:(NSError *)error{
    guestArray = [NSMutableArray new];
    dispatch_async(dispatch_get_main_queue(), ^{
        [eventDetailTableView reloadData];
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
    return kEventDetailNumberOfRow;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case kEventDetailSlideCellIndex:
            return 150;
            break;
        case kEventDetailInforCellIndex:
            return 150;
            break;
        case kEventDetailGuestCellIndex:
            return 90;
            break;
        default:
            break;
    }
    return 0;
}

- (void)initCells{
    cellArray = [NSMutableArray new];
    static NSString *cellSlideIdentifier = @"eventCellSlideIdentifier";
    static NSString *cellInforIdentifier = @"eventCellInforIdentifier";
    static NSString *cellGuestIdentifier = @"eventCellGuestIdentifier";
    for (NSInteger i = 0; i < kEventDetailNumberOfRow; i++) {
        switch (i) {
            case kEventDetailSlideCellIndex:{
                EventSlideTableViewCell *cell = (EventSlideTableViewCell *)[eventDetailTableView dequeueReusableCellWithIdentifier:cellSlideIdentifier];
                if (cell == nil){
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"EventSlideTableViewCell" owner:self options:nil];
                    cell = [nib objectAtIndex:0];
                }
                [cellArray addObject:cell];
            }
                break;
            case kEventDetailInforCellIndex:{
                EventInforTableViewCell *cell = (EventInforTableViewCell *)[eventDetailTableView dequeueReusableCellWithIdentifier:cellInforIdentifier];
                if (cell == nil){
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"EventInforTableViewCell" owner:self options:nil];
                    cell = [nib objectAtIndex:0];
                }
                [cellArray addObject:cell];
            }
                break;
            case kEventDetailGuestCellIndex:{
                EventGuestTableViewCell *cell = (EventGuestTableViewCell *)[eventDetailTableView dequeueReusableCellWithIdentifier:cellGuestIdentifier];
                if (cell == nil){
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"EventGuestTableViewCell" owner:self options:nil];
                    cell = [nib objectAtIndex:0];
                }
                [cellArray addObject:cell];
            }
                break;
            default:
                break;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EventSlideTableViewCell *cell = [cellArray objectAtIndex:indexPath.row];
    switch (indexPath.row) {
        case kEventDetailSlideCellIndex:{
            EventSlideTableViewCell *cell = [cellArray objectAtIndex:kEventDetailSlideCellIndex];
            return cell;
        }
            break;
        case kEventDetailInforCellIndex:{
            EventInforTableViewCell *cell = [cellArray objectAtIndex:kEventDetailInforCellIndex];
            return cell;
        }
            break;
        case kEventDetailGuestCellIndex:{
            EventGuestTableViewCell *cell = [cellArray objectAtIndex:kEventDetailGuestCellIndex];
            [cell reloadWithGuestArray:guestArray];
            return cell;
        }
            break;
        default:
            break;
    }
    return cell;
}

#pragma mark - Actions
- (IBAction)touchJoinButton:(id)sender {
}

- (IBAction)touchMaybeButton:(id)sender {
}

- (IBAction)touchCancelButton:(id)sender {
}

- (IBAction)touchBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
