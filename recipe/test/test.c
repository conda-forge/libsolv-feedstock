#include <solv/pool.h>
#include <solv/solv_xfopen.h>

int main(int argc, char *argv[]) {
    Pool* pool = pool_create();
    pool_str2id(pool, "hello", /* create= */ 1);
    pool_free(pool);
    // libsolvext
    solv_fmemopen(NULL, 0, "bad-value");
}
