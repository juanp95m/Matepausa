# C++ Piscine - Day 06 - From C Type Reinterpretation

We discovered or rediscovered in the previous video, that C cast would allow us to convert types to other types, and that we needed to rearrange the bits to make them match the new type. But there is another particular type of conversion which is very interesting, in which we have an identity cast. What I mean is that the base value keeps the same bits after conversion in the same order, so there is no actual conversion during the cast. This particular type of conversion, the identity conversion, is called a reinterpretation. Reinterpretation is a second cast effect, which we will discover together in this video. For that, here is a little example. We will work with an A variable of a float type, having a value 420.042. For example, this value will be our reference value. We will manipulate this value using addresses to highlight the notion of reinterpretation. I told you in the previous video that there is a hierarchy between types, some types were more accurate than others, and we had some restrictions to go from one to the other. Of course with this, of course with address types, we will have the same type of hierarchy. A particularly interesting address type, the void type, will allow us to store an address of any type. From there, we can say the void type is more generic than all the other address types. For example, the address of a float, which is a more accurate type than the void one. So we have again this notion of hierarchy, and we will find the same implications as in the case of a conversion for a reinterpretation. We can see on this line, the case of a reinterpretation of the address of a float as a void. Here we have an implicit reinterpretation, since as you can see, I haven't put anything between the equals and the ampersand. On the following line, we have the same interpretation, but with the explicit cast this time. I'm using the syntax with parentheses with the type to which I want a cast. So here we are reinterpreting the address of a float as an address on anything. We lost in accuracy, but gained in generosity. Of course, we'll have the same notions of hierarchy. We learned with the conversions, which means that in a case of promotion, moving from a more accurate address to a more generic one, it will be possible to make implicit promotion. There's no problem, since we are moving to a more generic type. However, the question is, what happens if I want to do the opposite? I mean, here I have my d variable, which is of the address on anything type, a void star, therefore a more generic type, and I would like to cast it. Reinterpret it as an int, reinterpret it as an int star type. What happens here? We can see that I'm doing a demotion, meaning gaining precision with my types, using a int star type. But remember, here I have the d variable, which is one of the address on anything type, and I was taking in particular the address of the a variable, which is itself of the float type. Here I want to reinterpret this address of float as an address of an integer. That's when the demotion, returning to a more accurate address type, can cause a real problem, in this case of implicit reinterpretation. I will just convert the address of a float into the address of an integer, and we saw in the previous video that the way the bits of integers, floats and doubles are encoded differ drastically. We'll find out that it will have a very annoying effect, however, if I actually want to have this reinterpretation, in the present case the example is stupid. But we could imagine hiding data in the structure. Make an explicit reinterpretation thanks to the syntax with brackets. In the case of an address demotion, therefore a descending reinterpretation, we will always privilege the explicit syntax to tell the compiler and the future developer who will use your code, that the demotion was made on purpose and wasn't a programming mistake. To highlight all these behaviors, I wrote a few lines below, which will allow us to output exact values. First we'll output the address of our float, as well as its value. Then I'll output the address values of my void star, so we'll see that it's indeed the same address as the one on the float, and right below I'll output the result of these three last lines, and more particularly, what we are actually interested in, these two lines, which will allow us to see that our float has been reinterpreted as an integer With the consequences you can imagine, let's make a little compilation to be sure of this. Here let's run it, so we can see that the address of our float was a random address on the stack, and the value was the one I gave it. By the way, we also see that the precision of the floats makes it impossible to represent exactly 420.042, but .041922 instead, which is the closest representable value in a float. Anyway, we can see that once I make my reinterpretation in a more generic type, we have no address issue, since this is an identity cast. It is a reinterpretation, the address is the same. Then here I see the two lines we are interested in, the one on which I reinterpret my void star, which is actually a float address as an integer address. I mean that at the end, I will be able to unreference my integer address to get the series of bits at the end, which is actually a float, but have it as an integer this time. Here we can see that when we take the bits of the floating value 420.041922 and reinterpret them directly, without conversion, as an integer value, we get an aberrant integer value, which has absolutely nothing to do with the original floating value. The point of all this is that we still have the notion of hierarchy through the address types. The void star type will be more generic than all the address types since we want accurate types. It will be possible to do promotions from an accurate type to a less accurate one, namely the void star, and an explicit or implicit one, since it works in this case, but we are losing accuracy. However, if you wish to regain accuracy, you'd have to be very careful with the type. We choose to reinterpret your address in. Here we can see that interpreting a float address as an integer address is clearly a programming mistake, since the final value is totally different. However, it's a behavior you might want. I spoke briefly about structures earlier. We can imagine manipulating different structures, having more or less identical fields using a void star generic pointer, then reinterpret them with the good values, to do more advanced things in C. It's totally possible, and it's even you sometimes, but that's the principle we are highlighting and in this case, you should never the implicit syntax, since you won't be able to tell the difference between what you actually want to do, and a programming mistake. So since it's for the conversion, in the reinterpretation, you should always, always, in the case of descending reinterpretation, use the explicit syntax to tell either the compiler or the user that you actually want to make this reinterpretation and potentially have a strange behavior. What I just showed with the reinterpretation is something we'll see again in a moment in the next videos. Keep in mind that with the classes, we'll have similar behaviors, although they are a little different in C++, but they work the same way. So it's important to understand that a cast can be an identity cast, meaning that the bits aren't reorganized, and this identity cast is a reinterpretation, and will allow this address tweaks with pointers, and to be able to switch to more generic or more accurate addresses with the related behaviors. That's it! I'll see you in a moment, for the next part of this video series on C-Cast. See you!

