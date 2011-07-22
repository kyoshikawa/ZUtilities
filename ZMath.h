//
//  ZMathUtils.h
//
//  Created by Kaz Yoshikawa on 10/07/24.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif

float fclumpf(float min, float max, float value);
double fclump(double min, double max, double value);

int ZMax(int a, int b);
int ZMin(int a, int b);

nt countfigures(int number, int unit);

#ifdef __cplusplus
}
#endif

i
//float interpolateFloatValue(float fromValue, float toValue, float ratio);
