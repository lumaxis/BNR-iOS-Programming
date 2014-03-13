//
//  BNRItem.m
//  RandomItems
//
//  Created by Lukas Spieß on 07.03.14.
//  Copyright (c) 2014 Lukas Spieß. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

@synthesize itemName = _itemName;

- (NSString *)description {
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@(%@): Worth $%d, recorded on %@",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInDollars,
                                   self.dateCreated];
    return descriptionString;
}

- (void)setContainedItem:(BNRItem *)containedItem{
    _containedItem = containedItem;
    self.containedItem.container = self;
}

-(instancetype) initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber {
    // Call the superclass's designated initializer
    self = [super init];
    
    // Did the superclass's designated initializer succeed?
    if (self) {
        // Give the instance variables initial values
        
        // Valid but rather unsafe approach
        self.itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        // Set _dateCreated to the current date and time
        _dateCreated = [[NSDate alloc] init];
    }
    return self;
}

-(instancetype) initWithItemName:(NSString *)name {
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}

-(instancetype) init {
    return [self initWithItemName:@"Item"];
}

-(void) dealloc {
    NSLog(@"Destroyed: %@", self);
}

+ (instancetype) randomItem {
    // Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    // Create an immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    // Get the index of a random adjective/noun from the lists
    // Note: The % operator, called the modulo operator, gives
    // you the remainder. So adjectiveIndex is a randomnumber
    // from 0 to 2 inclusive
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    // Note that NSInteger is not an object, but a type definition
    // for "long"
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() %10,
                                    'A' + arc4random() %26,
                                    '0' + arc4random() %10,
                                    'A' + arc4random() %26,
                                    '0' + arc4random() %10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                       valueInDollars:randomValue
                                         serialNumber:randomSerialNumber];

    return newItem;
}
@end