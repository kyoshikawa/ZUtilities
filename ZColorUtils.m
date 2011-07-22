//
//  ZColorUtils.m
//
//  Created by Kaz Yoshikawa on 12/31/09.
//  Copyright 2009 Electricwoods LLC. All rights reserved.
//

#import "ZColorUtils.h"
#import "NSScanner+Z.h"

#ifdef __cplusplus
extern "C" {
#endif

void RGBtoHSV(CGFloat r, CGFloat g, CGFloat b, CGFloat *h, CGFloat *s, CGFloat *v)
{
	assert(h);
	assert(s);
	assert(v);

    CGFloat min, max, delta;
    min = r;
    if (g < min)
	min = g;
    if (b < min)
	min = b;
    max = r;
    if (g > max)
	max = g;
    if (b > max)    
	max = b;
    *v = max;				// v
    delta = max - min;
    if(max != 0.0f)
	*s = delta / max;		// s
    else { // r,g,b= 0			// s = 0, v is undefined
	*s = 0.0f;
	*h = 0.0f; // really -1,
	return;
    }
    if(r == max)
	*h = (g - b) / delta;		// between yellow & magenta
    else if(g == max)
	*h = 2.0f + (b - r) / delta;	// between cyan & yellow
    else
	*h = 4.0f + (r - g) / delta;	// between magenta & cyan
    *h /= 6.0f;				// 0 -> 1
    if(*h < 0.0f)
	*h += 1.0f;

	// KAZ: avoid h to become NaN
	if (isnan(*h))
		*h = 0.0f;
}

void HSVtoRGB(CGFloat h, CGFloat s, CGFloat v, CGFloat *r, CGFloat *g, CGFloat *b)
{
	assert(r);
	assert(g);
	assert(b);

    CGFloat f, p, q, t;
    if(s == 0) { // grey
	*r = *g = *b = v;
	return;
    }
    if (h < 0.0f)
	h = 0.0f;
    h *= 6.0f;
    int sector = ((int)h) % 6;
    f = h - (CGFloat)sector;			// factorial part of h
    p = v * (1 - s);
    q = v * (1 - s * f);
    t = v * (1 - s * (1-f));
    switch(sector) {
	case 0: default:
	    *r = v; *g = t; *b = p;
	    break;
	case 1:
	    *r = q; *g = v; *b = p;
	    break;
	case 2:
	    *r = p; *g = v; *b = t;
	    break;
	case 3:
	    *r = p; *g = q; *b = v;
	    break;
	case 4:
	    *r = t; *g = p; *b = v;
	    break;
	case 5:
	    *r = v; *g = p; *b = q;
	    break;
    }
}

void CGColorToRGBA(CGColorRef colorRef, CGFloat *r, CGFloat *g, CGFloat *b, CGFloat *a)
{
	assert(colorRef);
	assert(r);
	assert(g);
	assert(b);
	assert(a);;

	switch (CGColorSpaceGetModel(CGColorGetColorSpace(colorRef))) {
	case kCGColorSpaceModelRGB: {
			assert(CGColorGetNumberOfComponents(colorRef) == 4);
			const CGFloat *components = CGColorGetComponents(colorRef);
			*r = components[0];
			*g = components[1];
			*b = components[2];
			*a = components[3];
		}
		break;
	case kCGColorSpaceModelMonochrome: {
			assert(CGColorGetNumberOfComponents(colorRef) == 2);
			const CGFloat *components = CGColorGetComponents(colorRef);
			*r = components[0];
			*g = components[0];
			*b = components[0];
			*a = components[1];
		}
		break;
	default:
		NSLog(@"ColorSpaceModel:%d", CGColorSpaceGetModel(CGColorGetColorSpace(colorRef)));
		assert(NO);
	}
}

void CGColorToHSV(CGColorRef colorRef, CGFloat *h, CGFloat *s, CGFloat *v, CGFloat *a)
{
	assert(colorRef);
	assert(h);
	assert(s);
	assert(v);

	CGFloat r, g, b;
	CGColorToRGBA(colorRef, &r, &g, &b, a);
	RGBtoHSV(r, g, b, h, s, v);
}

CGColorRef CGColorFromZRGBA(ZRGBA aRGBA)
{
	CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
	CGFloat components[] = {aRGBA.r, aRGBA.g, aRGBA.b, aRGBA.a};
	CGColorRef colorRef = CGColorCreate(colorSpaceRef, components);
	CGColorSpaceRelease(colorSpaceRef);
	[(id)colorRef autorelease];
	return colorRef;
}

CGColorRef CGColorFromZHSVA(ZHSVA aHSVA)
{
	return CGColorFromZRGBA(ZRGBAFromZHSVA(aHSVA));
}

UIColor *UIColorFromZRGBA(ZRGBA aRGBA)
{
	return [UIColor colorWithRed:aRGBA.r green:aRGBA.g blue:aRGBA.b alpha:aRGBA.a];
}

ZRGBA ZRGBAFromCGColor(CGColorRef colorRef)
{
	ZRGBA rgba;
	CGColorToRGBA(colorRef, &rgba.r, &rgba.g, &rgba.b, &rgba.a);
	return rgba;
}

ZHSVA ZHSVAFromCGColor(CGColorRef colorRef)
{
	ZHSVA hsva;
	CGColorToHSV(colorRef, &hsva.h, &hsva.s, &hsva.v, &hsva.a);
	return hsva;
}

ZRGBA ZRGBAFromRGBA(CGFloat r, CGFloat g, CGFloat b, CGFloat a)
{
	ZRGBA rgba = {r, g, b, a};
	return rgba;
}

ZRGBA ZRGBAFromHSV(CGFloat h, CGFloat s, CGFloat v, CGFloat a)
{
	ZRGBA rgba;
	HSVtoRGB(h, s, v, &rgba.r, &rgba.g, &rgba.b);
	rgba.a = a;
	return rgba;
}

ZHSVA ZHSVAFromRGBA(CGFloat r, CGFloat g, CGFloat b, CGFloat a)
{
	ZHSVA hsva;
	RGBtoHSV(r, g, b, &hsva.h, &hsva.s, &hsva.v);
	return hsva;
} 

ZRGBA ZRGBAFromZHSVA(ZHSVA aHSVA)
{
	return ZRGBAFromHSV(aHSVA.h, aHSVA.s, aHSVA.v, aHSVA.a);
}

ZHSVA ZHSVAFromZRGBA(ZRGBA aRGBA)
{
	return ZHSVAFromRGBA(aRGBA.r, aRGBA.g, aRGBA.b, aRGBA.a);
}

bool ZRGBAEqualToZRGBA(ZRGBA aRGBA1, ZRGBA aRGBA2)
{
	return (aRGBA1.r == aRGBA2.r &&
			aRGBA1.g == aRGBA2.g &&
			aRGBA1.b == aRGBA2.b &&
			aRGBA1.a == aRGBA2.a);
}

NSValue *ZRGBAValue(ZRGBA aRGBA)
{
	return [NSValue value:&aRGBA withObjCType:@encode(ZRGBA)];
}

ZRGBA ZRGBAFromValue(NSValue *aValue)
{
	assert(aValue && [aValue isKindOfClass:[NSValue class]]);

	ZRGBA rgba;
	[aValue getValue:&rgba];
	return rgba;
}

ZRGBA ZRGBAFromString(NSString *aString)
{
	NSUInteger r = 0x00;
	NSUInteger g = 0x00;
	NSUInteger b = 0x00;
	NSUInteger a = 0xff;

	NSUInteger hexdigits[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	NSScanner *scanner = [NSScanner scannerWithString:aString];
	scanner.charactersToBeSkipped = nil;
	NSInteger index = 0;

	if ([scanner peekChar] == '#') {
		[scanner scanCharacter:'#'];

		while (![scanner isAtEnd] && index < 8 && [scanner scanHexadecimalCharacter:&hexdigits[index]]) {
			index++;
		}
		
		[scanner scanCharactersFromSet:[NSCharacterSet whitespaceAndNewlineCharacterSet] intoString:nil];
		
		if (index == 8) {			// 'RRGGBBAA'
			r = hexdigits[0] << 4 | hexdigits[1];
			g = hexdigits[2] << 4 | hexdigits[3];
			b = hexdigits[4] << 4 | hexdigits[5];
			a = hexdigits[6] << 4 | hexdigits[7];
		}
		else if (index == 6) {		// 'RRGGBB'
			r = hexdigits[0] << 4 | hexdigits[1];
			g = hexdigits[2] << 4 | hexdigits[3];
			b = hexdigits[4] << 4 | hexdigits[5];
			a = 0xff;
		}
		else if (index == 4) {		// 'RGBA'
			r = hexdigits[0] << 4 | hexdigits[0];
			g = hexdigits[1] << 4 | hexdigits[1];
			b = hexdigits[2] << 4 | hexdigits[2];
			a = hexdigits[3] << 4 | hexdigits[3];
		}
		else if (index == 3) {		// 'RGB'
			r = hexdigits[0] << 4 | hexdigits[0];
			g = hexdigits[1] << 4 | hexdigits[1];
			b = hexdigits[2] << 4 | hexdigits[2];
			a = 0xff;
		}
		else {
			assert(false);
		}
	}
	else {
		assert(false);
	}
	return ZRGBAMake(r/255.0f, g/255.0f, b/255.0f, a/255.0f);
}

ZRGBA ZRGBAMake(CGFloat r, CGFloat g, CGFloat b, CGFloat a)
{
	ZRGBA rgba = {r, g, b, a};
	return rgba;
}


#ifdef __cplusplus
}
#endif
