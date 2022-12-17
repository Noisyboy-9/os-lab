#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define SHARED_MEMORY_SIZE 50

int main() {
    int shared_memory;
    key_t key = 3232;

//    create shared memory
    if ((shared_memory = shmget(key, SHARED_MEMORY_SIZE, IPC_CREAT | 0666)) < 0) {
        perror("shmget() failed for some reason");
        exit(EXIT_FAILURE);
    }

//    attach to shared memory
    char *shm;
    if ((shm = shmat(shared_memory, NULL, 0)) == (char *) -1) {
        perror("shmat");
        exit(EXIT_FAILURE);
    }

    printf("Writing my message\n");
    sprintf(shm, "Hello world from the writer process");

    printf("Waiting for the reader\n");
    while (*shm != '#') {
        sleep(1);
    }

    printf("Detach from shared memory\n");
    if (shmdt(shm) == -1) {
        perror("shmdt() error");
        exit(EXIT_FAILURE);
    }

    if (-1 == (shmctl(shared_memory, IPC_RMID, NULL))) {
        perror("shmctl error");
        exit(EXIT_FAILURE);
    }

    exit(EXIT_SUCCESS);
}
