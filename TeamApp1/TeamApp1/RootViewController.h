//
//  RootViewController.h
//  TeamApp1
//
//  Created by Yoann Hubert on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DetailViewController;

@class ModalViewController;

#import <CoreData/CoreData.h>


@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate>{
   // IBOutlet UIView * newplayer;
    
    
    IBOutlet ModalViewController *modalViewController;
   
   

}

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@property (nonatomic, retain) IBOutlet ModalViewController *modalViewController;

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
//@property (nonatomic, retain) UIImagePickerController *imagePicker;


//@property (nonatomic, retain) UIView *newplayer;


- (IBAction)insertNewObject:(id)sender;
- (IBAction)saveProfile:(id)sender;
- (IBAction)editProfile:(id)sender;
- (IBAction)deletePlayer:(id)sender;

@end
