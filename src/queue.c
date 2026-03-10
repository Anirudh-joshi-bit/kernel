#include "../include/commons.h"

/* queue functions */
void queue_init (queue_t* q, uint8_t size){
    q->size = size;
    q->front = 0xff;
    q->rare = 0;
}

uint8_t queue_push (queue_t* q, user_process_t* process){
    if (q->front == 0xff){
        /* queue is empty */
        q->front = 0;
    }
    else if (q->rare == q->front) return -1;

    q->processes [q->rare] = process;
    q->rare = (q->rare + 1) % q->size;

    return 0;
}

uint8_t queue_pop (queue_t* q){   
    if (q->front == 0xff){
        /* q is empty*/
        return -1;
    }
    q->front = (q->front + 1) % q->size;
    if (q->front == q->rare){
        q->front = 0xff;
        q->rare = 0;
    }
    return 0;
}

user_process_t* queue_front (queue_t *q){
    if (q->front == 0xff)
        return NULL;
    return q->processes [q->front];
}

