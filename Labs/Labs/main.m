// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Basics.h"
#import <stdlib.h>
#import <string.h>

int Foo;

static void Capitalize(char *word) {
    const char delta = 'a' - 'A';
    word[0] -= delta;
}

char *CreateCapitalizedWord(const char *word)
{
    // Compute size. Add 1 for '\0' delimiter.
    size_t size = strlen(word) + 1;
    // Allocate storage and store address in local variable.
    char *newWord = malloc(size);
    // Copy contents of word to newWord (including '\0' terminator).
    strcpy(newWord, word); // Capitalize newWord.
    Capitalize(newWord);
    // Return the address of the capitalized word.
    return newWord;
}

void DoPointerMath(void) {
//    Foo = 42;
    
    char name[] = "Fred Smith";
    char *charRef = name;
//    char *foo = "Fred Smith";
//    char *bar = "Fred Smith";
    
    // Prints: address is 0x7fff5fbff7dd, value is F
    printf("address is %p, value is %c\n", charRef, charRef[0]);
    printf("address is %p, value is %c\n", name, *name);
    
    // Prints: address is 0x7fff5fbff7de, value is r
    printf("address is %p, value is %c\n", &charRef[1], charRef[1]);
    printf("address is %p, value is %c\n", name + 1, *(name + 1));
    charRef += 5; // Moves the pointer past the substring “Fred “ // Prints: address is 0x7fff5fbff7e2, value is Smith
    printf("address is %p, value is %s\n", charRef, charRef);
}

int main(int argc, const char * argv[]) {
    Capitalize("hello!");
    DoPointerMath();
//    int foo = 3;
//    int *x = &foo, **y = &x;
//
//    printf("%p, %p\n", x, y);
    
    return 0;
}
