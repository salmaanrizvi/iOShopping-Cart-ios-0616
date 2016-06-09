//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Salmaan Rizvi on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"
#import "FISItem.h"


@implementation FISShoppingCart

-(NSUInteger)calculateTotalPriceInCents {
    
    NSUInteger totalPrice = 0;
    for (FISItem *item in self.items) {
        totalPrice += [item priceInCents];
    }
    return totalPrice;
}

-(void)addItem:(FISItem *)item {
    
    [self.items addObject:item];
}

-(void)removeItem:(FISItem *)item {
    
    NSUInteger firstMatchingItem = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:firstMatchingItem];
}

-(void)removeAllItemsLikeItem:(FISItem *)item {
    
    [self.items removeObject:item];
}

-(void)sortItemsByNameAsc {
    
    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = @[nameDescriptor];
    [self.items sortUsingDescriptors:sortDescriptors];
}

-(void)sortItemsByNameDesc {
    
    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    NSArray *sortDescriptors = @[nameDescriptor];
    [self.items sortUsingDescriptors:sortDescriptors];
}

-(void)sortItemsByPriceInCentsAsc {
    
    NSSortDescriptor *priceDescriptor = [[NSSortDescriptor alloc] initWithKey:@"priceInCents" ascending:YES];
    NSArray *sortDescriptors = @[priceDescriptor];
    [self.items sortUsingDescriptors:sortDescriptors];
}

-(void)sortItemsByPriceInCentsDesc {
    
    NSSortDescriptor *priceDescriptor = [[NSSortDescriptor alloc] initWithKey:@"priceInCents" ascending:NO];
    NSArray *sortDescriptors = @[priceDescriptor];
    [self.items sortUsingDescriptors:sortDescriptors];
}

-(NSArray *)allItemsWithName:(NSString *)name {
    
    NSMutableArray *itemsWithName = [[NSMutableArray alloc] init];
    
    for (FISItem *itemInCart in self.items) {
        if ([itemInCart.name isEqualToString:name]) {
            [itemsWithName addObject:itemInCart];
        }
    }
    
    return [[NSArray alloc] initWithArray:itemsWithName];
}

-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price {
    
    NSMutableArray *itemsWithPrice = [[NSMutableArray alloc] init];
    
    for (FISItem *itemInCart in self.items) {
        if (itemInCart.priceInCents >= price) {
            [itemsWithPrice addObject:itemInCart];
        }
    }
    
    return [[NSArray alloc] initWithArray:itemsWithPrice];
}

-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price {
   
    NSMutableArray *itemsWithPrice = [[NSMutableArray alloc] init];
    
    for (FISItem *itemInCart in self.items) {
        if (itemInCart.priceInCents <= price) {
            [itemsWithPrice addObject:itemInCart];
        }
    }
    
    return [[NSArray alloc] initWithArray:itemsWithPrice];
}


@end
