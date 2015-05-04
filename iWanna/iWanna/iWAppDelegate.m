//
//  iWAppDelegate.m
//  iWanna
//
//  Created by Gavin Quilty on 04/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import "iWAppDelegate.h"
#import "iWMusic.h"
#import "iWBook.h"
#import "iWFilm.h"
#import "iWMusicsViewController.h"
#import "iWBooksViewController.h"
#import "iWFilmViewController.h"


@implementation iWAppDelegate {
    
	NSMutableArray *musicArray;
    NSMutableArray *booksArray;
    NSMutableArray *filmArray;
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	musicArray = [NSMutableArray arrayWithCapacity:20];
    
	iWMusic *music = [[iWMusic alloc] init];
	music.name = @"Eminem";
	music.genre = @"Hip-Hop";
	[musicArray addObject:music];
    
	music = [[iWMusic alloc] init];
	music.name = @"Katy Perry";
	music.genre = @"Pop";
	[musicArray addObject:music];
    
	music = [[iWMusic alloc] init];
	music.name = @"DeadMau5";
	music.genre = @"Electronic";
	[musicArray addObject:music];
    
    UITabBarController *tabBarController =
    (UITabBarController *)self.window.rootViewController;
	UINavigationController *navigationController =
    [[tabBarController viewControllers] objectAtIndex:0];
	
    
	iWMusicsViewController *iWMusicsViewController =
    [[navigationController viewControllers] objectAtIndex:0];
	iWMusicsViewController.musicArray = musicArray;
    
    booksArray = [NSMutableArray arrayWithCapacity:20];
    
	iWBook *book = [[iWBook alloc] init];
	book.name = @"The Eye Of The World";
	book.author= @"Fiction";
	[booksArray addObject:book];
    
	book = [[iWBook alloc] init];
	book.name = @"Assassins Creed";
	book.author = @"Fiction";
	[booksArray addObject:book];
    
	book = [[iWBook alloc] init];
	book.name = @"Alex Ferguson";
	book.author = @"Sports";
	[booksArray addObject:book];
    
    
    
	UITabBarController *tabBarController2 =
    (UITabBarController *)self.window.rootViewController;
	UINavigationController *navigationController2 =
    [[tabBarController2 viewControllers] objectAtIndex:1];
    
	iWBooksViewController *iWBooksViewController =
    [[navigationController2 viewControllers] objectAtIndex:0];
	iWBooksViewController.booksArray = booksArray;
    
    filmArray = [NSMutableArray arrayWithCapacity:20];
    
	iWFilm *film = [[iWFilm alloc] init];
	film.name = @"Terminator";
	film .filmGenre = @"Action";
	[filmArray addObject:film ];
    
	film = [[iWFilm alloc] init];
	film.name = @"The Santa Clause";
	film.filmGenre = @"Comedy";
	[filmArray addObject:film];
    
	film  = [[iWFilm alloc] init];
	film.name = @"Thor";
	film.filmGenre = @"Action";
	[filmArray addObject:film ];
    
    UITabBarController *tabBarController3 =
    (UITabBarController *)self.window.rootViewController;
	UINavigationController *navigationController3 =
    [[tabBarController3 viewControllers] objectAtIndex:2];
	
    
	iWFilmViewController *iWFilmViewController =
    [[navigationController3 viewControllers] objectAtIndex:0];
	iWFilmViewController.filmArray = filmArray;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
