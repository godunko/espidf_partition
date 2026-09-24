/*
 *  Copyright (C) 2026, Vadim Godunko
 *
 *  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

#include "esp_partition.h"

const int __ada_SIZEOF_esp_partition_t = sizeof(esp_partition_t);

const esp_partition_t* __ada_esp_partition_find_first(uint8_t partition_type, uint8_t partition_subtype, const char* label) {
    return esp_partition_find_first(partition_type, partition_subtype, label);
}