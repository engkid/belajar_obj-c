//
//  NSURLSession+NSURLSession_NetworkHelper.m
//  Obj-C Engkit
//
//  Created by Engkit Satia Riswara on 24/09/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

#import "NSURLSession+NSURLSession_NetworkHelper.h"

@implementation NSURLSession (NSURLSession_NetworkHelper)

typedef void (^LoginCompletionBlock)(NSData* response, NSError* error);

-(id)initWithURL: (NSString *) url andMethod: (NSString *) method {
    
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setHTTPMethod:method];
    [req setURL:[NSURL URLWithString:url]];
    
    return self;
}

-(void)request: (NSString *) url withParameters: (NSDictionary *) param completionHandler: (void (^)(NSData* response, NSError* error)) completion {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[self httpBodyForParameters:param]];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        completion(data, error);
        
    }] resume];
    
}

-(void)request:(NSString *)method withURL: (NSString *) url completionHandler: (void (^)(NSDictionary *responseDict, NSError *error)) completion {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod: method];
    [request setURL:[NSURL URLWithString:url]];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error: &error];
        
        completion(json, error);
        
    }] resume];
}

- (NSData *)httpBodyForParameters:(NSDictionary *)parameters {
    NSMutableArray *parameterArray = [NSMutableArray array];
    
    [parameters enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
        NSString *param = [NSString stringWithFormat:@"%@=%@", [self percentEscapeString:key], [self percentEscapeString:obj]];
        [parameterArray addObject:param];
    }];
    
    NSString *string = [parameterArray componentsJoinedByString:@"&"];
    
    return [string dataUsingEncoding:NSUTF8StringEncoding];
    
}

- (NSString *)percentEscapeString:(NSString *)string {
    NSCharacterSet *allowed = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~"];
    return [string stringByAddingPercentEncodingWithAllowedCharacters:allowed];
}

@end
