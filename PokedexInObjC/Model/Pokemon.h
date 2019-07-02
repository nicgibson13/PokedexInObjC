//
//  Pokemon.h
//  PokedexInObjC
//
//  Created by Nic Gibson on 7/2/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pokemon : NSObject


@property (nonatomic, copy, readonly) NSString *pokemonName;
// let pokemonName: String
@property (nonatomic, readonly) NSInteger identifier;
// let identifier: Integer
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;
// *1 is for the individual strings, *2 is for the array of abilities

- (instancetype)initWithPokemonName:(NSString *)name
                         identifier:(NSInteger)identifier
                          abilities:(NSArray<NSString *> *)abilities;
//init(name: String, identifier: Int, abilities: [String]) {}
@end

@interface Pokemon (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;
//init(with dictionary: [String:Any]) {}

@end

NS_ASSUME_NONNULL_END
