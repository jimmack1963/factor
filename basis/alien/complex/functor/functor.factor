! Copyright (C) 2009 Slava Pestov.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors alien alien.c-types classes.struct math
math.functions sequences arrays kernel functors vocabs.parser
namespaces quotations ;
IN: alien.complex.functor

FUNCTOR: define-complex-type ( N T -- )

N-type IS ${N}

T-class DEFINES-CLASS ${T}

<T> DEFINES <${T}>
*T DEFINES *${T}

WHERE

STRUCT: T-class { real N-type } { imaginary N-type } ;

: <T> ( z -- alien )
    >rect T-class <struct-boa> >c-ptr ;

: *T ( alien -- z )
    T-class memory>struct [ real>> ] [ imaginary>> ] bi rect> ; inline

T-class c-type
<T> 1quotation >>unboxer-quot
*T 1quotation >>boxer-quot
complex >>boxed-class
drop

;FUNCTOR
