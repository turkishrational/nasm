/* ----------------------------------------------------------------------- *
 *
 *   Copyright 1996-2017 The NASM Authors - All Rights Reserved
 *   See the file AUTHORS included with the NASM distribution for
 *   the specific copyright holders.
 *
 *   Redistribution and use in source and binary forms, with or without
 *   modification, are permitted provided that the following
 *   conditions are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above
 *     copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided
 *     with the distribution.
 *
 *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
 *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
 *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * ----------------------------------------------------------------------- */

/* 28/08/2026 - Google AI */

#ifndef ILOG2_H
#define ILOG2_H

#include "compiler.h"
#include <limits.h>

/* Fonksiyonların prototipleri */
extern int const_func ilog2_32(uint32_t v);
extern int const_func ilog2_64(uint64_t v);
extern int const_func alignlog2_32(uint32_t v);
extern int const_func alignlog2_64(uint64_t v);

/* Sadece ilog2.c derlenirken gerçek gövdeleri buraya yazıyoruz */
#ifdef ILOG2_C

#define ROUND(v, a, w)                                  \
    do {                                                \
        if (v & (((UINT32_C(1) << w) - 1) << w)) {      \
            a  += w;                                    \
            v >>= w;                                    \
        }                                               \
    } while (0)

int const_func ilog2_32(uint32_t v)
{
    int p = 0;
    ROUND(v, p, 16);
    ROUND(v, p,  8);
    ROUND(v, p,  4);
    ROUND(v, p,  2);
    ROUND(v, p,  1);
    return p;
}

int const_func ilog2_64(uint64_t vv)
{
    int p = 0;
    uint32_t v;
    v = vv >> 32;
    if (v)
        p += 32;
    else
        v = vv;
    ROUND(v, p, 16);
    ROUND(v, p,  8);
    ROUND(v, p,  4);
    ROUND(v, p,  2);
    ROUND(v, p,  1);
    return p;
}

int const_func alignlog2_32(uint32_t v)
{
    if (v & (v-1))
        return -1;
    return ilog2_32(v);
}

int const_func alignlog2_64(uint64_t v)
{
    if (v & (v-1))
        return -1;
    return ilog2_64(v);
}

#undef ROUND
#endif /* ILOG2_C */

#endif /* ILOG2_H */
