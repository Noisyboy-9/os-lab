#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define SHARED_MEMORY_SIZE 50

int main() {
    int shared_memory_id;
    key_t key = 3232;

//    create the shared memory
    if ((shared_memory_id = shmget(key, SHARED_MEMORY_SIZE, 0666)) < 0) {
        perror("shmget() error");
        exit(1);
    }

//    attach to shared memory
    char *shm;
    if ((shm = shmat(shared_memory_id, NULL, 0)) == (char *) -1) {
        perror("shmat() ");
        exit(1);
    }


    printf("%s\n", shm);

    *shm = '#';

    exit(EXIT_SUCCESS);
}
