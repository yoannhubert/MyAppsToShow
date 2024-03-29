//
//  RootViewController.m
//  TeamApp1
//
//  Created by Yoann Hubert on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

#import "DetailViewController.h"
#import "ModalViewController.h"
#import "ImagePickerController.h"



@interface RootViewController ()
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation RootViewController
		
@synthesize detailViewController;
@synthesize modalViewController;
@synthesize fetchedResultsController;
@synthesize managedObjectContext;


NSInteger editflag=2;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    NSError *error = nil;
    if (![[self fetchedResultsController] performFetch:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    self.title=@"Players";
}

		
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[fetchedResultsController sections] count];
}

		
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

		
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell.
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the managed object for the given index path
        NSManagedObjectContext *context = [fetchedResultsController managedObjectContext];
        [context deleteObject:[fetchedResultsController objectAtIndexPath:indexPath]];
        
        // Save the context.
        NSError *error = nil;
        if (![context save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }   
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Set the detail item in the detail view controller.
    NSManagedObject *selectedObject = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    detailViewController.detailItem = selectedObject;    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [detailViewController release];
    [modalViewController release];
    [fetchedResultsController release];
    [managedObjectContext release];
   
    
    [super dealloc];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *managedObject = [fetchedResultsController objectAtIndexPath:indexPath];
   // cell.textLabel.text = [[managedObject valueForKey:@"timeStamp"] description];
    cell.textLabel.text = [[managedObject valueForKey:@"firstName"] description];
   // cell.textLabel.a
}

 - (IBAction)insertNewObject:(id)sender
{
    //-------------------------------------------------------------
    // Launching of the modal view for the new Player to register **
    //-------------------------------------------------------------
   
    
    // On a forum somebody used this to prevent the accelerometer to start before loading the modal View
    // [self performSelector:@selector(modalViewController) withObject:self afterDelay:1.5]; ( not usefull in here)
    //------------------------------------------------------------------------------------------------------------
    
    self.modalViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    self.modalViewController.modalPresentationStyle = UIModalPresentationFormSheet;
    //[modalViewController shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortrait];
    [self presentModalViewController:modalViewController animated:YES];
    
    //------------------------------------------------------------- **
    //------------------------------------------------------------- **
    
    
}
- (IBAction)saveProfile:(id)sender{
    

    NSIndexPath *currentSelection = [self.tableView indexPathForSelectedRow];
    if (currentSelection != nil) {
        [self.tableView deselectRowAtIndexPath:currentSelection animated:NO];
    }    
    
    // Create a new instance of the entity managed by the fetched results controller.
    NSManagedObjectContext *context = [fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [[fetchedResultsController fetchRequest] entity];
   
   if (editflag==2){
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];  
    
    // If appropriate, configure the new managed object.    //[newManagedObject setValue:@"Ana" forKey:@"timeStamp"];
   
    [newManagedObject setValue:self.modalViewController.nameplayer.text forKey:@"firstName"];
    [newManagedObject setValue:self.modalViewController.levelplayer.text forKey:@"level"];
    [newManagedObject setValue:self.modalViewController.goalplayer.text forKey:@"goal"];
    [newManagedObject setValue:self.modalViewController.timesaweekplayer.text forKey:@"timesaweek"];
    [newManagedObject setValue:self.modalViewController.postcodeplayer.text forKey:@"postcode"];
       [newManagedObject setValue:self.modalViewController.objofmonth.text forKey:@"objofmonth"];
    
    // Temporaly we fix ourself the image 
    UIImage *img= [UIImage imageNamed:@"HPIM0707.JPG"];
    [self.modalViewController.photoView setImage:img];
    //----------------     
    // For the photo 
       NSData* coreDataImage = [NSData dataWithData:UIImagePNGRepresentation(self.modalViewController.photoView.image)];
   // NSData * imageData = UIImagePNGRepresentation(self.modalViewController.photoView.image);  
       [newManagedObject setValue:coreDataImage forKey:@"photo"];
       
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    NSIndexPath *insertionPath = [fetchedResultsController indexPathForObject:newManagedObject];
    [self.tableView selectRowAtIndexPath:insertionPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    detailViewController.detailItem = newManagedObject;
   }
    else
    {
        [detailViewController.detailItem  setValue:self.modalViewController.nameplayer.text forKey:@"firstName"];
        [detailViewController.detailItem  setValue:self.modalViewController.levelplayer.text forKey:@"level"];
        [detailViewController.detailItem  setValue:self.modalViewController.goalplayer.text forKey:@"goal"];
        [detailViewController.detailItem  setValue:self.modalViewController.timesaweekplayer.text forKey:@"timesaweek"];
        [detailViewController.detailItem  setValue:self.modalViewController.postcodeplayer.text forKey:@"postcode"];
         [detailViewController.detailItem  setValue:self.modalViewController.objofmonth.text forKey:@"objofmonth"];
      
        // Temporaly we fix ourself the image 
        UIImage *img= [UIImage imageNamed:@"HPIM0707.JPG"];
        [self.modalViewController.photoView setImage:img];
        //---------------- 
        
        
        // For the photo 
        NSData* coreDataImage = [NSData dataWithData:UIImagePNGRepresentation(self.modalViewController.photoView.image)];
        // NSData * imageData = UIImagePNGRepresentation(self.modalViewController.photoView.image);  
        [detailViewController.detailItem setValue:coreDataImage forKey:@"photo"];
        // Save the context.
        NSError *error = nil;
        if (![context save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
        NSIndexPath *insertionPath = [fetchedResultsController indexPathForObject:detailViewController.detailItem];
        [self.tableView selectRowAtIndexPath:insertionPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        detailViewController.detailItem = detailViewController.detailItem;
        [self.detailViewController configureView];

    }
   
     // Erase TextField for the Next new Player
    //-----------------------------------------
    self.modalViewController.nameplayer.text=@""; 
    self.modalViewController.levelplayer.text=@"";
    self.modalViewController.goalplayer.text=@"";
    self.modalViewController.timesaweekplayer.text=@"";
    self.modalViewController.postcodeplayer.text=@"";
    self.modalViewController.objofmonth.text=@"";
    
    UIImage *nullImage = nil;
    [self.modalViewController.photoView setImage:nullImage];
    self.modalViewController.photoView.hidden=YES;
    
    editflag=2;
    
    // Dismiss the modal View
    //-----------------------
   [self dismissModalViewControllerAnimated:YES];
   
     

}

-(IBAction)editProfile:(id)sender{
    
    // Launch again the Modal View
     //self.modalViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [super self];
     self.modalViewController.cadrelabel.backgroundColor = [UIColor blackColor];
    [self.modalViewController.cadrelabel.backgroundColor set];
    [self.modalViewController.cadrelabel.backgroundColor set];    
    self.modalViewController.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentModalViewController:self.modalViewController animated:YES];
   self.modalViewController.deleteplayer.hidden= NO;
   
    // Display recorded Value
    self.modalViewController.nameplayer.text=[[self.detailViewController.detailItem valueForKey:@"firstName"] description]; 
    self.modalViewController.levelplayer.text=[[self.detailViewController.detailItem valueForKey:@"level"] description]; ;
    self.modalViewController.goalplayer.text=[[self.detailViewController.detailItem valueForKey:@"goal"] description]; 
    self.modalViewController.timesaweekplayer.text=[[self.detailViewController.detailItem valueForKey:@"timesaweek"] description] ;
    self.modalViewController.postcodeplayer.text=[[self.detailViewController.detailItem valueForKey:@"postcode"] description] ;
     self.modalViewController.objofmonth.text=[[self.detailViewController.detailItem valueForKey:@"objofmonth"] description] ;
    
    self.modalViewController.photoView.hidden=NO;
    
    UIImage *imgj2= [UIImage imageWithData:[self.detailViewController.detailItem valueForKey:@"photo"]];
    [self.modalViewController.photoView setImage:imgj2]; 
    
    editflag =0;   
}

-(IBAction)deletePlayer:(id)sender{
    
    [self.detailViewController.detailItem prepareForDeletion];
    NSManagedObjectContext *context = [fetchedResultsController managedObjectContext];    
    [context deleteObject:self.detailViewController.detailItem];
    if( [self.detailViewController.detailItem isDeleted]==YES){
    
    // Save the context
    //-----------------    
        NSError *error = nil;
        if (![context save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    
    // Dismiss the modal View
    //-----------------------
    [self dismissModalViewControllerAnimated:YES];
    NSManagedObject *selectedObject = [[self fetchedResultsController] objectAtIndexPath:0];
    self.detailViewController.detailItem = selectedObject; 
    self.detailViewController.detailGoalLabel.hidden=YES;
    self.detailViewController.detailNameLabel.hidden=YES;
    self.detailViewController.detailTimesLabel.hidden=YES;
    self.detailViewController.detailDescriptionLabel.hidden=YES;
    self.detailViewController.map.hidden=YES;    
    self.detailViewController.address.hidden=YES; 
    self.detailViewController.objofmonth.hidden=YES;
    self.detailViewController.map.hidden=YES;
    self.detailViewController.rightWrong.hidden=YES;
    self.detailViewController.eval.hidden=YES;        
    self.detailViewController.detaildeletedLabel.hidden=NO;
        
    
        
        
        
        // Erase TextField for the Next new Player
        //-----------------------------------------
        self.modalViewController.nameplayer.text=@""; 
        self.modalViewController.levelplayer.text=@"";
        self.modalViewController.goalplayer.text=@"";
        self.modalViewController.timesaweekplayer.text=@"";
        self.modalViewController.postcodeplayer.text=@"";
         self.modalViewController.objofmonth.text=@"";
        UIImage *nullImage = nil;
        [self.modalViewController.photoView setImage:nullImage];
        self.modalViewController.deleteplayer.hidden=YES;
        
        [super self];
        self.modalViewController.cadrelabel.backgroundColor=[UIColor blueColor];
        
    }
}
      #pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (fetchedResultsController != nil) {
        return fetchedResultsController;
    }
    
    /*
     Set up the fetched results controller.
    */
    // Create the fetch request for the entity.
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
   // NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:managedObjectContext];
     NSEntityDescription *entity = [NSEntityDescription entityForName:@"Player" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
 //  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:@"Root"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
    [aFetchedResultsController release];
    [fetchRequest release];
    [sortDescriptor release];
    [sortDescriptors release];
    
    return fetchedResultsController;
}    

#pragma mark - Fetched results controller delegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

/*
// Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed. 
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}
 */

@end
