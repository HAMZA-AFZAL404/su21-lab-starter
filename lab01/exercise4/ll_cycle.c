#include <stddef.h>
#include "ll_cycle.h"

// int ll_has_cycle(node *head) {
//     /* TODO: Implement ll_has_cycle */
// }


int ll_has_cycle(struct node *head) {
    if (head == NULL) {
        return 0;
    }

    struct node *slow_ptr = head;
    struct node *fast_ptr = head->next;

    while (fast_ptr != NULL && fast_ptr->next != NULL) {
        if (fast_ptr == slow_ptr) {
            return 1;
        }

        slow_ptr = slow_ptr->next;
        fast_ptr = fast_ptr->next->next;
    }

    return 0;
}