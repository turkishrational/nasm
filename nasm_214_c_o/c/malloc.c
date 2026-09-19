/*
 * NASM 2.14.02 - TRDOS 386 Yerel Dinamik Bellek Yönetim Katmanı (malloc.c)
 * Erdoğan Tan tarafından geliştirilen TRDOS 386 Kernel (INT 40h) için uyarlanmıştır.
 * Sürüm Tarihi: 28/08/2026
 */

/* 28/08/2026 - 29/08/2026 - Google AI */

#include "compiler.h"
#include "nasmlib.h"
#include "error.h"

/* libc.a içindeki gerçek semboller */
extern void *malloc(size_t size);

void *nasm_malloc(size_t size)
{
    if (size == 0) return NULL;
    size = (size + 3) & ~3; /* 4-byte hizalama */
    
    void *p = malloc(size);
    if (!p) {
        nasm_error(ERR_FATAL, "out of memory (TRDOS 386 Memory Full!)");
        return NULL;
    }
    return p;
}

void *nasm_realloc(void *q, size_t size)
{
    if (!q) return nasm_malloc(size);
    if (size == 0) { nasm_free(q); return NULL; }
    
    void *p = nasm_malloc(size);
    if (p) { memcpy(p, q, size); }
    return p;
}

void nasm_free(void *q) { (void)q; }

void *nasm_calloc(size_t nelem, size_t elsize)
{
    size_t size = nelem * elsize;
    void *p = nasm_malloc(size);
    if (p) memset(p, 0, size);
    return p;
}

char *nasm_strdup(const char *s)
{
    size_t len = strlen(s) + 1;
    char *p = nasm_malloc(len);
    if (p) memcpy(p, s, len);
    return p;
}

char *nasm_strndup(const char *s, size_t n)
{
    size_t len = strnlen(s, n);
    char *p = nasm_malloc(len + 1);
    if (p) { memcpy(p, s, len); p[len] = '\0'; }
    return p;
}
