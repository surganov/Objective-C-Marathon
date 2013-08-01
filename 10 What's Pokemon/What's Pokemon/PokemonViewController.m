//
//  PokemonViewController.m
//  What's Pokemon
//
//  Created by Sergey Surganov on 31.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "PokemonViewController.h"
#import "AnswerViewController.h"
#import "NSArray+Random.h"

@interface PokemonViewController ()

@property (nonatomic, strong) NSString *randomPokemon;
@property (nonatomic, strong) NSArray *pokemonFiles;
@property (nonatomic, strong) NSString *answer;

@end

@implementation PokemonViewController

@synthesize randomPokemon = _randomPokemon;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.pokemonFiles = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pokemonsFiles" ofType:@"plist"]];
	self.answer = self.randomPokemon;
	NSLog(@"%@",self.answer);
}

- (NSString *)randomPokemon
{
	return [self.pokemonFiles randomObject];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"rotation"]) {
		[segue.destinationViewController setAnswer:self.answer];
	}
}


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	if (toInterfaceOrientation == UIDeviceOrientationLandscapeLeft ||
		toInterfaceOrientation == UIDeviceOrientationLandscapeRight) {
		[self performSegueWithIdentifier:@"rotation" sender:self];
	}
}

@end
