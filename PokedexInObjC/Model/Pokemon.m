//
//  Pokemon.m
//  PokedexInObjC
//
//  Created by Nic Gibson on 7/2/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self) {
        _pokemonName = name;
        //self.pokemonName = name
        _identifier = identifier;
        _abilities = abilities;
    }
    return self;
}

@end

@implementation Pokemon (JSONConvertable)

// Dictionary comes from the JSON Data
- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    // Makes string "name" from the dictionary key value pair "name","value"
    NSString *name = dictionary[@"name"];
    // Let name = dictionary["name"] as? String
                                            // Force the integer to be the value we expect
    NSInteger identifier = [dictionary[@"id"] integerValue];
    NSArray *abilitiesDictionary = dictionary[@"abilities"];
    
    //checking for errors, not necessary
    //if the name is not a string, or if the abilitiesdictionary is not an array, return nil
    if (![name isKindOfClass:[NSString class]] || ![abilitiesDictionary isKindOfClass:[NSArray class]])
    {
        return nil;
    }
    //Making an array called abilities == let abilities: [String] = []
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc]init];
    //Opening up the dictionaries that are within the Abilities array
    for (NSDictionary *dictionary in abilitiesDictionary)
    {
        // Go into the upper level Abilities Dictionary to get the "ability" value from the key.
        NSDictionary *abilityDictionary = dictionary[@"ability"];
        // Go into the last level to grab the value from the "name" key.
        NSString *abilityName = abilityDictionary[@"name"];
        
        //Put the name into the array we made
        [abilities addObject:abilityName];
    }
    // We can now initialize a full pokemon now that we have the abilities. Return the initialized pokemon.
    return [self initWithPokemonName:name identifier:identifier abilities:abilities];
}

@end
