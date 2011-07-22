//
//  ZMathUtils.m
//
//  Created by Kaz Yoshikawa on 10/07/24.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import "ZMath.h"

#ifdef __cplusplus
extern "C" {
#endif

float fclumpf(float min, float max, float value)
{
	return fmaxf(min, fminf(max, value));
}

double fclump(double min, double max, double value)
{
	return fmax(min, fmin(max, value));
}

int countfigures(int number, int unit)
{
	assert(number >= 0);
	assert(unit > 1);
	int figures = 0;
	while (number > 0) {
		figures++;
		number /= unit;
	}
	return MAX(figures, 1);
}

#pragma -

int ZMax(int a, int b)
{
	return (a > b) ? a : b;
}

int ZMin(int a, int b)
{
	return (a < b) ? a : b;
}


//float interpolateFloatValue(float fromValue, float toValue, float ratio)
//{
//	if (fromValue < toValue)
//		return fromValue + (toValue - fromValue) * ratio;
//	else
//		return toValue + (fromValue - toValue) * ratio;
//}

#ifdef __cplusplus
}
#endif