```
--- Inicio de extracción: Intra_Elearning_cpp_bootcamp_-_d06_-_01_from_c_type_reinterpreta_frames ---
42

iscine C++

av #06

Zz

iscine G++

ardO 6

Tho,

oct Gr
H ii

+2

4

a
|.

|
mac-studio® e main.c §

Loading cc-mode... yo
main.c for D6

Created on ; Thu Oct 23 12:01:04 2014
Made by : David “Thor” GIRON <thor@42,fr>

#include <stdio.h>

int main€ void > {
float a == 420.042F; /* Reference value LA
void * b = &a; /* Implicit reinterpretation cast */
void * ¢ = (void *) &a; /* Explicit reinterpretation cast */

Implicit promotion -> OK

Implicit demotion > Hazardeous

Explicit demotion Ok; —I-obey
printf( "%p, %f\n", &a, a );

printf( "%p\n", b );
printf( "%p\n", c );

printf( "%p\n", d );
printf( "%p, ¥d\n", e, *e );
printf( "%p, ¥d\n", f, *f );

return 0;

sheenenes

Loading cc-mode...done

in tiniainintndndntedl

main.c for D6 wf
Created on Thu Oct 23 12:01:04 2014 “sf
Made by David “Thor” GIRON <thor@42.fr> */

int main€ void > {
float a = 420.042f; /* Reference value of
void * b = &a; /* Implicit reinterpretation cast of
void * ¢ = (void *) &a; /* Explicit reinterpretation cast °/

printf( "%p, %f\n", &a, a );

printf( "%p\n", b );
printf( "%p\n", ¢ );

printf( "%p\n", d >;
printf( "Kp, %d\n", e, *e );
printf( "%p, %d\n", f, *f );

return @;

sus: ==-Fa 1 (C/1 Abbrev)

Loading cc-mode...done

~ main.c for 006 os

‘ld Created on : Thu Oct 23 12:01:04 2014 +
ied Made by : David “Thor” GIRON <thor@42.fr> be
/* of

/* PERO AEROEEEEEEESEOSESESSESDEESENEDNERESEHSEHESESESSRESESESSESESOSOSESSEES H/

#include <stdio.h>

int main€ void ) {
float a = 420.042f; /* Reference value “yf
void * b= &a; /* Implicit reinterpretation cast bel
void * c «= (void *) &a; /* Explicit reinterpretation cast “¥

Explicit demotion -> Ok,
printf( "%p, %f\n", &a, a );

printf( "Xp\n", b );
printf( "%p\n", c );

printf( "%p\n", d );
printf( "%p, ¥d\n", e, *e );
printf( "%p, Kd\n", f, *f );

return 0;

/* CEPOOHEH OER CEOOE SESE OOH ESSE OOH ERHORETEHSENOENOREOEEOESEESESSEOROSEHOESS &/

ALL

CC/1
Loading cc-mode...done

Abbrev) ------------------------ = =~ = 5223022 3 2 2 ono nn oon nnn oon 88 = === = =
y*
ye
ye
ys
js

/* serene

main.c for D6
Created on : Thu Oct 23 12:01:04 2014
"Thor"

Made by : David

.

#include <stdio.h>

GIRON <thor@42.fr>

ooo O/

~/
*/
*/
bef
*/
*/

int main€ void ) {

float

void *
void *

void *
int *
int *

printf¢

printf¢
printf¢

printf¢
printf¢
printf¢

a = 420.042f;

b= &a;
c = (void *) &a;

a

"

&a;
=d;

e
f Cint *D) d5

"Sp, %f\n", &a, a );

"Sp\n", b );
"Sp\n", ¢ D5

"Sp\n", d >;
"%p, Kd\n", e, *e );
"Kp, Kd\n", f, *f );

return 0;

/*
y*

ye

Reference value

Implicit reinterpretation cast
Explicit reinterpretation cast

Implicit promotion
Implicit demotion
Explicit demottor

> Ok

>» Hazardeous

-> Ok,

I

obey

be

oy
*/
of

*/

‘sad main.c for D006 Led

fe Created on ; Thu Oct 23 12:01:04 2014 A
igs Made by : David “Thor” GIRON <thor@42.fr> of
js *

/[* PEPER ROEEEORESSSOSESESSESOEESENSDNERESEHEEHESEOEAERESESESSESESOSOSESSEES &/

#include <stdio.h>

int main€ void ) {
float a = 420.042f; /* Reference value */
void * b= &a; /* Implicit reinterpretation cast of
void * c # (void *) &a; /* Explicit reinterpretation cast a
void * d_ = &a; /* Implicit promotion -> Ok of

printf( "%p, %f\n", &a, a );

printf( "Xp\n", b );
printf( "%p\n", c );

printf( "%p\n", d );
printf( "%p, Kd\n", e, *e );
printf( "%p, Kd\n", f, *f );

return 0;

/® PERO HEHee RCE OOS OSE OOH OOEOEOHEHEEHORETEHSEHOENOREOEEEESEESESSEOHOSEHOESS © /

Loading cc-mode...done

SSSSSTSOSS

* main.c for D006 oy
‘ind Created on ; Thu Oct 23 12:01:04 2014 be
id Made by : David “Thor” GIRON <thor@42,fr> be 3
ae be

[+ PEPER ROROOHOERSEEOOSEESESESTSESERETEOEEEEEEEHESEOEESHSESESESESESESESENSESS H/

#include <stdio.h>

int main€ void ) {
float a = 420.042f; /* Reference value os
void * b = &a; /* Implicit reinterpretation cast %
void * c = (void *) &a; /* Explicit reinterpretation cast °/
void * d = &a; /* Implicit promotion -> Ok of

1

Hazardeous
Explicit demotion -> Ok, I obey

printf( "%p, %f\n", &a, a );

printf( "Xp\n", b );
printf( "%p\n", c );

printf( "%p\n", d );
printf( "%p, %d\n", e, *e );
printf( "%p, ¥d\n", f, *f );

return 0;

/[* SEPOOeeN eee eee OHS EEE eH EOSEES ENON OHEEHHEEHOEHOEEOEESESEESESSEOHEREREESE © /

ALL

(C/L_ Abbrev) ==------------------- 2-3-5252 - 55 2523 2 nnn 5 2 nnn no nnn 3 nnn no ann a a ene

Loading cc-mode...done
Bac*studiox*e*mat ose *
/* .
zsh: suspended emacs «nw mainvc® *
mac-studiok ff nm; Thu Oct 01:04 2014 7
/* r" GIRON <thore42.f ‘

& SORTER O RRS T Rete eee e eee eter tee eeneeneneoenerteeeetenneeenereeteettseesttee ©

#include <stdio.h>

int main€ void ) {
float a = 420.042f; * Reference value °
void * b = &a; * Ime ‘ oat .
void *® ¢ = (void *) &a; © Ext t reinte etat ast .
void * d = &a; * Implicit promot k »
int * e m=d; * Impli eou *
int* £ «= Cint 4; * Explict -> Ok, ‘ *

printf( "Xp, %f\n", &a, a );

printf¢ "
printfc "
, bd;
»c 25

printf( "%p\n", d );
printf( "%p, %d\n", e, *e );
printf( "%p, %d\n", f, *f );

return Q;

sUUsco=sbd All (C/1 Abbrev)-
Loading cc-mode...done

mac-studio% e main.c

zsh: suspended emacs -nw main.c
mac-studio®% gcc -Wall -Wextra -Werror main.c
mac-studio% ./a,out

Ox7FfF5247eaa04,

Ox7FFFS247e004
Ox7FFFS247e004
Ox7FFFS247eaa4, 1137837408
Ox7FFF5247ea04, 1137837408
mac-studiox J

mac-studio% e main.c

zsh: suspended emacs -nw main.c
mac-studio®% gcc -Wall -Wextra -Werror main.c
mac-studio% ./a,out

Ox7Ffff5247eaa04,

Ox7FFF5247e004
Ox7FFFS247e004
Ox7FFFS247eaa4, 1137837408
Ox7FFF5247ea04, 1137837408
mac-studiox J

mac-studio% e main.c

zsh: suspended
mac-studio% gcc

mac-studio® ./a,

Ox7ffF5S247eaa4,
Ox7FfF5247e004
Ox7ffF5247e004
Ox7FFF5S247e004
Ox7FFFS247eaQ4,
Ox7fFF5247e0a04,
mac-studiox J

emacs -nw main.c
-Wall -Wextra -Werror main.c
out

1137837408
1137837408

mac-studio% e main.c

zsh: suspended emacs -nw main.c

mac-studio% gcc -Wall -Wextra -Werror main.c

mac-studio% ./a.out

axziTTS2A7e00 OE en SS
Ox7F FF5247e0a04

Ox7F FF5247e004

Ox7FFFS247e004

Ox7FFFS247eaa4, 1137837408

Ox7FFFS247e004, 1137837408

mac-studiox fj

mac-studio% e main.c

zsh: suspended emacs -nw main.c

mac-studio% gcc -Wall -Wextra -Werror main.c

mac-studio% ./a.out

BxcTE SRN FOG» “BARONY
Ox7F FFS247e0a04

Ox7F FF5247e004

Ox7FFFS247e004

Ox7FFFS247eaa4, 1137837408

Ox7FFFS247e004, 1137837408

mac-studiox fj

mac-studio% e main.c

zsh: suspended emacs -nw main.c
mac-studio% gcc -Wall -Wextra -Werror main.c
mac-studio® ./a,out

Ox7FFfFS247eaa4, 420.041992

a ——————

Ox7F fF FS247ea04
Ox7FFFS247eaa4, 1137837408
Ox7FFFS247ea04, 1137837408
mac-studiok fj

mac-studio% e main.c

zsh: suspended emacs -nw main.c
mac-studio% gcc -Wall -Wextra -Werror main.c
mac-studio% ./a.out

Ox7FFFS247eaa4, 420.041992

TT

Ox7FFF5S247ea004
Ox7FFFS247eaa4, 1137837408
Ox7FFFS247ea04, 1137837408
mac-studiok fj

mac-studio% e main.c

zsh: suspended emacs -nw main.c
mac-studio% gcc -Wall -Wextra -Werror main.c
mac-studio% ./a,out

Ox7FFFS247eaa4, 420.041992

0x7 Ff fF5S247e004

Ox7F FF5S247e004

Ox7F fFS247e004

studio’

mac-studio® e main.c

zsh: suspended emacs -nw main.c

mac-studio® gcc -Wall -Wextra -Werror main.c

mac-studio% ./a.out

BEF OR A REIN i eee
Ox7F fF5247e0a04

Ox7FfFS247e004

Ox7FFFS247e004

Ox7FFFS247eaa4, 1137837408

Ox7FFF5247eaa4, 1137837408

mac-studiok

mac-studio® e main.c

zsh: suspended emacs -nw main.c

mac-studio® gcc -Wall -Wextra -Werror main.c

mac-studio% ./a.out
a
Ox7FFF5247e0a04

Ox7FfFS247e004

Ox7FFFS247e004

Ox7FFFS247eaa4, 1137837408

Ox7FFF5247eaa4, 1137837408

mac-studio%

mac-studio% e main.c

zsh: suspended emacs -nw main.c

mac-studio% gcc -Wall -Wextra -Werror main.c

mac-studio® ./a,out

Ox7FFFS247eaa4, 420.041992

Ox7F fF5247e0a04

Ox7F fF5S247e004

x74 524700
Ox7FFFS247eaa4, 1137837408

Ox7FFF5247eaa4, 1137837408

mac-studiok

oo:

main.c for 006

Created on : Thu Oct 23 12:01:04 2014

{> Made by : David “Thor” GIRON <thor@42.fr>
y*

/t SRPRROREESHOEES OSES ESSE EEHESESEEENSEEEDHEEHEEEEHERESSEESESO OSES ESSESEESS %/

#include <stdio.h>

/[b EPONOOROOROeE SOOO OSE OOH OOEOEOHEHEEREESEETEEHOEREHEEHEEEEOESESEOOEEOEHEOES O/

int main€ void > {
float ai = 420.042f; /* Reference value */
void * b= &a; /* Implicit reinterpretation cast be af
void * c «= (void *) &a; /* Explicit reinterpretation cast A
void * d= &a; /* Implicit promotion -> Ok bef
int * e = d; /* Implicit demotion -> Hazardeous | iA

ee ee ————eE——EEEEEEEEEEEEE=EE=E
printf( "Kp, %f\n", &a, a );

printf( "%p\n", b );
printf( "%p\n", c );

printf( "Xp\n", d );
printf( "%p, ¥d\n", e, *e );
printf( "%p, %d\n", f, *f );

return Q;

/b CRROEROREOEO OREO EEERSEHTRSSESEEHESHORHORTOEHOEHEREOHESEROESESESEHOREHOSOS 6 /

main.c for 006 *y
Created on Thu Oct 23 12:01:04 2014 */
Made by : David “Thor” GIRON <thor@42.fr> of

#include <stdio.h>

int main€ void ) {
float a= 420.042f; /* Reference value /
void * b= &a; /* Implicit reinterpretation cast *f
void * c «= (void *) &a; /* Explicit reinterpretation cast */
void * d = &a; /* Implicit promotion -> Ok */
int * e =d; Implicit demotion -> Hazardeous |

printf( "Xp, %f\n", Ba, a );

printf( "%p\n", b );
printf( "%p\n", c );

printf¢
printf¢
printf¢

return Q;

-uu-:---Fi All (C/1L Abbrev)

ba main.c for 006

/* Created on : Thu Oct 23 12:01:04 2014

[> Made by : David “Thor” GIRON <thor@42.fr>
ye

[+ RPEAREEESHEEESESEOSEESESESESEESERSENSHESENEEHOEEEEESESESEOSSESESSESSESSEES H/

#include <stdio.h>

eens

int main€ void > {
float a = 420.042f; /* Reference value oy
void * b = ba; /* Implicit reinterpretation cast of
void * c «= (void *) &a; /* Explicit reinterpretation cast */
void * d = &a; /* Implicit promotion -> Ok of
int * e = d; /* Implicit demotion -> Hazardeous | of

xplicit
printf( "Xp, *f\n", &a, a );

printf( "Xp\n", b );
printf( "%p\n", c );

printf( "%p\n", d );
printf( "%p, ¥d\n", e, *e );
printf( "%p, %d\n", f, *f );

return 0;

[b> CEHOROReOHO OOO OR OEE ONTO OHO OOHESHOEHORHERHOEH ERE OHEEESOESESESOHOEEHOSOS O/

/* */

ba main.c for 006 a
Q Created on Thu Oct 23 12:01:04 2014 be
/* Made by : David “Thor” GIRON <thor@42.fr> /
ye

y+

#include <stdio.h>

seeeeeee

int main€ void > {
float a = 420,042f; /* Reference value /
void * b = ba; /* Implicit reinterpretation cast ef
void * ¢ = (void *) &a; /* Explicit reinterpretation cast */
void * d = &a; /* Implicit promotion -> Ok of
int * e =d /* Implicit demotion -> Hazardeous | of

ref int =): rrr

printf( "Xp, %f\n", &a, a );

printf( "%p\n", b );
printf( "%p\n", ¢ );

printf( "%p\n", d );
printf( "Kp, %d\n", e, *e )
printf( "%p, %d\n", f, *f );

return 0;

-uu-1---F1 ALL (C/L Abbrev)
```

---

---

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d06_-_00b_from_c_type_conversion.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_00b_from_c_type_conversion.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d06_-_02_from_c_type_qualifier_re.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_02_from_c_type_qualifier_re.md) →
